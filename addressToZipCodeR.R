rm(list=ls())
gc()
directory = "~/Documents/Masters/data712/"
setwd(directory)

library(httr)
library(readr)
library(xml2)

# see link below for more details
# https://www.usps.com/business/web-tools-apis/address-information-api.htm#_Toc110511817
params = list(
   # Delivery Address in the destination address. May contain secondary unit 
   # designator, such as APT or SUITE, for Accountable mail.). Optional
   address1 = ""
   # Delivery Address in the destination address. Required.
  ,address2 = "65-30 Kissena Blvd"
  # City name of the destination address. Optional
  ,city = "Queens"
  # Two-character state code of the destination address. Optional.
  ,state = "NY"
)

# usps_key is the name of the file where my secret key is stored. Get your own.
secret_key = read_file("usps_key")

queryString <- list('xml'= paste0(
    "<ZipCodeLookupRequest USERID=\""
    ,secret_key
    ,"\"><Address><Address2>"
    ,params$address2
    ,"</Address2><City>"
    ,params$city
    ,"</City><State>"
    ,params$state
    ,"NY</State></Address></ZipCodeLookupRequest>"
  )
  ,'API' = "ZipCodeLookup"
)
# The url endpoint. Same for everyone.
url <- "http://production.shippingapis.com/ShippingAPI.dll"
# What is the encoding scheme
encode <- "raw"
response <- VERB("GET", url, query = queryString, content_type("application/xml"), encode = encode)

#convert binary response to readable xml
temp = read_xml(response)
# get the xml nodes that are Zip5. I copied this from stackoverflow. I don't
# know how it works.
nodes = xml_find_all(temp, ".//Zip5")
# get the output/value of this node
xml_text(nodes)

# Get zipcode in one line
# xml_text(xml_find_all(read_xml(response), ".//Zip5"))