#step 2
#Download the files through google drive
library(googledrive)
data_id <-"1p-4gvEglcpfqD9qkLsU0oAsCDOBKgjZNHG4QfXOFaS0"
drive_download(as_id(data_id), path = "airbnb_europe.csv", overwrite = TRUE)

#read the airbnb file
library(readr)
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

###### HIER HOEVEN GEEN PDF VAN TE DOWLOADEN DENK IK???? #####
