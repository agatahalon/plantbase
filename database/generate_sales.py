import sqlite3
import random
from datetime import date, timedelta

conn = sqlite3.connect("plantbase.db")  # a connection, opens the database file.
# turns on foreign key enforcement, which SQLite leaves off by default. With it on, a sale can't reference a plant_id that doesn't exist.
conn.execute("PRAGMA foreign_keys = ON;")
cursor = conn.cursor()

# Get all plant IDs to generate sales for
# cursor is the object you use to send commands over that line and read results back
cursor.execute("SELECT id FROM plants")

plant_ids = []
rows = cursor.fetchall()  # get all rows: [(1,), (2,), ..., (16,)]; each row comes back as a tuple, even with a single column
for row in rows:  # go through the rows one at a time
    plant_id = row[0]  # take the first value of the tuple: (1,) -> 1
    plant_ids.append(plant_id)  # add it to the list

# result: plant_ids == [1, 2, 3, ..., 16]
# a list comprehension here would be: plant_ids = [row[0] for row in cursor.fetchall()]

START_DATE = date(2023, 1, 1)
END_DATE = date(2025, 12, 31)
TOTAL_DAYS = (END_DATE - START_DATE).days

for plant_id in plant_ids:
    # Generate a random number of sales for each plant
    num_sales = random.randint(1, 10)

    for _ in range(num_sales):
        # _ Python convention, informs that the name is deliberately ignored; this variable could be named i as well
        # Generate a random sale date within the specified range
        random_days = random.randint(0, TOTAL_DAYS)
        sale_date = START_DATE + timedelta(days=random_days)

        # Generate a random quantity sold (between 1 and 20)
        quantity_sold = random.randint(1, 20)

        # Generate a price per package (between 5.0 and 35.0)s
        price_per_package = round(random.uniform(5.0, 35.0), 2)

        # Insert the sale record into the sales table
        cursor.execute(
            "INSERT INTO sales (plant_id, sale_date, quantity_sold, price_per_package) VALUES (?, ?, ?, ?)",
            (plant_id, sale_date.isoformat(), quantity_sold, price_per_package),
        )

conn.commit()  # saves the changes permanently. Until the commit, all those INSERTs are only a pending transaction
conn.close()  # closes the connection and releases the database file
