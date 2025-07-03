import csv
import mysql.connector
from dotenv import load_dotenv
import os
 
# Load environment variables from .env
load_dotenv()

# Read env vars
db_host = os.getenv("DB_HOST")
db_user = os.getenv("DB_USER")
db_password = os.getenv("DB_PASSWORD")
db_name = os.getenv("DB_NAME")

# Connect to MySQL
db = mysql.connector.connect(
    host=db_host,
    user=db_user,
    password=db_password,
    database=db_name
)

cursor = db.cursor()

# Files & target tables mapping
files = [
    ("Beekeeper.csv", "Beekeeper", ["Name", "Phone", "Email"]),
    ("BeeSpecies.csv", "BeeSpecies", ["CommonName", "ScientificName"]),
    ("Hive.csv", "Hive", ["Location", "InstallDate", "Status"]),
    ("QueenBee.csv", "QueenBee", ["HiveID", "BirthDate", "SpeciesID"]),
    ("EnvironmentData.csv", "EnvironmentData", ["HiveID", "Date", "Temperature", "Humidity"]),
    ("HoneyProduction.csv", "HoneyProduction", ["HiveID", "HarvestDate", "WeightKG"]),
    ("PlantNearby.csv", "PlantNearby", ["HiveID", "PlantName", "DistanceM"]),
    ("MaintenanceLog.csv", "MaintenanceLog", ["HiveID", "Date", "Note", "BeekeeperID"]),
]

for filename, table, columns in files:
    with open(f'csv_files/{filename}', newline='') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            # Generate INSERT for each row
            values = [row[col] for col in columns]
            placeholders = ", ".join(["%s"] * len(columns))
            colnames = ", ".join(columns)
            sql = f"INSERT INTO {table} ({colnames}) VALUES ({placeholders})"
            cursor.execute(sql, values)

    db.commit()
    print(f"Inserted data from {filename} into {table}")

cursor.close()
db.close()
print("✅ All CSVs imported successfully!")
