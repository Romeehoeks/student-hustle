#Download the files through google drive
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
