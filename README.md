<!-- README.md is generated from README.rmd. Please edit that file -->
homicidios
==========

**homicidios** es un paquete de datos de R con datos anuales del tamaño de la población, el numero de homicidios y las tasas de homicidio (por cada 100 mil habitantes) para los municipios de Colombia entre 1990 y 2013.

Instalación
-----------

Para instalarlo es necesario tener [`devtools`](https://github.com/hadley/devtools) instalado:

``` r
    install.packages("devtools")
    devtools::install_github("nebulae-co/saber")
```

Uso
---

Una vez instalado se puede cargar para tener acceso al `data.frame` `homicidios`:

``` r
library("homicidios")

head(homicidios)
```

    #>      id id_depto  municipio     depto  año poblacion homicidios     tasa
    #> 1 05001       05   Medellín Antioquia 1990   1688394       3924 232.4102
    #> 2 05002       05  Abejorral Antioquia 1990     24789         33 133.1236
    #> 3 05004       05   Abriaquí Antioquia 1990      3201          5 156.2012
    #> 4 05021       05 Alejandría Antioquia 1990      4851          7 144.3001
    #> 5 05030       05      Amagá Antioquia 1990     23606         31 131.3225
    #> 6 05031       05     Amalfi Antioquia 1990     18535         25 134.8800

Pueden ver detalles en la documentación: `?homicidios`.

Fuente
------

Los datos fueron recolectados de diferentes fuentes y organizados originalmente por [Alejadron Pelaez](https://twitter.com/apelaez) y [Javier Moreno](https://github.com/finiterank) para esta visualización interactiva: <http://finiterank.github.io/homicidios> (acá el repositorio: <http://github.com/finiterank/homicidios>).
