import math
import numpy as np

########## Q1

question_one = ["str", "bool", "int", "float"]

########## Q2

a = 2 / 3

print(a)

a_print = '0.6666666666666666'

a_printv2 = f"{a:.22f}"

print(a_printv2)

########## Q3

my_sqrt = math.sqrt(2)

print(my_sqrt**2)

is_two_recoverable = (my_sqrt**2 == 2)

close_enough = np.isclose(my_sqrt**2, 2)

########## Q4

flips = np.random.binomial(size = 1000, n = 1, p = 0.5)

is_heads = (flips == 1).tolist()

num_heads = np.sum(flips)

acceptance_rate = np.mean(flips[:-1] != flips[1:]) * 100