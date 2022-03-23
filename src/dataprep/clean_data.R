#step 4

library(tidyverse)
library(assertive)
library(dplyr)
library(readr)

#Real file
private_room <- read.csv(file = '../../gen/dataprep/output/private_room.csv')

#Calculate the mean prices per city

mean_price_cities <- aggregate(private_room$price, list(private_room$city), FUN=mean)
names(mean_price_cities)[1]<- "city"
names(mean_price_cities)[2]<- "mean_price"

#calculate the mean availability per city
mean_availability <- aggregate(private_room$availability_365, list(private_room$city), FUN=mean)
names(mean_availability) [1]<- "city"
names(mean_availability) [2]<- "mean_availability"

#Calculate the mean reviews per city
mean_reviews <- aggregate(private_room$review_scores_rating, list(private_room$city), FUN=mean)
names(mean_reviews)[1]<- "city"
names(mean_reviews)[2]<- "mean_reviews1"

#Change the currency from DKK to euro

mean_price_cities_euro <- mean_price_cities %>%
  mutate(mean_price = case_when(city == 'copenhagen' ~ mean_price * 0.10,
                                TRUE ~ as.numeric(mean_price)))

#Change pound to euro

mean_price_cities_euro1 <- mean_price_cities_euro %>%
  mutate(mean_price = case_when(city == 'london' ~ mean_price / 1.19,
    TRUE ~ as.numeric(mean_price))) %>%
      mutate(mean_price = case_when(city == 'manchester' ~ mean_price / 1.19,
        TRUE ~ as.numeric(mean_price))) %>%
          mutate(mean_price = case_when(city == 'edinburgh' ~ mean_price / 1.19,
            TRUE ~ as.numeric(mean_price)))

#combine the mean_price, mean_reviews, mean_availability in one dataframe

combined_mean_data <- cbind(mean_price_cities_euro1, mean_reviews, mean_availability)
combined_mean_data1 <-combined_mean_data[-c(3, 5)]


#Download output

write.csv(combined_mean_data1, "../../gen/dataprep/input/combined_mean_data1.csv", row.names = FALSE)


write.csv(combined_mean_data1, 'combined_mean_data1.csv')

