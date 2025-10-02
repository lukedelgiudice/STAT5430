
import pandas as pd
import numpy as np
from collections import Counter

# Functions as function inputs: Newton’s method

def f(x):
    return (x - 42) ** 2 - 33

def f_prime(x):
    return 2 * x - 84

def f_dub_prime(x):
    return 2.0

best_x = 42.0

def minimize(derivative, secondDerivative, guess):
    minimum = guess
    for i in range(0, 10):
        minimum = minimum - (derivative(minimum) / secondDerivative(minimum))
    
    return minimum

x_ten = minimize(f_prime, f_dub_prime, 10.0)


# Categorical Data: Letter Grades and GPAs

poss_grades = ['A+','A','A-','B+','B','B-','C+','C','C-','D+','D','D-','F']
grade_values = {'A+':4.0,'A':4.0,'A-':3.7,'B+':3.3,'B':3.0,'B-':2.7,
'C+':2.3,'C':2.0,'C-':1.7,'D+':1.3,'D':1.0,'D-':.67,'F':0.0}
student1 = np.random.choice(poss_grades, size = 10, replace = True)
student2 = np.random.choice(poss_grades, size = 12, replace = True)

s1 = pd.Categorical(student1, categories = poss_grades[::-1], ordered = True)

s2 = pd.Categorical(student2, categories = poss_grades[::-1], ordered = True)

# the data are ordinal (A > A-, etc)

s1_gpa = sum([grade_values[grade] for grade in student1]) / len(student1)

s2_gpa = sum([grade_values[grade] for grade in student2]) / len(student2)

ave_ord_data_response = "Every categorty is NOT equally spaced. For example, A+ to A is 0 difference, but A to A- is a 0.3 difference. This DOES affect the legitmacy of averageing together ordinal data since a student with all A+ grades will be the same as a student with all A grades."

s1_counts = Counter(student1)
s1_max_count = max(s1_counts.values())
s1_modes = [grade for grade, count in s1_counts.items() if count == s1_max_count]
s1_mode = sorted(s1_modes)[0]

s2_counts = Counter(student2)
s2_max_count = max(s2_counts.values())
s2_modes = [grade for grade, count in s2_counts.items() if count == s2_max_count]
s2_mode = sorted(s2_modes)[0]
