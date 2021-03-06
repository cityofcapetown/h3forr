geo_to_sf_ <- function(lat_lng_obj) {
  as.data.frame(lat_lng_obj) %>%
    sf::st_as_sf(coords = 2:1, crs = 4326)
}

#' Parse [lat, lng] points to object of class \code{sf}
#'
#' @param lat_lng_obj numeric vector or matrix with [lat, lng] points as returned
#' from \link{h3_to_geo} or \link{h3_to_geo_boundary} with \code{format_as_geojson = FALSE};
#' a list of matrices is also supported
#'
#' @return object of class \code{sf} (geometry type: \code{POINT})
#'
#' @example inst/examples/api-reference/geo-to-sf.R
#'
#' @name geo_to_sf
#' @export
geo_to_sf <- function(lat_lng_obj) {
  UseMethod("geo_to_sf", lat_lng_obj)
}

#' @name geo_to_sf
#' @export
geo_to_sf.matrix <- geo_to_sf_

#' @name geo_to_sf
#' @export
geo_to_sf.numeric <- function(lat_lng_obj) {
  matrix(lat_lng_obj, ncol = 2) %>%
    geo_to_sf_()
}

#' @name geo_to_sf
#' @export
geo_to_sf.list <- function(lat_lng_obj) {
  lat_lng_obj <- lapply(seq_along(lat_lng_obj), function(idx) {
    cbind(lat_lng_obj[[idx]], idx)
  })
  do.call(rbind, lat_lng_obj) %>%
    geo_to_sf_()
}
