#download packages
install.packages("googledrive")
install.packages("readr")
install.packages("tidyverse")
install.packages("dplyr")
install.packages("assertive")
install.packages("stringr")

# Load the packagaes to R
library(googledrive)
library(readr)
library(tidyverse)
library(dplyr)
library(assertive)
library(stringr)


####Dataprep#####

#Download the files through google drive
data_id <-"1p-4gvEglcpfqD9qkLsU0oAsCDOBKgjZNHG4QfXOFaS0"
drive_download(as_id(data_id), path = "airbnb_europe.csv", overwrite = TRUE)

"Clean.R"

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

#Create a table for the top 10 student cities in Europe ascending

Top10_student_cities <- matrix(c("London", "Munich", "Berlin", "Paris", "Zurich", "Vienna", "Edinburgh", "Barcelona","Dublin", "Manchester"), ncol=1, byrow=TRUE)
colnames(Top10_student_cities) <- c("City")
rownames(Top10_student_cities) <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
Top10_student_cities <- as.table(Top10_student_cities)
Top10_student_cities

#Create a loop for the position of the student cities
cities <- c("London", "Munich", "Berlin", "Paris", "Zurich", "Vienna", "Edinburgh", "Barcelona","Dublin", "Manchester")

for(i in 1:length(cities)) {
  print(paste(cities[i], "is the number",
              i, "city in Europe"))
}

###Analysis###

#regression European City - Coverage
reg = lm( availability_365 ~ city, data = private_room)
summary(reg)

#regression European City - Customer Satisfaction

reg1 = lm( review_scores_rating ~ city, data = private_room)
summary(reg1)

#regression European City - Income (Price * coverage)
private_room2 <- mutate(private_room, income = price * availability_365)
View(private_room2)

reg3 = lm( income ~ city, data = private_room2)
summary(reg3)





#Rest (attractiveness)
private_room3 <- mutate(private_room2, availability_365 * review_scores_rating * income)
View(private_room3)

#multiple regression
private_room4 <- mutate(private_room2, number = as.numeric(city))
View(private_room4)

reg4 <- lm(city ~ review_scores_rating + availability_365 + income, data = private_room2)
summary(reg4)

as.factor(private_room2$city) levels = "1", "2", "3", "4", "5", "6", "7", "8", "9", "10"

as.numeric(private_room2$city)


#city by numbers
citynumbers <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10")
factor <- factor(citynumbers)
levels(factor) <- c("barcelona", "berlin", "copenhagen", "dublin", "edinburgh", "london", "manchester", "munich", "paris", "vienna")

barcelona <- factor[1]
berlin <- factor[2]
copenhagen <- factor[3]
dublin <- factor[4]
edinburgh <- factor[5]
london <- factor[6]
manchester <- factor[7]
munich <- factor[8]
paris <- factor[9]
vienna <- factor[10]

private_room2$city <- as.numeric(private_room2$city, levels=c(barcelona, berlin, copenhagen, dublin, edinburgh, london, manchester, munich, paris, vienna), labels=c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10"))
View(private_room2)

#regression but does not make sense?
reg4 <- lm(city ~ review_scores_rating + availability_365 + income, data = private_room2)
summary(reg4)
