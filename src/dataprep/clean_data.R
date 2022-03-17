#step 3
#load libraries
library(tidyverse)
library(dplyr)
library(assertive)
library(ggplot2)

#Combine the data into 1 dataset
combined_data = do.call('rbind', datasets) 
downloaded_data <- write_csv(combined_data, 'combined_city_data.csv')
View(downloaded_data)

#Select the data we need to use for our research
student_data <- downloaded_data %>%
  select("name", "host_listings_count", "neighbourhood_group_cleansed", "city", "property_type", "price", "availability_365", "number_of_reviews", "review_scores_rating")

#calculate the average number of reviews, filter above the average of number of reviews, filter availability above 0 and filter the number of hostings on 0
max(student_data$number_of_reviews)
min(student_data$number_of_reviews)
mean(student_data$number_of_reviews)

View(df)

filtered_data <- student_data %>%
  filter(host_listings_count == 1, number_of_reviews >23, availability_365 >0)

#There are several numbers of private rooms, find the different types of private rooms (24 different types of private rooms)
table(filtered_data$property_type)
private_room <- filtered_data %>% filter(grepl('Private room in bungalow|Private room in cabin|Private room in casa particular|Private room in castle|Private room in chalet Private room|Private room in condominium (condo)|Private room in cottage|Private room in floor|Private room in guest suite|Private room in guesthouse|Private room in hostel|Private room in houseboat|Private room in loft|Private room in rental unit|Private room in residential home|Private room in serviced apartment|Private room in tiny house|Private room in townhouse|Private room in treehouse|Private room in villa', property_type))

#Check if the variables are numeric
is.numeric(private_room$host_listings_count)
is.numeric(private_room$price)
is.numeric(private_room$availability_365)
is.numeric(private_room$number_of_reviews)
is.numeric(private_room$review_scores_rating)
class(private_room$price)
assert_is_numeric(private_room$price)    

#Remove dollar sign from prive to convert as nummeric
private_room$price = as.numeric(gsub("\\$", "", private_room$price))
is.numeric(private_room$price)

#Finding duplicates
duplicated(private_room)
sum(duplicated(private_room))

ggsave("table.private_room.pdf")

