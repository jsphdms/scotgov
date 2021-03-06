#' Find all geographies that contain, a certain geography
#'
#' \code{ods_find_higher_geographies} returns a dataset from \href{https://statistics.gov.scot/}{statistics.gov.scot} of all geographies which contain the geography provided
#'
#' The \code{geography} parameter must be passed a valid geography unit.
#'
#' @param geography \code{string}. A valid geography unit from \href{https://statistics.gov.scot/}{statistics.gov.scot}.
#'
#' @return \code{tibble}.
#'
#' @examples
#' ods_find_higher_geographies("S02001257")
#'
#' @export

ods_find_higher_geographies <- function(geography) {

  endpoint <- "http://statistics.gov.scot/sparql"

  query_text <- read_query_file("find_higher_level_geographies")
  query <- glue::glue(query_text, geography, .open = "[", .close = "]")
  query_data <- ods_query_database(endpoint, query)

  return(query_data)

}
