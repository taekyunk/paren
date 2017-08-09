<!-- README.md is generated from README.Rmd. Please edit that file -->
paren
=====

The goal of parens is to offer a utility function `paren()` to build a list of values for SQL IN operator. `paren()` will add single quote to each element when the data type is not numeric.

Install
-------

    # install.packages('devtools')
    devtools::install_github("taekyunk/paren")

Example
-------

This is a basic example of using `paren()` with SQL IN operator.

``` r
id_char <- as.character(1:5)
id_num <- 3:8

# paren() will add single quotes if the field is not numeric
paren(id_char)
#> [1] "('1','2','3','4','5')"
paren(id_num)
#> [1] "(3,4,5,6,7,8)"

# to match character with numeric
paren(as.numeric(id_char))
#> [1] "(1,2,3,4,5)"

# to match numeric with character
paren(as.character(id_num))
#> [1] "('3','4','5','6','7','8')"

# typical use case will be something like this
query <- paste("select * from tablename where id in", paren(id_num), ";")
print(query)
#> [1] "select * from tablename where id in (3,4,5,6,7,8) ;"
```
