# ---
# jupyter:
#   jupytext:
#     text_representation:
#       extension: .py
#       format_name: light
#       format_version: '1.4'
#       jupytext_version: 1.2.1
#   kernelspec:
#     display_name: Python 3
#     language: python
#     name: python3
# ---

# %load_ext watermark
# %watermark -v -n -m -p numpy,scipy,sklearn,pandas,matplotlib

# auto-reload .py scripts that we will import in the .ipynb
# %load_ext autoreload
# %autoreload 2

# %matplotlib inline
import pandas as pd
import numpy as np
import seaborn as sns
import os
PROJ_ROOT = os.path.abspath('./')
print(PROJ_ROOT)

import sys
sys.path.append(os.path.join(PROJ_ROOT, 'src'))

from data.preprocess import read_raw_data, preprocess_data
from visualization.exploratory import exploratory_visualization

data_fname = os.path.join(PROJ_ROOT, 'src', 'data', 'raw', 'iris.csv')
raw_data = read_raw_data(data_fname)
raw_data.head()

preprocessed_data = preprocess_data(raw_data)
preprocessed_data.head()

exploratory_visualization(preprocessed_data) 


