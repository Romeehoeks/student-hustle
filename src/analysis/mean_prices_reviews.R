##Step 6
#######2

library(effects)
library(carData)
library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)

combined_mean_data1 <- read.csv(file = '../../gen/dataprep/input/combined_mean_data1.csv')
private_room <- read.csv(file = '../../gen/dataprep/output/private_room.csv')

#Check if price and reviews have a relationship

reg1 <- lm(review_scores_rating ~ price, data = private_room)
summary(reg1)

#check if reviews and availability have a relationship

reg2 <- lm(review_scores_rating ~ availability_365, data = private_room)
summary(reg2)

#regression with multiple variables

regression <- lm(review_scores_rating ~ price + availability_365 + short_stay +city, data=private_room)
summary(regression)


#plot of our regression model

pdf("multiple_regression_effects.pdf") 
plot <- plot(allEffects(regression), ylim={c(4.5, 5)})
dev.off()

#Calculate the top10 cities based on the regression

top10<-summary(regression)$coefficients[1,1]+summary(regression)$coefficients[2,1]*combined_mean_data1$mean_price[2:10]+summary(regression)$coefficients[3,1]*combined_mean_data1$mean_availability[2:10]+summary(regression)$coefficients[4,1]+summary(regression)$coefficients[5:13,1] 
top10 <-as.data.frame(top10)

#As Barcelona is the 'base coefficient' we need to add this one seperately

citybarcelona <- summary(regression)$coefficients[1,1]+summary(regression)$coefficients[2,1]*combined_mean_data1$mean_price[1]+summary(regression)$coefficients[3,1]*combined_mean_data1$mean_availability[1]+summary(regression)$coefficients[4,1] 
top10[nrow(top10) + 1,] = citybarcelona

#changing the row names

rownames(top10) <- c("berlin", "copenhagen", "dublin", "edinburgh", "london", "manchester", "munich", "paris", "vienna", "barcelona")

#Rounding the final review scores
top10<- top10 %>%
  mutate_if(is.numeric, round, digits =3)

write.csv(top10, "../../gen/analysis/output/top10.csv", row.names = TRUE)
write.csv(reg1, "../../gen/analysis/output/reg1.csv", row.names = FALSE)
write.csv(reg2, "../../gen/analysis/output/reg2.csv", row.names = FALSE)
write.csv(regression, "../../gen/analysis/output/regression.csv", row.names = FALSE)
