INPUT = ../../gen/data-preparation/input
OUTPUT = ../../gen/data-preparation/output
DATA = ../../data


$(DATA)/downloaded_data.csv $ :download_files.R
        R --vanilla < download_files.R


$(OUTPUT)/private_room.CSV: $(DATA)/ downloaded_data.csv transform_data.R
        R --vanilla < transform_data.R
