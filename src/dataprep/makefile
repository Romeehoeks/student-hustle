INPUT = ../../gen/data-preparation/input
OUTPUT = ../../gen/data-preparation/output
DATA = ../../data

all: $(DATA)/downloaded_data.csv $(OUTPUT)/private_room.csv $(OUTPUT)/mean_price_cities_euro1.csv $(OUTPUT)combined_mean_data1.csv

$(DATA)/downloaded_data.csv: download_files.R
        R --vanilla < download_files.R

$(OUTPUT)/private_room.csv: $(DATA)/ downloaded_data.csv transform_data.R
        R --vanilla < transform_data.R
            
$(OUTPUT)/mean_price_cities_euro1.csv: $(OUTPUT)/ private_room.csv clean_data.R
        R --vanilla < clean_data.R
        
$(OUTPUT)/combined_mean_data1.csv: $(OUTPUT)/ private_room.csv clean_data.R
        R --vanilla < clean_data.R
