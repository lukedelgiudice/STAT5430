import numpy as np
import math

x = np.array([1.1, .9, 1.0]).reshape((3,1))
m = np.ones(3).reshape((3,1))
n = 3

log_dens1 = (-n/2) * np.log(2 * math.pi) - 0.5 * np.log(1000) - 0.5 * (1 / 10) * float((x - m).T @ (x - m))

# you CAN do this without defining a numpy array for C

log_dens2 = (-n/2) * np.log(2 * math.pi) - 0.5 * np.log(10 * 11 * 12) - 0.5 * np.sum(((x - m)**2) / np.array([10, 11, 12]))

# you CAN do this without defining a numpy array for C (although, note that I did define an array of its diagonal elements)

C_matrix = np.array([[10, -0.9, -0.9], [-0.9, 11, -0.9], [-0.9, -0.9, 12]])

log_dens3 = (-n/2) * np.log(2 * math.pi) - 0.5 * np.log(np.linalg.det(C_matrix)) - 0.5 * float((x - m).T @ np.linalg.inv(C_matrix) @ (x - m))

# you can NOT do this without defining a numpy array for C (since C is not diagonal anymore)
