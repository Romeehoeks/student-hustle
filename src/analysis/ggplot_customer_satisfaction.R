grafiek1 <- private_room2 %>%
  group_by(city)  %>%
  summarize(meanscore = mean(review_scores_rating))


ggplot(grafiek1, aes(x = meanscore, y= city, color = city)) + geom_point()
