SELECT invoice_number, invoice_date, invoice_total, 
(invoice_total - payment_total - credit_total) AS balance_due
FROM invoices
WHERE invoice_date > '2014-07-03' OR invoice_total > 500
  AND invoice_total - payment_total - credit_total > 0;  
  
SELECT invoice_number, invoice_date, invoice_total, 
(invoice_total - payment_total - credit_total) AS balance_due
FROM invoices
WHERE (invoice_date > '2014-07-03' OR invoice_total > 500)
  AND invoice_total - payment_total - credit_total > 0;