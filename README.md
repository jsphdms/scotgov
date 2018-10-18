
<!-- README.md is generated from README.Rmd. Please edit that file -->
scotgov
=======

[![Travis-CI Build Status](https://travis-ci.org/jsphdms/scotgov.svg?branch=master)](https://travis-ci.org/jsphdms/scotgov)

:construction: :construction: :construction: **Package under construction - watch this space for updates** :construction: :construction: :construction:

Use scotgov to download data from [statistics.gov.scot](http://statistics.gov.scot/home) with a single line of R code. scotgov removes the need to write SPARQL code; you simply need the URI of a dataset. scotgov can be used interactively, or as part of a [reproducible analytical pipeline](https://ukgovdatascience.github.io/rap_companion/).

Installation
------------

Install from GitHub:

``` r
# install.packages("devtools")
devtools::install_github("jsphdms/scotgov")
```

Or you can install from source:

1.  Go to the scotgov [repository](https://github.com/jsphdms/scotgov) on GitHub
2.  Click **Clone or download** then **Download ZIP**
3.  Save the file locally (e.g. your H drive)
4.  Unzip the file
5.  Install with `install.packages()`

``` r
install.packages("your/directory/scotgov-master/scotgov-master", repos = NULL,
                 type="source", lib = "your/R/package/library/directory")
```

Having trouble installing from source? Check you followed the steps above precisely; a small error can cause the install to fail. The best approach is to copy the code above into a text editor and carefully update the two directories. In particular, notice the repetition of **scotgov-master**.

Usage
-----

You can download an entire dataset, or filter by date and/or geography. We recommend filtering large datasets. If you require a full download of a large dataset, you may need to contact [statistics.gov.scot](http://statistics.gov.scot/home).

### Without filtering

You will always need the last part of the URI for your dataset. Find this on the [statistics.gov.scot](http://statistics.gov.scot/home) web page for your dataset (in the API tab). For example, the full URI for [Average Household Size](https://statistics.gov.scot/resource?uri=http%3A%2F%2Fstatistics.gov.scot%2Fdata%2Faverage-household-size) is:

`http://statistics.gov.scot/data/average-household-size`

you just need the last part:

`average-household-size`

Once you have the last part of the URI, set this as the `dataset` parameter for `scotgov_get()`:

``` r
library(scotgov)

household_size <- scotgov_get(dataset = "average-household-size")
head(household_size)
#>   FeatureCode DateCode Measurement                Units Value
#> 1   S12000039     2015       Ratio People Per Household  2.09
#> 2   S12000039     2010       Ratio People Per Household  2.14
#> 3   S12000039     2005       Ratio People Per Household  2.21
#> 4   S12000039     2012       Ratio People Per Household  2.13
#> 5   S12000039     2007       Ratio People Per Household  2.18
#> 6   S12000039     2006       Ratio People Per Household  2.19
```

### With filtering

Filtering is useful for large data sets. The filtering parameters for `scotgov_get()` are:

-   `start_date`
-   `end_date`
-   `geography`

#### Filter by date

Use either `start_date` **OR** `end_date` to filter datapoints before or after a certain date:

``` r
# library(dplyr)

household_size_2010_onwards <- scotgov_get(dataset = "average-household-size",
                                           start_date = 2010)
#> Warning in if (query != "") {: the condition has length > 1 and only the
#> first element will be used
# %>%
#   arrange(refPeriod)

head(household_size_2010_onwards)
#>         refArea value
#> 1 Aberdeenshire  2.39
#> 2 Aberdeenshire  2.38
#> 3 Aberdeenshire  2.34
#> 4 Aberdeen City  2.08
#> 5 Aberdeen City  2.09
#> 6 Aberdeen City  2.10
```

Use `start_date` **AND** `end_date` to filter datapoints within a certain timeframe.

#### Filter by geography

Specify a single geography using an S code:

``` r
household_size_S12000039 <- scotgov_get(dataset = "average-household-size",
                                           geography = "S12000039")
#> Warning in if (query != "") {: the condition has length > 1 and only the
#> first element will be used

head(household_size_S12000039)
#>               refArea value
#> 1 West Dunbartonshire  2.09
#> 2 West Dunbartonshire  2.12
#> 3 West Dunbartonshire  2.09
#> 4 West Dunbartonshire  2.27
#> 5 West Dunbartonshire  2.10
#> 6 West Dunbartonshire  2.13
```

Future development
------------------

Currently `scotgov_get()` is the only function available. This package is under active development, so any further functionality will be mentioned here when it's ready. If something important is missing, feel free to contact the contributors or [add a new issue](https://github.com/jsphdms/scotgov/issues).

Since this package is under active development, breaking changes may be necessary. We will make it clear once the package is reasonably stable.
