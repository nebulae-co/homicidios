library("curl")
library("dplyr")
library("tidyr")
library("colmaps") # devtools::install_github("nebulae-co/colmaps")

# Get the data
data_url <- paste("https:/", "github.com", "finiterank", "homicidios", "blob",
                  "master", "data", "homicidios.1990.a.2013.Rda?raw=true",
                  sep = "/")

download_if_not_exists <- function(url, destfile){
  if (!file.exists(destfile))
    curl_download(url, destfile)
  file.exists(destfile)
}

download_if_not_exists(data_url, destfile = "data-raw/h.df.rda")


# Load and tidy
load(file = "data-raw/h.df.rda")

datos <- tbl_df(h.df) %>%
  mutate(cod = formatC(cod, width = 5, flag = "0"))

homicidios <- datos  %>%
  gather(año, homicidios, starts_with("hom")) %>%
  select(cod, año, homicidios) %>%
  mutate(año = gsub("hom9", "199", x = año),
         año = gsub("hom0", "200", x = año),
         año = gsub("hom1", "201", x = año),
         año = as.integer(año))

poblacion <- datos  %>%
  gather(año, poblacion, starts_with("pob")) %>%
  select(cod, año, poblacion) %>%
  mutate(año = gsub("pob9", "199", x = año),
         año = gsub("pob0", "200", x = año),
         año = gsub("pob1", "201", x = año),
         año = as.integer(año))

homicidios <- inner_join(poblacion, homicidios) %>%
  mutate(poblacion = ifelse(poblacion == 0 & homicidios >= 0, NA_integer_, poblacion),
         tasa = 100000 * homicidios / poblacion)

municipios <- municipios@data

homicidios <- inner_join(municipios, homicidios, by = c("id" = "cod")) %>%
  arrange(año, id)

# tasa <- datos  %>%
#   gather(año, tasa0, starts_with("tas")) %>%
#   select(cod, año, tasa0) %>%
#   mutate(año = gsub("tas9", "199", x = año),
#          año = gsub("tas0", "200", x = año),
#          año = gsub("tas1", "201", x = año),
#          año = as.integer(año))
#
# homicidios0 <- inner_join(homicidios, tasa)
# homicidios0 %>% filter(abs(tasa - tasa0) > 1) %>% View
# homicidios0 %>% filter(xor(is.na(tasa), is.na(tasa0))) %>% View

devtools::use_data(homicidios)
