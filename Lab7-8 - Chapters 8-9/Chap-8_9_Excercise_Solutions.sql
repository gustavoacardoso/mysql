-- 8-01
SELECT invoice_total,
       FORMAT(invoice_total, 1) AS total_format,
       CONVERT(invoice_total, SIGNED) AS total_convert, 
       CAST(invoice_total AS SIGNED) AS total_cast
FROM invoices;
 
 -- 8-02
 SELECT invoice_date, 
       CAST(invoice_date AS DATETIME) AS invoice_datetime, 
       CAST(invoice_date AS CHAR(7)) AS invoice_char7
FROM invoices;

-- 9-01
SELECT invoice_total, ROUND(invoice_total, 1) AS one_digit, 
    ROUND(invoice_total, 0) AS zero_digits
FROM invoices;

-- 9-02
SELECT start_date, 
    DATE_FORMAT(start_date, '%b/%d/%y') AS format1, 
    DATE_FORMAT(start_date, '%c/%e/%y') AS format2, 
    DATE_FORMAT(start_date, '%l:%i %p') AS twelve_hour,
    DATE_FORMAT(start_date, '%c/%e/%y %l:%i %p') AS format3 
FROM date_sample;

-- 9-03
SELECT vendor_name,
    UPPER(vendor_name) AS vendor_name_upper,
    vendor_phone,
    SUBSTRING(vendor_phone, 11) AS last_digits,
    REPLACE(REPLACE(REPLACE(vendor_phone, '(', ''), ') ', '.'), '-', '.') AS phone_with_dots, 
    SUBSTRING(vendor_name, 
        LOCATE(' ', vendor_name),
        LOCATE(' ', vendor_name, LOCATE(' ', vendor_name) + 1) - LOCATE(' ', vendor_name))
        AS second_word
FROM vendors;

-- 9-04
SELECT invoice_number,
       invoice_date,
       DATE_ADD(invoice_date, INTERVAL 30 DAY) AS date_plus_30_days,
       payment_date,
       DATEDIFF(payment_date, invoice_date) AS days_to_pay,
       MONTH(invoice_date) AS "month",
       YEAR(invoice_date) AS "year"
FROM invoices
WHERE invoice_date > '2014-04-30' AND invoice_date < '2014-06-01';