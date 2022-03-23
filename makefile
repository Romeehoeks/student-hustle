all: data-preparation analysis

data-preparation:
        make -C src/dataprep
        
analysis:
        make -C src/analysis

clean:
        -rm -r data
        -rm -r gen
        -rm -r gen/data/output

