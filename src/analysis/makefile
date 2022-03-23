DATA = ../../gen/analysis/input
OUTPUT = ../../gen/analysis/output

all:$(DATA)/plot_all.pdf $(DATA)/plot_all.pdf: mean_prices_reviews.R $(DATA)/top10_student_cities.csv: position_studentcities.R

$(INPUT)/mean_price.pdf $(DATA)/mean_reviews.pdf $(DATA)/mean_availability.pdf: plot_means.R
  R --vanilla < plot_means.R
  
$(RESULT)/plot_all.pdf: mean_prices_reviews.R
  R --vanilla < mean_prices_reviews.R
  
$(RESULT)/top10_student_cities.csv: position_studentcities.R
  R --vanilla < position_studentcities.R
