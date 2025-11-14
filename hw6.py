
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

dataset1 = pd.DataFrame({
    'dog': ['Charlie', 'Gus', 'Stubby', 'Toni', 'Pearl'],
    'nickname': ['Charles', 'Gus The Bus', np.nan, 'Toni Bologna', 'Porl']
})

dataset2 = pd.DataFrame({
    'dog': ['Charlie', 'Gus', 'Toni', 'Arya', 'Shelby'],
    'breed': ['Black Lab', 'Beagle', 'Golden Retriever', 'Husky', np.nan]
})

merged1 = pd.merge(dataset1, dataset2, on='dog', how='outer')

merged2 = pd.merge(dataset1, dataset2, on='dog', how='left')

merged3 = pd.merge(dataset1, dataset2, on='dog', how='right')

merged4 = pd.merge(dataset1, dataset2, on='dog', how='inner')

#iris = pd.read_csv('iris.csv', header=None, names=['a', 'b', 'c', 'd', 'e'])
iris = pd.read_csv(r"C:\Users\luked\Repositories\STAT5430\iris.data", header=None, names=['a', 'b', 'c', 'd', 'e'])

long_names = pd.Series(iris['e'].unique())

def to_short(name: str) -> str:
    n = str(name).lower()
    if 'setosa' in n:
        return 's'
    elif 'versicolor' in n:
        return 'vers'
    elif 'virginica' in n:
        return 'virg'
    else:
        return np.nan

name_key = pd.DataFrame({
    'long name': long_names,
    'short name': long_names.apply(to_short)
})

iris_with_short_names = iris.merge(name_key, left_on='e', right_on='long name', how='left')

iris_with_short_names = iris_with_short_names.drop(columns=['long name'])

iris_with_short_names = iris_with_short_names.rename(columns={
    'a': 's_len',
    'b': 's_wid',
    'c': 'p_len',
    'd': 'p_wid'
})

fig, axes = plt.subplots(2, 2, figsize=(10, 8))
cols = ['s_len', 's_wid', 'p_len', 'p_wid']
for ax, col in zip(axes.ravel(), cols):
    ax.hist(iris_with_short_names[col].astype(float), bins=20, color='steelblue', edgecolor='white')
    ax.set_xlabel(col)
    ax.set_ylabel('count')
    ax.grid(alpha=0.25)

fig.suptitle('Histograms of Iris Measurements', y=1.02)
fig.tight_layout()
fig.savefig('py_plot.png', dpi=200)

plt.show()
plt.close(fig)

t1 = iris.copy()
t1['row'] = np.arange(iris.shape[0])
long_iris = t1.melt(id_vars='row', value_vars=['a', 'b', 'c', 'd'])
long_iris = long_iris.sort_values(['row', 'variable'])