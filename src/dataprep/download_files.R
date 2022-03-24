#step 1
#download packages
install.packages("googledrive", repos= 'https://mirror.lyrahosting.com/CRAN/')
install.packages("readr", repos= 'https://mirror.lyrahosting.com/CRAN/')
install.packages("tidyverse", repos= 'https://mirror.lyrahosting.com/CRAN/')
install.packages("dplyr", repos= 'https://mirror.lyrahosting.com/CRAN/')
install.packages("assertive", repos= 'https://mirror.lyrahosting.com/CRAN/')
install.packages("stringr", repos= 'https://mirror.lyrahosting.com/CRAN/')
install.packages("ggplot2", repos= 'https://mirror.lyrahosting.com/CRAN/')
install.packages("‘AggregateR", repos= 'https://mirror.lyrahosting.com/CRAN/')
install.packages("effects", repos= 'https://mirror.lyrahosting.com/CRAN/')
install.packages("knitr", repos= 'https://mirror.lyrahosting.com/CRAN/')
install.packages("ggpubr", repos= 'https://mirror.lyrahosting.com/CRAN/')
install.packages("markdown", repos= 'https://mirror.lyrahosting.com/CRAN/')



#step 2
library(googledrive)
library(readr)

#Download the files through google drive

data_id <-"1p-4gvEglcpfqD9qkLsU0oAsCDOBKgjZNHG4QfXOFaS0"
drive_download(as_id(data_id), path = "airbnb_europe.csv", overwrite = TRUE)

#read the airbnb file

df <- read_csv("airbnb_europe.csv")

urls <- as.character(df$link)

datasets <- lapply(urls, function(url) {
  print(paste0('Now downloading ... ', url))
  city = tolower(as.character(df$city[match(url, df$link)]))
  
  res = read_csv(url)
  res$city <- city
  return(res)
})

#Combine the data into 1 dataset

downloaded_data = do.call('rbind', datasets) 

#Export to csv
dir.create('../../gen')
dir.create('../../gen/dataprep')
dir.create('../../gen/dataprep/data')
write.csv(downloaded_data, "../../gen/dataprep/data/downloaded_data.csv", row.names = FALSE)



write.csv(downloaded_data, 'downloaded_data.csv')

