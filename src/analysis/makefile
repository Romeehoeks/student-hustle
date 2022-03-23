INPUT = ../../gen/analysis/input
RESULT = ../../gen/analysis/output

all:$(INPUT)/plot_all.pdf $(RESULT)/plot_all.pdf: mean_prices_reviews.R $(RESULT)/top10_student_cities.csv: position_studentcities.R

$(INPUT)/mean_price.pdf $(INPUT)/mean_reviews.pdf $(INPUT)/mean_availability.pdf: plot_means.R
  R --vanilla < plot_means.R
  
$(RESULT)/plot_all.pdf: mean_prices_reviews.R
  R --vanilla < mean_prices_reviews.R
  
$(RESULT)/top10_student_cities.csv: position_studentcities.R
  R --vanilla < position_studentcities.R
