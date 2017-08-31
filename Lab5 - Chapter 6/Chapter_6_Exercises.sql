-- EXCERCISE #1
SELECT SUM(invoice_total)
FROM invoices;

SELECT COUNT(*) AS number_of_invoices, 
SUM(invoice_total - payment_total- credit_total) AS total_due
FROM invoices
WHERE invoice_total - payment_total - credit_total > 0;

-- EXCERCISE #2
SELECT 'After 1/1/2014' AS selection_date,
	COUNT(*) AS number_of_invoices,
	ROUND(AVG(invoice_total), 2) AS avg_invoice_amt,
	SUM(invoice_total) AS total_invoice_amt
FROM invoices
WHERE invoice_date > '2014-01-01';

SELECT 'After 1/1/2014' AS selection_date,
	COUNT(*) AS number_of_invoices,
	MAX(invoice_total) AS highest_invoice_total,
	MIN(invoice_total) AS lowest_invoice_total
FROM invoices
WHERE invoice_date > '2014-01-01';

SELECT MIN(vendor_name) AS first_vendor,
	MAX(vendor_name) AS last_vendor,
	COUNT(vendor_name) AS number_of_vendors
FROM vendors;

SELECT COUNT(DISTINCT vendor_id) AS number_of_vendors,
	COUNT(vendor_id) AS number_of_invoices,
	ROUND(AVG(invoice_total),2) AS avg_invoice_amt,
	SUM(invoice_total) AS total_invoice_amt
FROM invoices
WHERE invoice_date > '2014-01-01';

-- EXCERCISE #3
SELECT vendor_id, ROUND(AVG(invoice_total), 2) AS average_invoice_amount, COUNT(vendor_id) AS count
FROM invoices
GROUP BY vendor_id
HAVING AVG(invoice_total) > 2000
ORDER BY average_invoice_amount DESC;

-- -- EXCERCISE #4
SELECT vendor_id, COUNT(*) AS invoice_qty
FROM invoices
GROUP BY vendor_id;

SELECT vendor_state, vendor_city, COUNT(*) AS invoice_qty,
    ROUND(AVG(invoice_total),2) AS invoice_avg
FROM invoices JOIN vendors
    ON invoices.vendor_id = vendors.vendor_id
GROUP BY vendor_state, vendor_city;

SELECT vendor_state, vendor_city, COUNT(*) AS invoice_qty,
    ROUND(AVG(invoice_total),2) AS invoice_avg
FROM invoices JOIN vendors
    ON invoices.vendor_id = vendors.vendor_id
GROUP BY vendor_state, vendor_city
HAVING COUNT(*) >= 2;


-- EXCERCISE #5
SELECT vendor_name, 
        COUNT(*) AS invoice_qty, 
        ROUND(AVG(invoice_total),2) AS invoice_avg
FROM vendors JOIN invoices
    ON vendors.vendor_id = invoices.vendor_id
GROUP BY vendor_name
HAVING AVG(invoice_total) > 500
ORDER BY invoice_qty DESC;

SELECT vendor_name, 
        COUNT(*) AS invoice_qty, 
        ROUND(AVG(invoice_total),2) AS invoice_avg
FROM vendors JOIN invoices
    ON vendors.vendor_id = invoices.vendor_id
WHERE invoice_total > 500
GROUP BY vendor_name
ORDER BY invoice_qty DESC;

-- EXCERCISE #6
SELECT 
    invoice_date,
    COUNT(*) AS invoice_qty,
    SUM(invoice_total) AS invoice_sum
FROM invoices
GROUP BY invoice_date
HAVING invoice_date BETWEEN '2014-05-01' AND '2014-05-31'
    AND COUNT(*) > 1
    AND SUM(invoice_total) > 100
ORDER BY invoice_date DESC;

SELECT 
    invoice_date,
    COUNT(*) AS invoice_qty,
    SUM(invoice_total) AS invoice_sum
FROM invoices
WHERE invoice_date BETWEEN '2014-05-01' AND '2014-05-31'
GROUP BY invoice_date
HAVING COUNT(*) > 1
    AND SUM(invoice_total) > 100
ORDER BY invoice_date DESC;

-- EXCERCISE #7
SELECT vendor_id, COUNT(*) AS invoice_count,
    SUM(invoice_total) AS invoice_total
FROM invoices
GROUP BY vendor_id WITH ROLLUP;

SELECT vendor_state, vendor_city, COUNT(*) AS qty_vendors
FROM vendors
WHERE vendor_state IN ('IA', 'NJ')
GROUP BY vendor_state ASC, vendor_city ASC WITH ROLLUP;





