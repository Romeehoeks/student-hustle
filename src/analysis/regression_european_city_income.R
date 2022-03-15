#regression European City - Income (Price * coverage)
private_room2 <- mutate(private_room, income = price * availability_365)
View(private_room2)

reg3 = lm( income ~ city, data = private_room2)
summary(reg3)
