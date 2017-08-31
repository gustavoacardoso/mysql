SELECT * 
FROM invoices;

SELECT invoice_number, invoice_date, invoice_total
FROM invoices
ORDER BY invoice_total DESC;
 
SELECT invoice_id, invoice_total,
       credit_total + payment_total AS total_credits
FROM invoices
WHERE invoice_id = 17;
 
SELECT invoice_number, invoice_date, invoice_total
FROM invoices
WHERE invoice_date BETWEEN '2014-06-01' AND '2014-06-30'
ORDER BY invoice_date;
 
SELECT invoice_number, invoice_date, invoice_total
FROM invoices
WHERE invoice_total > 50000;