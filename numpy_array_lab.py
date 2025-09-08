import numpy as np

########## 1

my_array = np.arange(1, 11, 1)

my_array = 1 / (2 ** my_array)

########## 2

nums = np.linspace(start = -100, stop = 100, num = 100)

my_logicals = np.abs(nums) < 10

total_close = np.sum(my_logicals)

evens = nums[nums % 2 == 0]

reverse = nums[::-1]

########## 3

sum_these = np.exp(np.repeat(-1000, 10))

sum_these > 0

# These elements aren't nonzero

np.sum(sum_these)

# You can sum them, but the sum isn't correct

all_good = False

lower_bound = 0

upper_bound = 0.39901297

naive_log_sum = np.log(np.sum(sum_these))

# This naive log sum is NOT finite

log_values = np.repeat(-1000, 10)

m = np.max(log_values)

better_sum = np.log(np.sum(np.exp(log_values - m))) + m

which_better = "logs"