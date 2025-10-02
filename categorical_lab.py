
import pandas as pd
import numpy as np
d = pd.DataFrame({'predicted label' : [1,2,2,1,2,2,1,2,3,2,2,3], 
                  'actual label': [1,2,3,1,2,3,1,2,3,1,2,3]}, 
                 dtype='category')
list(d.dtypes)

perc_acc = np.mean(d['predicted label'] == d['actual label']) * 100

confusion = np.zeros((3, 3))
for i in range(1, 4):
    for j in range(1, 4):
        count = ((d['predicted label'] == i) & (d['actual label'] == j)).sum()
        confusion[i - 1, j - 1] = (count / len(d)) * 100


# confusion = np.zeros((3, 3))
# for i in range(1, 4):
#     for j in range(1, 4):
#         count = ((d['predicted label'] == i) & (d['actual label'] == j)).sum()
#         confusion[i - 1, j - 1] = (count / sum(d['predicted label']  == i)) * 100
