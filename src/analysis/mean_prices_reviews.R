#plot the mean prices. As you can see the price in dublin is the highest, and in manchester the lowest.

ggplot(mean_price_cities_euro1, aes(x= city, y=mean_price, color = city)) +
  geom_point() 
ggsave("mean_price.pdf")

#create a table for the mean reviews per city

mean_reviews <- aggregate(private_room$review_scores_rating, list(private_room$city), FUN=mean)
names(mean_reviews)[1]<- "city"
names(mean_reviews)[2]<- "mean_reviews1"

#plot the mean reviews per city. As you can see the highest score is in edinburgh, the lowest is in barcelona

ggplot(mean_reviews, aes(x= city, y=mean_reviews1, color = city)) +geom_point()
ggsave("mean_reviews.pdf")

#combine the mean_price, mean_reviews, mean_availability in one dataframe

combined_mean_data <- cbind(mean_price_cities_euro1, mean_reviews, mean_availability)
combined_mean_data1 <-combined_mean_data[-c(3, 5)]

#Plot the mean reviews per city with the mean price per city

ggplot(combined_mean_data1, aes(x= mean_reviews1, y=mean_price, color=city))+
  geom_point()

#Check if price and reviews have a relationship

reg1 <- lm(review_scores_rating ~ price, data = private_room)
summary(reg1)

#check if reviews and availability have a relationship

reg2 <- lm(review_scores_rating ~ availability_365, data = private_room)
summary(reg2)

#combine the mean_price and mean_reviews in one dataframe

combined_mean_data <- cbind(mean_price_cities_euro1, mean_reviews)
combined_mean_data1 <- subset(test, select = -city)

#change the column order

combined_mean_data1 <- combined_data[, c(2,1,3)]

#Plot the mean reviews per city with the mean price per city

ggplot(combined_data1, aes(x= mean_reviews1, y=mean_price, color=city))+
  geom_point()

#regression with multiple variables

regression <- lm(review_scores_rating ~ price + availability_365 + short_stay +city, data=private_room)
summary(regression)

#plot of our regression model

plot <- plot(allEffects(regression))
ggsave("regression_plot.pdf")
