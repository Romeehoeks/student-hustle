library(dplyr)

#regression European city - Customer satisfaction
reg1 = lm( review_scores_rating ~ city, data = private_room)
summary(reg1)

#ggplot Customer satisfaction
grafiek1 <- private_room2 %>%
  group_by(city)  %>%
  summarize(meanscore = mean(review_scores_rating))


ggplot(grafiek1, aes(x = meanscore, y= city, color = city)) + geom_point()

#save the plot to a pdf
ggsave("myplot.reviews.pdf")
