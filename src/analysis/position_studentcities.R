##Step 5
#Create a table for the top 10 student cities in Europe ascending

Top10_student_cities <- matrix(c("Edinburgh", "Manchester", "Munich", "London", "Berlin", "Dublin", "Vienna", "Paris","Barcelona", "Copenhagen"), ncol=1, byrow=TRUE)
colnames(Top10_student_cities) <- c("City")
rownames(Top10_student_cities) <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
Top10_student_cities <- as.table(Top10_student_cities)

#Create a loop for the position of the student cities

for(i in 1:length(Top10_student_cities)) {
  print(paste(Top10_student_cities[i], "is the number",
              i, "student city in Europe to rent out your student room"))
}
