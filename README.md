structure of a ML repo

1. create environment.yml
2. `conda env create -f environment.yml -n someMLrepo`
3. `conda env update -f environment.yml -n someMLrepo`
4. `activate someMLrepo`
5. `jupyter notebook`
6. `mkdir src/data/raw src/data/processed src/data/interim`
7. `touch data/raw/.gitkeep data/interim/.gitkeep data/processed/.gitkeep`
    - so git can store the empty directories  
8. `emacs .gitignore`, add ./data/
9. `git add -f data/raw/.gitkeep data/processed/.gitkeep data/interim/.gitkeep`
10. gc -m "empty data dir"
11. GNU Make
    - clean: remove generated output
    - all: run pipeline
    - download: data
12. Jupyter notebook 00-initial-EDA.ipynb
13. then write corresponding .py script (src/data/preprocess.py)
14. write __init__.py to src/data/, src/
15. write src/visualization/exploratory.py for plotting
16. updated 00-initial-EDA.ipynb to load libraries
17. ML testing: write src/tests/test_data.py
    - can `from src.data import <functions within .py inside src/data/>`
    - or sys.path.append('src'); `from data import <functions w/ .py inside src/data/>`
18. write __init__.py to src/tests/
19. cd src/
20. pytest 
21. add test to makefile
22. write scripts for ML model: src/models/
23. write __init__.py to src/models/
24. `touch src/models/.gitkeep`; `git add`
25. udpate Makefile
26. 
