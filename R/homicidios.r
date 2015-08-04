#' Colombian population and homicides data
#'
#' A dataset containing the yearly population, homicides and homicide rate (per
#' hundred thousand inhabitants) of the 1122 colombian municipalities (cities,
#' towns and smaller populated administrative areas) for the period from 1990 to
#' 2013.
#'
#' @format A data frame with:
#' \describe{
#'   \item{id}{official municipality id as defined by the
#'      \href{http://dane.gov.co}{National Department of Statistics (DANE)},
#'      character}
#'   \item{id_depto}{official department id in which the municipality is
#'      circumbscribed, character}
#'   \item{municipio}{name of the municipality}
#'   \item{depto}{department name}
#'   \item{año}{year}
#'   \item{poblacion}{estimated population}
#'   \item{homicidios}{registered homicides}
#'   \item{tasa}{homicide rate per hundred thousand inhabitants}
#' }
#'
#' @source Data originally gathered from different sources by Alejandro Pelaez and Javier
#'         Moreno. See the repository and an interactive visualization:
#' \url{http://github.com/finiterank/homicidios/}
#' \url{http://finiterank.github.io/homicidios/}
#'
"homicidios"
