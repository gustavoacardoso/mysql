#1
SELECT invoice_number AS 'Invoice Number' , invoice_date AS 'Date', (invoice_total - payment_total - credit_total) AS 'Amount Due'
FROM invoices
WHERE (invoice_total - payment_total - credit_total) >= 500
ORDER BY (invoice_total - payment_total - credit_total) DESC;

#2 
SELECT invoice_number AS 'Invoice Number', payment_total AS 'Invoice Amount'
FROM invoices
WHERE payment_total % 2 = 1 AND payment_total > 100
ORDER BY payment_total DESC;

#3
SELECT CONCAT(vendor_contact_first_name,' ',vendor_contact_last_name, '  // ',vendor_name, '  // ', vendor_phone) AS 'Vendor Contact Information'
FROM vendors
WHERE vendor_state = 'NJ';

#4
SELECT vendor_contact_first_name AS 'First Name', vendor_contact_last_name AS 'last Name', vendor_city AS 'City'
FROM vendors
WHERE LEFT(vendor_contact_first_name,1) = LEFT(vendor_city,1);

#5
SELECT v.vendor_name AS 'Vendor Name', i.invoice_number AS 'Invoice Number'
FROM vendors v JOIN invoices i
    ON v.vendor_id = i.vendor_id
WHERE vendor_name = 'Federal Express Corporation'
ORDER BY invoice_id
LIMIT 5;

#6
SELECT DISTINCT v1.vendor_contact_first_name AS 'Vendors with same first name'
FROM vendors v1 JOIN vendors v2
    ON v1.vendor_contact_first_name = v2.vendor_contact_first_name AND
    v1.vendor_id <> v2.vendor_id;

#7
SELECT vendor_name, invoice_number, line_item_amount
FROM vendors v JOIN invoices i ON v.vendor_id = i.vendor_id
               JOIN invoice_line_items il ON i.invoice_id = il.invoice_id
WHERE v.vendor_name = 'Federal Express Corporation'
ORDER BY i.invoice_id
LIMIT 5;

#8 
SELECT vendor_name, invoice_number, invoice_total
FROM vendors v LEFT JOIN invoices i
    ON v.vendor_id = i.vendor_id
WHERE invoice_number is null AND invoice_total is null
ORDER BY vendor_name DESC
LIMIT 5;

#9
INSERT INTO invoices(invoice_id,vendor_id,invoice_number,invoice_date,invoice_total,credit_total,terms_id,invoice_due_date)
VALUES (DEFAULT,1,43523,'2016-03-08','105.20',0,3,'2016-03-08');

#10
UPDATE vendors
SET vendor_contact_first_name = 'William'
WHERE vendor_contact_first_name = 'Bill';

#11
DELETE FROM general_ledger_accounts
WHERE account_number = 100;

#12
SELECT COUNT(v.vendor_id) AS 'Number of Vendors with no invoices'
FROM vendors v LEFT JOIN invoices i
    ON v.vendor_id = i.vendor_id
WHERE invoice_number is null AND invoice_total is null;
    
#13
SELECT COUNT(DISTINCT v.vendor_id) AS 'Number of Vendors with invoices'
FROM vendors v JOIN invoices i
    ON v.vendor_id = i.vendor_id;
    
#14 
SELECT v.vendor_name AS 'Vendor Name', COUNT(v.vendor_id) AS 'Number of Invoices'
FROM vendors v JOIN invoices i
    ON v.vendor_id = i.vendor_id
GROUP BY v.vendor_name
ORDER BY v.vendor_id DESC
LIMIT 5;

#15
SELECT invoice_number, invoice_date, invoice_total
FROM invoices
WHERE invoice_total < (SELECT AVG(invoice_total) FROM invoices)
ORDER BY invoice_total DESC;