IRIS_URL="https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"

.PHONY: all clean test    # targets that do not create files

all: src/data/raw/iris.csv src/data/processed/processed.pickle src/reports/figures/exploratory.png

src/data/raw/iris.csv:
	python src/data/download.py $(IRIS_URL) $@

help:
	@echo "    clean-pyc"
	@echo "        Remove python artifacts."
	@echo "    test"
	@echo "        Run py.test"

# rule for preprocessing
src/data/processed/processed.pickle: src/data/raw/iris.csv
	python src/data/preprocess.py $< $@ --excel src/data/processed/processed.xlsx

# rule for plotting
src/reports/figures/exploratory.png: src/data/processed/processed.pickle
	python src/visualization/exploratory.py $< $@   # $< first dependency, $@ filename of target

clean:
	rm -f src/data/raw/*.csv
	rm -f src/data/processed/*.pickle
	rm -f src/data/processed/*.xlsx
	rm -f src/reports/figures/*.png

clean-pyc:
	find . -name '*.pyc' -exec rm --force {} +
	find . -name '*.pyo' -exec rm --force {} +
	name '*~' -exec rm --force  {}

test: all
	pytest src