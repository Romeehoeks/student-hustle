DATA = ../../gen/analysis/input
OUTPUT = ../../gen/analysis/output

all: $(DATA)/mean_price.pdf $(DATA)/mean_reviews.pdf $(DATA)/mean_availability.pdf $(OUTPUT)/final_score.pdf $(OUTPUT)/top10_student_cities.pdf

$(DATA)/mean_price.pdf $(DATA)/mean_reviews.pdf $(DATA)/mean_availability.pdf: plot_means.R
    R --vanilla < plot_means.R
  
$(OUTPUT)/final_score.csv : mean_prices_reviews.R
    R --vanilla < mean_prices_reviews.R
  
$(OUTPUT)/top10_student_cities.pdf: position_studentcities.R
    R --vanilla < position_studentcities.R
