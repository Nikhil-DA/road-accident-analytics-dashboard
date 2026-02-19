CREATE DATABASE road_accident;
USE road_accident;
CREATE TABLE road_acci(
accident_index	VARCHAR(50),
accident_date DATE,
day_of_week	VARCHAR(50),
junction_control VARCHAR(50),
junction_detail	VARCHAR(50),
accident_severity VARCHAR(50),
light_conditions VARCHAR(50),	
local_authority	VARCHAR(50),
carriageway_hazards	VARCHAR(50),
number_of_casualties INT,
number_of_vehicles INT,
police_force VARCHAR(50),
road_surface_conditions	VARCHAR(50),
road_type VARCHAR(50),
speed_limit	VARCHAR(50),
time_ TIME, 
urban_or_rural_area VARCHAR(50),
weather_conditions VARCHAR(50),	
vehicle_type VARCHAR(50)
);

SET GLOBAL LOCAL_INFILE=ON;

LOAD DATA LOCAL INFILE 'C:/Users/nikhi/Downloads/road_accident.csv'
INTO TABLE road_acci
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;