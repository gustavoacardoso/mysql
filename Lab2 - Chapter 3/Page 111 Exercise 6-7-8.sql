#Page 111 Exercise 6
SELECT vendor_name, vendor_contact_last_name, vendor_contact_first_name
FROM vendors
ORDER BY vendor_contact_last_name;

#Exercise 7
SELECT CONCAT(vendor_contact_last_name, ', ', vendor_contact_first_name) AS full_name
FROM vendors
WHERE vendor_contact_last_name REGEXP '^A|^B|^C|^D'
ORDER BY vendor_contact_last_name;

#Exercise 8
SELECT invoice_due_date AS 'Due Date', invoice_total AS 'Invoice Total', invoice_total * .1 AS '10%', invoice_total * (1 + .1) AS 'Plus 10%'
FROM invoices
WHERE invoice_total >= 500 AND invoice_total <= 1000