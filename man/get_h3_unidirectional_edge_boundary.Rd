% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/h3_edges.R
\name{get_h3_unidirectional_edge_boundary}
\alias{get_h3_unidirectional_edge_boundary}
\title{Get the vertices of a given edge as an array of [lat, lng] points}
\usage{
get_h3_unidirectional_edge_boundary(h3_edge_index,
  format_as_geojson = TRUE)
}
\arguments{
\item{h3_edge_index}{character vector representing H3 edge indexes}

\item{format_as_geojson}{whether to return [lng, lat] points instead of of [lat, lng]}
}
\value{
numeric matrix (2x2); list of matrices if multiple indexes are supplied
}
\description{
Get the vertices of a given edge as an array of [lat, lng] points
}
\note{
Edges that cross the edge of an icosahedron face may return 3 coordinates.
}
