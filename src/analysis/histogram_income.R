grafiek3 <- c(min(private_room2$income))
ggplot(private_room2, aes(income)) + 
  geom_historgram()

#save the plot to a pdf
ggsave("histogram.income.pdf")
