import numpy as np

def smw_inverse(A, U, C, V):
    A_inverse = np.diag(1.0 / np.diag(A))

    return A_inverse - A_inverse @ U @ np.linalg.inv(np.linalg.inv(C) + V @ A_inverse @ U) @ V @ A_inverse
