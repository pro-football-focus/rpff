## Package names
#packages <- c("httr", "jsonlite",'Matrix',"data.table")

## Install packages not yet installed
#installed_packages <- packages %in% rownames(installed.packages())
#if (any(installed_packages == FALSE)) {
#  install.packages(packages[!installed_packages])
#}

## Packages loading
#invisible(lapply(packages, library, character.only = TRUE))

#' GrahpQL Function
#'
#' This function sets the GraphQL paramaters for you.
#' @export
#' GQL()
GQL <- function(query,
                variables = NULL
               ){

  key = Sys.getenv("x-api-key")
  url = Sys.getenv('pff-api-url')

  headers = c(
    'x-api-key' = key,
    'Content-Type' = 'application/json'
  )

  method = 'POST'

  if(is.null(variables)){
    body = paste('{"query":"',query,'","variables":{}}')
  }
  else{
    body = paste('{"query":"',query,'","variables":',variables,'}')
  }
  res <- VERB(method, url = url, body = gsub("\\n", "", body), add_headers(headers))

  data_raw <- jsonlite::fromJSON(rawToChar(res$content))

  return(data_raw)
}