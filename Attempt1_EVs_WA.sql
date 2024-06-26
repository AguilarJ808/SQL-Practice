/* SOURCE DATA: https://catalog.data.gov/dataset/electric-vehicle-population-data */

SELECT *
FROM ev_wa;

/*Which car company has the most EVs out there*/
SELECT `make`, COUNT(*) AS Total
FROM ev_wa 
GROUP BY `make` 
ORDER BY Total DESC
LIMIT 10;

/*Gauging range of electric range that also qualify for CAFV*/
SELECT MAX(elec_range) FROM ev_wa
WHERE `cafv_elig` = "clean alternative fuel vehicle eligible";
SELECT MIN(elec_range) FROM ev_wa
WHERE `cafv_elig` = "clean alternative fuel vehicle eligible";
SELECT AVG(elec_range) FROM ev_wa
WHERE `cafv_elig` = "clean alternative fuel vehicle eligible";

/*Guessing and finding highest electric range*/
SELECT *
FROM ev_wa 
WHERE `cafv_elig` = "clean alternative fuel vehicle eligible" 
AND `elec_range` >= 200
ORDER BY `elec_range` DESC
LIMIT 20;

SELECT *
FROM ev_wa 
WHERE `cafv_elig` = "clean alternative fuel vehicle eligible" 
AND `elec_range` >= 300
ORDER BY `elec_range` DESC
LIMIT 20;

/*Narrowing down car brand and model with longest range*/
SELECT DISTINCT model, make, elec_range 
FROM ev_wa 
WHERE `cafv_elig` = "clean alternative fuel vehicle eligible" 
AND elec_range >= 200 
ORDER BY `elec_range` DESC 
LIMIT 20;

/*Brands other than Tesla with longest range*/
SELECT DISTINCT model, make, elec_range 
FROM ev_wa 
WHERE `cafv_elig` = "clean alternative fuel vehicle eligible" 
AND elec_range >= 200 
AND make NOT LIKE "tesla"
ORDER BY `elec_range` DESC 
LIMIT 20;

/*Tesla only models by range. Have to admit its good incentive to buy one.*/
SELECT DISTINCT model, make, elec_range 
FROM ev_wa 
WHERE `cafv_elig` = "clean alternative fuel vehicle eligible" 
AND elec_range >= 200 
AND make LIKE "tesla"
ORDER BY `elec_range` DESC 
LIMIT 20;

/*Highest density of Teslas by city*/
SELECT city, COUNT(make) AS Tesla
FROM ev_wa 
WHERE make LIKE "tesla" 
GROUP BY city 
ORDER BY tesla DESC 
LIMIT 20;

/*Density of other EV brands by city*/
SELECT city, COUNT(make) AS Other 
FROM ev_wa 
WHERE make NOT LIKE "tesla" 
GROUP BY city 
ORDER BY other DESC 
LIMIT 20;
