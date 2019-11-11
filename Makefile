IRIS_URL =  "https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"

all:     # default make will execute the first target only
	src/data/raw/iris.csv

clean:
	rm -rf src/data/raw/*.csv

src/data/raw/iris.csv:       # target name, which will be called with make blah
	python src/data/download.py $(IRIS_URL) $@   # $@: first target in a rule

.PHONY: all clean      # targets that do not create files