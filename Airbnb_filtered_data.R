# Demo to download all of Europe's listing data to R
library(googledrive)
library(readr)
library(tidyverse)
library(dplyr)

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
View(downloaded_dat

#Select the data we need to use for our research
student_data <- downloaded_data %>%
  select("name", "host_listings_count", "neighbourhood_group_cleansed", "city", "property_type", "price", "availability_365", "number_of_reviews", "review_scores_rating")

#calculate the average number of reviews, filter above the average of number of reviews, filter availability above 0 and filter the number of hostings on 0
max(student_data$number_of_reviews)
min(student_data$number_of_reviews)
mean(student_data$number_of_reviews)

filtered_data <- student_data %>%
  filter(host_listings_count == 1, number_of_reviews >23, availability_365 >0)

#There are several numbers of private rooms, find the different types of private rooms (24 different types of private rooms)
table(filtered_data$property_type)
private_room <- filtered_data %>% filter(grepl('Private room in bungalow|Private room in cabin|Private room in casa particular|Private room in castle|Private room in chalet Private room|Private room in condominium (condo)|Private room in cottage|Private room in floor|Private room in guest suite|Private room in guesthouse|Private room in hostel|Private room in houseboat|Private room in loft|Private room in rental unit|Private room in residential home|Private room in serviced apartment|Private room in tiny house|Private room in townhouse|Private room in treehouse|Private room in villa', property_type))
