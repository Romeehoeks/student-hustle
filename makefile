all: data-preparation analysis

data-preparation:
        make -C src/datapreparation
        
analysis:
       make -C src/analysis

clean:
        -rm -r data
        -rm -r gen
        -rm -r gen/data/output
