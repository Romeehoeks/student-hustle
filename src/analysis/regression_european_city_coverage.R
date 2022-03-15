#regression European City - Coverage
reg = lm( availability_365 ~ city, data = private_room)
summary(reg)
