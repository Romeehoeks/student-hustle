INPUT = ../../gen/analysis/input
OUTPUT = ../../gen/analysis/output

all: $(OUTPUT)/mean_price.pdf $(OUTPUT)/mean_reviews.pdf $(OUTPUT)/mean_availability.pdf $(INPUT)/final_score.csv $(OUTPUT)/top10_student_cities.txt $(OUTPUT)/analysis_markdown.rmd

$(OUTPUT)/mean_price.pdf $(OUTPUT)/mean_reviews.pdf $(OUTPUT)/mean_availability.pdf: $(INPUT)/combined_mean_data1.csv plot_means.R
	R --vanilla < plot_means.R
  
$(INPUT)/final_score.csv: $(INPUT)/combined_mean_data1.csv $(INPUT)/private_room.csv mean_prices_reviews.R 
	R --vanilla < mean_prices_reviews.R

$(OUTPUT)/top10_student_cities.txt: position_studentcities.R 
	R --vanilla < position_studentcities.R

$(OUTPUT)/analysis_markdown.rmd: $(INPUT)/private_room.csv $(INPUT)/combined_mean_data1.csv 
	Rscript -e "rmarkdown::render('analysis_markdown.rmd')"
