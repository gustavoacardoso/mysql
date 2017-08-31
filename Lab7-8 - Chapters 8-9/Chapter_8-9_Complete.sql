-- 8-08
SELECT invoice_total, CONCAT('$', invoice_total)
FROM invoices;

SELECT invoice_number, 989319/invoice_number
FROM invoices;

SELECT invoice_date, invoice_date + 1
FROM invoices;

-- 8-09
SELECT invoice_id, invoice_date, invoice_total,
    CAST(invoice_date AS CHAR(10)) AS char_date,
    CAST(invoice_total AS SIGNED) AS integer_total
FROM invoices;

SELECT invoice_id, invoice_date, invoice_total,
    CONVERT(invoice_date, CHAR(10)) AS char_date,
    CONVERT(invoice_total, SIGNED) AS integer_total
FROM invoices;

-- 8-10
SELECT CONCAT(vendor_name, CHAR(13,10), vendor_address1, CHAR(13,10),
       vendor_city, ', ', vendor_state, ' ', vendor_zip_code)
FROM vendors
WHERE vendor_id = 1;

-- 9-02
SELECT vendor_name, 
       CONCAT_WS(', ', vendor_contact_last_name, 
                 vendor_contact_first_name) AS contact_name,
       RIGHT(vendor_phone, 8) AS phone
FROM vendors
WHERE LEFT(vendor_phone, 4) = '(559'
ORDER BY contact_name;

-- 9-03
USE ex;

SELECT * 
FROM string_sample
ORDER BY emp_id;

SELECT * 
FROM string_sample
ORDER BY CAST(emp_id AS SIGNED);

SELECT * 
FROM string_sample
ORDER BY emp_id + 0;

SELECT LPAD(emp_id, 2, '0') AS emp_id, emp_name
FROM string_sample
ORDER BY emp_id;

-- 9-04
USE ex;

SELECT emp_name,
    SUBSTRING_INDEX(emp_name, ' ', 1) AS first_name,
    SUBSTRING_INDEX(emp_name, ' ', -1) AS last_name
FROM string_sample;

SELECT emp_name,
    LOCATE(' ', emp_name) AS first_space,
    LOCATE(' ', emp_name, LOCATE(' ', emp_name) + 1) AS second_space
FROM string_sample;

SELECT emp_name,
    SUBSTRING(emp_name, 1, LOCATE(' ', emp_name) - 1) AS first_name,
    SUBSTRING(emp_name, LOCATE(' ', emp_name) + 1) AS last_name
FROM string_sample;

-- 9-06
USE ex;

SELECT * 
FROM float_sample
WHERE float_value = 1;

SELECT * 
FROM float_sample
WHERE float_value BETWEEN 0.99 AND 1.01;

SELECT *
FROM float_sample
WHERE ROUND(float_value, 2) = 1.00;

-- 9-12
USE ex;

SELECT * 
FROM date_sample
WHERE start_date = '2014-02-28';

SELECT * 
FROM date_sample
WHERE start_date >= '2014-02-28' AND start_date < '2014-03-01';

SELECT * 
FROM date_sample
WHERE MONTH(start_date) = 2 AND 
      DAYOFMONTH(start_date) = 28 AND 
      YEAR(start_date) = 2014;
      
SELECT * 
FROM date_sample
WHERE DATE_FORMAT(start_date, '%m-%d-%Y') = '02-28-2014';

-- 9 - 13
USE ex;

SELECT * FROM date_sample
WHERE start_date = '10:00:00';

SELECT * FROM date_sample
WHERE DATE_FORMAT(start_date, '%T') = '10:00:00';

SELECT * FROM date_sample
WHERE EXTRACT(HOUR_SECOND FROM start_date) = 100000;

SELECT * FROM date_sample
WHERE HOUR(start_date) = 9;

SELECT * FROM date_sample
WHERE EXTRACT(HOUR_MINUTE FROM start_date) BETWEEN 900 AND 1200;

-- 9-14
SELECT invoice_number, terms_id,
    CASE terms_id
        WHEN 1 THEN 'Net due 10 days'
        WHEN 2 THEN 'Net due 20 days'
        WHEN 3 THEN 'Net due 30 days'
        WHEN 4 THEN 'Net due 60 days'
        WHEN 5 THEN 'Net due 90 days'
    END AS terms
FROM invoices;

SELECT invoice_number, invoice_total, invoice_date, invoice_due_date,
    CASE 
      WHEN DATEDIFF(NOW(), invoice_due_date) > 30
        THEN 'Over 30 days past due'
      WHEN DATEDIFF(NOW(), invoice_due_date) > 0
        THEN '1 to 30 days past due'
      ELSE 'Current'
    END AS invoice_status
FROM invoices
WHERE invoice_total - payment_total - credit_total > 0;

-- 9-15
SELECT vendor_name, 
       IF(vendor_city = 'Fresno', 'Yes', 'No') AS is_city_fresno
FROM vendors;

SELECT payment_date,
       IFNULL(payment_date, 'No Payment') AS new_date
FROM invoices;

SELECT payment_date,
       COALESCE(payment_date, 'No Payment') AS new_date
FROM invoices;


