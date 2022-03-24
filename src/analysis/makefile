DATA = ../../gen/analysis/input
OUTPUT = ../../gen/analysis/output

all: $(OUTPUT)/mean_price.pdf $(OUTPUT)/mean_reviews.pdf $(OUTPUT)/mean_availability.pdf $(DATA)/final_score.csv $(OUTPUT)/top10_student_cities.txt

$(OUTPUT)/mean_price.pdf $(OUTPUT)/mean_reviews.pdf $(OUTPUT)/mean_availability.pdf: plot_means.R
	R --vanilla < plot_means.R
  
$(DATA)/final_score.csv: mean_prices_reviews.R
	R --vanilla < mean_prices_reviews.R

  
$(OUTPUT)/top10_student_cities.txt: position_studentcities.R
	R --vanilla < position_studentcities.R
