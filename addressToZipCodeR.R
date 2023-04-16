rm(list=ls())
gc()
directory = "~/Documents/Masters/data712/"
setwd(directory)

library(httr)
library(readr)
library(xml2)


#' @title zipcode_from_address()
#' @description  Get zipcode from an address, using USPS Api
#' @section see link below for more details
#'   https://www.usps.com/business/web-tools-apis/address-information-api.htm
#' @author Seth
#'
#' @param address_1 Delivery Address in the destination address. May contain
#'   secondary unit designator, such as APT or SUITE, for Accountable mail).
#'   Optional
#' @param address_2 Delivery Address in the destination address. Required.
#' @param city City name of the destination address. Optional
#' @param state Two-character state code of the destination address. Optional.
#' @param secret_key usps_key. get your own.
#' @returns a string
#'
#' @example Queens college # usps_key is the name of the file where my secret
#'   key is stored. Get your own. `secret_key = read_file("usps_key")`
#'   `zipcode_from_address(address_2="65-30 Kissena Blvd", city="Queens",
#'   state="NY", secret_key=secrety_key)
#' @export
zipcode_from_address <- function(address_1="", address_2, city="", state="", secret_key){
  queryString <- list('xml'= paste0(
    "<ZipCodeLookupRequest USERID=\""
    ,secret_key
    ,"\"><Address><Address2>"
    ,address_2
    ,"</Address2><City>"
    ,city
    ,"</City><State>"
    ,state
    ,"NY</State></Address></ZipCodeLookupRequest>"
  )
  ,'API' = "ZipCodeLookup"
  )
  # The url endpoint. Same for everyone.
  url <- "http://production.shippingapis.com/ShippingAPI.dll"
  # What is the encoding scheme
  encode <- "raw"
  response <- VERB("GET", url, query = queryString, content_type("application/xml"), encode = encode)
  
  # Get zipcode in one line. convert binary to xml, get the xml node with zip5, 
  # get the output/value of the node
  xml_text(xml_find_all(read_xml(response), ".//Zip5"))
}


# Example in action
secret_key = read_file("usps_key")
response = zipcode_from_address(address_2="65-30 Kissena Blvd", city="Queens", state="NY", secret_key = secret_key)
print(response)
