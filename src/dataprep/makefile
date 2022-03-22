INPUT = ../../gen/dataprep/input
OUTPUT = ../../gen/dataprep/output
DATA = ../../data

	all: $(DATA)/downloaded_data.csv $(INPUT)/private_room.csv $(INPUT)/mean_price_cities_euro1.csv $(INPUT)combined_mean_data1.csv

$(DATA)/downloaded_data.csv: download_files.R
	R --vanilla < download_files.R

$(INPUT)/private_room.csv: $(DATA)/ downloaded_data.csv transform_data.R
	R --vanilla < transform_data.R
            
$(INPUT)/mean_price_cities_euro1.csv: $(OUTPUT)/ private_room.csv clean_data.R
	R --vanilla < clean_data.R
        
$(INPUT)/combined_mean_data1.csv: $(OUTPUT)/ private_room.csv clean_data.R
	R --vanilla < clean_data.R
