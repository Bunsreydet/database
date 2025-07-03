LOAD DATA INFILE '/absolute/path/beekeepers.csv'
INTO TABLE Beekeeper
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Name, Phone, Email);

LOAD DATA INFILE '/absolute/path/beespecies.csv'
INTO TABLE BeeSpecies
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(CommonName, ScientificName);

LOAD DATA INFILE '/absolute/path/hives.csv'
INTO TABLE Hive
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Location, InstallDate, Status);

LOAD DATA INFILE '/absolute/path/queenbees.csv'
INTO TABLE QueenBee
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(HiveID, BirthDate, SpeciesID);

LOAD DATA INFILE '/absolute/path/environmentdata.csv'
INTO TABLE EnvironmentData
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(HiveID, Date, Temperature, Humidity);

LOAD DATA INFILE '/absolute/path/honeyproduction.csv'
INTO TABLE HoneyProduction
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(HiveID, HarvestDate, WeightKG);

LOAD DATA INFILE '/absolute/path/plantnearby.csv'
INTO TABLE PlantNearby
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(HiveID, PlantName, DistanceM);

LOAD DATA INFILE '/absolute/path/maintenancelog.csv'
INTO TABLE MaintenanceLog
FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(HiveID, Date, Note, BeekeeperID);
