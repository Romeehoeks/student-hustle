grafiek <- private_room2 %>%
  group_by(city)  %>%
  summarize(mean365 = mean(availability_365))


ggplot(grafiek, aes(x = mean365, y= city, color = city)) + geom_point() + expand_limits(x = 0)
