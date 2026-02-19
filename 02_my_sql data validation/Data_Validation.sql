SELECT*
FROM road_acci
LIMIT 100;

SELECT 
	SUM(number_of_casualties) AS CY_casualties
FROM road_acci
WHERE YEAR(accident_date) = 2022;


SELECT 
	COUNT(accident_index) AS CY_accidents
FROM road_acci
WHERE YEAR(accident_date) = 2022;

SELECT 
	SUM(number_of_casualties) AS CY_casualties_fatal
FROM road_acci
WHERE 
	YEAR(accident_date) = 2022
	AND accident_severity = "Fatal";

    
SELECT 
	SUM(number_of_casualties) AS CY_casualties_serious
FROM road_acci
WHERE 
	YEAR(accident_date) = 2022
	AND accident_severity = "serious";
    
SELECT 
	SUM(number_of_casualties) AS CY_casualties_slight
FROM road_acci
WHERE 
	YEAR(accident_date) = 2022
	AND accident_severity = "slight";
    
SELECT 
    accident_severity,
    ROUND(
        SUM(number_of_casualties) * 100.0 /
        SUM(SUM(number_of_casualties)) OVER (),
        2
    ) AS casualty_percentage
FROM road_acci
GROUP BY accident_severity;

SELECT
CASE 
	WHEN vehicle_type IN ('Agricultural vehicle') THEN 'Agri'
	WHEN vehicle_type IN ('Car', 'Taxi/Private hire car') THEN 'Car'
	WHEN vehicle_type IN ('Motorcycle over 500cc', 'Motorcycle 125cc and under', 'Motorcycle 50cc and under', 'Motorcycle over 125cc and up to 500cc', 'Pedal cycle') THEN 'Bike'
	WHEN vehicle_type IN ('Bus or coach (17 or more pass seats)', 'Minibus (8 - 16 passenger seats)') THEN 'Bus'
	WHEN vehicle_type IN ('Other vehicle', 'Ridden horse') THEN 'Others'
	WHEN vehicle_type IN ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van / Goods 3.5 tonnes mgw or under') THEN 'Pickup'
    END AS vehicle_group,
SUM(number_of_casualties) AS CY_Casualities
FROM road_acci
WHERE YEAR(accident_date) = 2022
GROUP BY vehicle_group;


SELECT 
    MONTHNAME(accident_date) AS month_name,
    SUM(number_of_casualties) AS cy_total_casualties
FROM road_acci
WHERE YEAR(accident_date) = 2022
GROUP BY MONTH(accident_date), MONTHNAME(accident_date)
ORDER BY MONTH(accident_date);

SELECT 
	road_type,
    SUM(number_of_casualties)
FROM road_acci
WHERE YEAR(accident_date) = 2022
GROUP BY road_type;

SELECT 
	urban_or_rural_area,
    SUM(number_of_casualties) AS total_cy_casualities,
    SUM(number_of_casualties) * 100/
    (SELECT SUM(number_of_casualties) 
    FROM road_acci
    WHERE YEAR(accident_date) = 2022) AS percentage_of_whole
FROM road_acci
WHERE YEAR(accident_date) = 2022
GROUP BY urban_or_rural_area;


SELECT
CASE
 WHEN light_conditions IN ('Darkness - lighting unknown', 'Darkness - lights lit', 'Darkness - lights unlit',
							'Darkness - no lighting') THEN 'Dark'
                            ELSE 'Daylight'
END AS light_conditions_Group,
SUM(number_of_casualties),
SUM(number_of_casualties) * 100/
    (SELECT SUM(number_of_casualties) 
    FROM road_acci
    WHERE YEAR(accident_date) = 2022) AS percentage_of_whole
FROM road_acci
WHERE YEAR(accident_date) = 2022
GROUP BY light_conditions_Group;


SELECT *
FROM road_acci;

SELECT 
	local_authority,
    SUM(number_of_casualties) as Total_casualities
FROM road_acci
GROUP BY local_authority
ORDER BY Total_casualities DESC
LIMIT 10;


