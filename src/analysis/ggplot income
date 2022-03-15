grafiek2 <- private_room2 %>%
  group_by(city)  %>%
  summarize(meanincome = mean(income))


ggplot(grafiek2, aes(x = meanincome, y= city, color = city)) + geom_point()
