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

#Deleting NA values in Price

private_room <- private_room[!is.na(private_room$price), ]

#create a dummy for short stay 
short_stay <- ifelse(private_room$maximum_nights <= 2, 1, 0)
private_room <- data.frame(private_room,
                           short_stay)

#Calculate the mean prices per city

mean_price_cities <- aggregate(private_room$price, list(private_room$city), FUN=mean)
names(mean_price_cities)[1]<- "city"
names(mean_price_cities)[2]<- "mean_price"

#calculate the mean availability per city
mean_availability <- aggregate(private_room$availability_365, list(private_room$city), FUN=mean)
names(mean_availability) [1]<- "city"
names(mean_availability) [2]<- "mean_availability"

#Change the currency from DKK to euro

mean_price_cities_euro <- mean_price_cities %>%
  mutate(mean_price = case_when(city == 'copenhagen' ~ mean_price * 0.10,
                                TRUE ~ as.numeric(mean_price)))

#Change pound to dollar

mean_price_cities_euro1 <- mean_price_cities_euro %>%
  mutate(mean_price = case_when(city == 'london' ~ mean_price / 1.19,
    TRUE ~ as.numeric(mean_price))) %>%
      mutate(mean_price = case_when(city == 'manchester' ~ mean_price / 1.19,
        TRUE ~ as.numeric(mean_price))) %>%
          mutate(mean_price = case_when(city == 'edinburgh' ~ mean_price / 1.19,
            TRUE ~ as.numeric(mean_price)))

write.csv(filtered_data, 'filtered_data.csv')
write.csv(private_room, 'private_room.csv')
write.csv(mean_price_cities_euro1, 'mean_price_cities_euro1.csv')

