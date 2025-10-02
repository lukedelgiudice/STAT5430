import pandas as pd

car_df = pd.read_csv("car.data", header = None)

car_dict = car_df.to_dict()
