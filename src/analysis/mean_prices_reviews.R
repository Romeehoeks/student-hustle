
#plot the mean prices. As you can see the price in dublin is the highest, and in manchester the lowest.
ggplot(mean_price_cities_euro1, aes(x= city, y=mean_price, color = mean_price)) +
  geom_point() 
ggsave("mean_price.pdf")

#create a table for the mean reviews per city
mean_reviews <- aggregate(private_room$review_scores_rating, list(private_room$city), FUN=mean)
names(mean_reviews)[1]<- "city"
names(mean_reviews)[2]<- "mean_reviews1"

#plot the mean reviews per city. As you can see the highest score is in edinburgh, the lowest is in barcelona
ggplot(mean_reviews, aes(x= city, y=mean_reviews1, color = mean_reviews1)) +geom_point()
ggsave("mean_reviews.pdf")

#Check if price and reviews have a relationship
reg1 <- lm(review_scores_rating ~ price, data = private_room)
summary(reg1)

#export data
write.csv(mean_reviews, 'mean_reviews.csv')
