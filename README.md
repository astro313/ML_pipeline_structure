structure of a ML repo

1. create environment.yml
2. conda env create -f environment.yml -n someMLrepo
3. conda env update -f environment.yml -n someMLrepo
4. activate someMLrepo
5. jupyter notebook
6. mkdir src/data/raw src/data/processed src/data/interim
7. touch data/raw/.gitkeep data/interim/.gitkeep data/processed/.gitkeep
    - so git can store the empty directories  
8. emacs .gitignore, add ./data/
9. git add -f data/raw/.gitkeep data/processed/.gitkeep data/interim/.gitkeep
10. gc -m "empty data dir"
11. GNU Make
    - clean: remove generated output
    - all: run pipeline
    - download: data
12. Jupyter notebook 00-initial-EDA.ipynb
13. then write corresponding .py script (src/data/preprocess.py)
14. write __init__.py
15. write src/visualization/exploratory.py for plotting
