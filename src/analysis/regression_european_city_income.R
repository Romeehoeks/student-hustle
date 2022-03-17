library(dplyr)

#regression European City - Income (Price * coverage)
totalincome <- mutate(mean_price_cities_euro1, income = price * availability_365)
View(private_room2)

reg3 = lm( income ~ city, data = private_room2)
summary(reg3)

#ggplot Income
grafiek2 <- private_room2 %>%
  group_by(city)  %>%
  summarize(meanincome = mean(income))


ggplot(grafiek2, aes(x = meanincome, y= city, color = city)) + geom_point()

#save the plot to a pdf
ggsave("myplot.meanincome.pdf")
