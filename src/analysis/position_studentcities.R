#Create a table for the top 10 student cities in Europe ascending

Top10_student_cities <- matrix(c("London", "Munich", "Berlin", "Paris", "Zurich", "Vienna", "Edinburgh", "Barcelona","Dublin", "Manchester"), ncol=1, byrow=TRUE)
colnames(Top10_student_cities) <- c("City")
rownames(Top10_student_cities) <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
Top10_student_cities <- as.table(Top10_student_cities)
Top10_student_cities

#Create a loop for the position of the student cities
cities <- c("London", "Munich", "Berlin", "Paris", "Zurich", "Vienna", "Edinburgh", "Barcelona","Dublin", "Manchester")

for(i in 1:length(cities)) {
  print(paste(cities[i], "is the number",
              i, "city in Europe"))
