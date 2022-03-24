#step 1
#download packages
install.packages("googledrive", repos= 'http://cran.us.r-project.org')
install.packages("readr", repos= 'http://cran.us.r-project.org')
install.packages("tidyverse", repos= 'http://cran.us.r-project.org')
install.packages("dplyr", repos= 'http://cran.us.r-project.org')
install.packages("assertive", repos= 'http://cran.us.r-project.org')
install.packages("stringr", repos= 'http://cran.us.r-project.org')
install.packages("ggplot2", repos= 'http://cran.us.r-project.org')
install.packages("‘AggregateR", repos= 'http://cran.us.r-project.org')
install.packages("effects", repos= 'http://cran.us.r-project.org')
install.packages("knitr", repos= 'http://cran.us.r-project.org')
install.packages("ggpubr", repos= 'http://cran.us.r-project.org')
install.packages("markdown", repos= 'http://cran.us.r-project.org')


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

