##Last step, this is the conclusion
#Create a table for the top 10 student cities in Europe ascending

top10_student_cities <- matrix(c("Edinburgh", "Manchester", "Munich", "London", "Berlin", "Dublin", "Vienna", "Paris","Barcelona", "Copenhagen"), ncol=1, byrow=TRUE)
colnames(top10_student_cities) <- c("City")
rownames(top10_student_cities) <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
top10_student_cities <- as.table(top10_student_cities)

#Create a loop for the position of the student cities

for(i in 1:length(top10_student_cities)) {
  print(paste(top10_student_cities[i], "is the number",
              i, "student city in Europe to rent out your student room"))
}

write.csv(top10_student_cities, "../../gen/dataprep/output/top10_student_cities.csv", row.names = FALSE)
