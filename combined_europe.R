# Demo to download all of Europe's listing data to R
library(googledrive)
library(readr)
library(tidyverse)

data_id <-"1p-4gvEglcpfqD9qkLsU0oAsCDOBKgjZNHG4QfXOFaS0"
drive_download(as_id(data_id), path = "airbnb_europe.csv", overwrite = TRUE)
df <- read_csv("airbnb_europe.csv")
View(df)

urls <- as.character(df$link)

datasets <- lapply(urls, function(url) {
  print(paste0('Now downloading ... ', url))
  city = tolower(as.character(df$city[match(url, df$link)]))
  
  res = read_csv(url)
  res$city <- city
  return(res)
})

combined_data = do.call('rbind', datasets) 
downloaded_data <- write_csv(combined_data, 'combined_city_data.csv')
View(downloaded_data)


