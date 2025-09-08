import pandas as pd
import numpy as np
from scipy import stats

########## Examining a Series taken from a DataFrame

my_df = pd.read_csv("2013-10_Citi_Bike_trip_data_20K.csv")

s_times = my_df.starttime

split_series = s_times.str.split()

date_strings = split_series.str[0]

time_strings = split_series.str[1]

########## Approximating Probabilities

exact_exceedance_prob = 1 - stats.norm.cdf(6, loc=5, scale=6)

stand_norm_samps = np.random.normal(0, 1, int(1e3))

transformed_samps = 5 + 6 * stand_norm_samps

approx_exceedance_prob1 = np.mean(transformed_samps > 6)

norm_samps = np.random.normal(5, 6, int(1e3))

approx_exceedance_prob2 = np.mean(norm_samps > 6)

########## Approximating Expectations

# E[Y] = E[Y | X = 0] P(X = 0) + E[Y | X = 1] P(X = 1)
# E[Y] = (0)(0.5) + (10)(0.5) = 5

exact_mean = 5.0

bernoulli_flips = np.random.binomial(n=1, p=0.5, size=int(1e3))

cond_norm_samps = np.zeros(int(1e3))

for i in range(int(1e3)):
    if bernoulli_flips[i] == 0:
        cond_norm_samps[i] = np.random.normal(0, 2)
    else:
        cond_norm_samps[i] = np.random.normal(10, 2)

approx_ave_1 = np.mean(cond_norm_samps)

# Why is simply “ignoring” bernoulli_flips, the samples you condition on, “equivalent” to “integrating them out?”

# In Monte Carlo, the fraction of samples that come from each component (X=0 or X=1) converges to their true probabilities (law of large numbers).
# Averaging over all samples (without bernoulli_flips in the expression) automatically weights the components by these probabilities, which is exactly what integrating out X does.
# (as seen in the below expectation where X is integrated out so that we consider every possible value of x and its corresponding probability given by f(x))
# E[Y] = integral[ E(Y | X = x) f(x) dx]

conditional_expectations = np.where(bernoulli_flips == 0, 0, 10)

approx_ave_2 = np.mean(conditional_expectations)