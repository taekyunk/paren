#' Concatenate all elements and surround the result by ()
#'
#' Concatenate the elements in x into a string and surround the result by parentheses.
#' This does not add single quote to each element
#'
#' @param x vector
#'
#' @return a character string
#'
#' @examples
#' paren:::add_paren(1:5)
add_paren <- function(x){
    middle <- paste(x, collapse = ",")
    paste0("(", middle, ")")
}


#' Put each element in single quotes
#'
#' @param x vector
#'
#' @return a character string
#'
#' @examples
#' paren:::single_quote_each(letters[1:5])
single_quote_each <- function(x){
    paste0("'", x, "'")
}


#' Surround the elements in parenthesis with optional single quotes
#'
#' Mainly to use with SQL IN operator.
#' Surround the elements in parenthesis.
#' Each element will be single quoted depending on the data type.
#'
#' @param x vector
#'
#' @return a character string
#' @export
#'
#' @examples
#' paren(1:5)
#' paren(letters[1:5])
#' # Use as follows to build SQL queries
#' paste("select * from schema.table where id in", paren(1:5), ";")
#' paste("select * from schema.table where id in", paren(letters[1:6]), ";")
paren <- function(x){
    if(is.numeric(x)){
        add_paren(x)
    }  else {
        add_paren(single_quote_each(x))
    }
}
