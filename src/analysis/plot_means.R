#Load libraries
library(carData)
library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)

########1
#read data

combined_mean_data1 <- read.csv(file = '../../gen/dataprep/input/combined_mean_data1.csv')

#plot the mean prices. As you can see the price in dublin is the highest, and in manchester the lowest.

ggplot(combined_mean_data1, aes(x= city, y=mean_price, color = city)) +
  geom_point() 
ggsave("mean_price.pdf")

#plot the mean reviews per city. As you can see the highest score is in edinburgh, the lowest is in barcelona

ggplot(combined_mean_data1, aes(x= city, y=mean_reviews1, color = city)) +geom_point()
ggsave("mean_reviews.pdf")

#plot the mean availability per city. 

ggplot(combined_mean_data1, aes(x= city, y=mean_availability, color = city)) +geom_point()
ggsave("mean_availability.pdf")
