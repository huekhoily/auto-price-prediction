import sqlite3
import pandas as pd

df = pd.read_csv("data/cleaned/used_cars_cleaned.csv")

conn = sqlite3.connect("data/cars.db")

df.to_sql(
    "cars",
    conn,
    if_exists="replace",
    index=False
)

conn.close()

print("Database created successfully")