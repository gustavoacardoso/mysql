SELECT 1000 * (1 + .1) AS "10% More Than 1000";

SELECT "Ed" AS first_name, "Williams" AS last_name,
    CONCAT(LEFT("Ed", 1), LEFT("Williams", 1)) AS initials;
    
SELECT DATE_FORMAT(CURRENT_DATE, '%m/%d/%y') AS 'MM/DD/YY',
       DATE_FORMAT(CURRENT_DATE, '%e-%b-%Y') AS 'DD-Mon-YYYY';

SELECT 12345.6789 AS value,
       ROUND(12345.67) AS nearest_dollar,
       ROUND(12345.67, 1) AS nearest_dime;