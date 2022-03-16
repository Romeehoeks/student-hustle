library(dplyr)

#regression European City - Coverage
reg = lm( availability_365 ~ city, data = private_room)
summary(reg)


#gplot Coverage
grafiek <- private_room2 %>%
  group_by(city)  %>%
  summarize(mean365 = mean(availability_365))


ggplot(grafiek, aes(x = mean365, y= city, color = city)) + geom_point() + expand_limits(x = 0)

#save the plot to pdf
ggsave("myplot.availability.pdf")
