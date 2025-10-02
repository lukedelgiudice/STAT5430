import pandas as pd
import numpy as np

d = pd.read_csv("winequality-red.csv", sep = ";")
d.head()

X = d.drop(columns = ["quality"]).to_numpy()
X = X - X.mean(axis = 0)

X_tX = X.T @ X

eig_vals, eig_vecs = np.linalg.eig(X_tX)

U, sing_vals, eig_vecs_v2_t = np.linalg.svd(X)
eig_vecs_v2 = eig_vecs_v2_t.T

first_pc_v1 = X @ eig_vecs.T[np.argmax(eig_vals)]

d1 = { "first" : "a", "second" : 1}
d2 = { "first" : [1,2,3], "second" : "statistics"}

my_list = [d1["first"], d1["second"], d2["first"], d2["second"]]

# can't be a single dict since the key values overlaps

special_list = [i for i in range(0, 1_000_000 + 1) if (i % 2 != 0 and i % 3 != 0 and i % 5 != 0)]

special_ave = np.mean(special_list)
