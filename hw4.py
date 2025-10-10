#%pip install tensorflow
#%pip install tensorflow_datasets
import tensorflow_datasets as tfds
import pandas as pd
import numpy as np
d = tfds.load("radon")
d = pd.DataFrame(tfds.as_dataframe(d['train']))


worst_row = 