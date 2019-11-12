IRIS_URL="https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"

.PHONY: all clean test    # targets that do not create files

all: src/reports/figures/exploratory.png models/random_forest.model

help:
	@echo "    clean"
	@echo "        Remove data files and plots."
	@echo "    clean-pyc"
	@echo "        Remove python artifacts."
	@echo "    src/data/raw/iris.csv"
	@echo "        download data from URL given in Makefile."
	@echo "    src/data/processed/processed.pickle"
	@echo "        preprocess raw data file."
	@echo "    src/reports/figures/exploratory.png"
	@echo "        make a plot of the processed data."
	@echo "    test"
	@echo "        Run py.test"

src/data/raw/iris.csv:
	python src/data/download.py $(IRIS_URL) $@

# rule for preprocessing
src/data/processed/processed.pickle: src/data/raw/iris.csv
	python src/data/preprocess.py $< $@ --excel src/data/processed/processed.xlsx

# rule for plotting
src/reports/figures/exploratory.png: src/data/processed/processed.pickle
	python src/visualization/exploratory.py $< $@   # $< first dependency, $@ filename of target

src/models/random_forest.model: src/data/processed/processed.pickle
	python src/models/train_model.py $< $@

clean:
	rm -f src/data/raw/*.csv
	rm -f src/data/processed/*.pickle
	rm -f src/data/processed/*.xlsx
	rm -f src/reports/figures/*.png
	rm -f src/models/*.model

clean-pyc:
	find . -name '*.pyc' -exec rm --force {} +
	find . -name '*.pyo' -exec rm --force {} +
	name '*~' -exec rm --force  {}

test: all
	pytest src