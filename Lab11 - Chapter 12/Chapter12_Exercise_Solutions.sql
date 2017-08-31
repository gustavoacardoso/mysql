-- 1
CREATE OR REPLACE VIEW open_items
AS
SELECT vendor_name, invoice_number, invoice_total,
  invoice_total - payment_total - credit_total AS balance_due
FROM  vendors JOIN invoices
  ON vendors.vendor_id = invoices.vendor_id
WHERE invoice_total - payment_total - credit_total > 0
ORDER BY vendor_name;

-- 2
SELECT *
FROM open_items
WHERE balance_due >= 1000;

-- 3
CREATE OR REPLACE VIEW open_items_summary
AS
SELECT vendor_name, COUNT(*) AS open_item_count,
       SUM(invoice_total - credit_total - payment_total) AS open_item_total
FROM vendors JOIN invoices
  ON vendors.vendor_id = invoices.vendor_id
WHERE invoice_total - credit_total - payment_total > 0
GROUP BY vendor_name
ORDER BY open_item_total DESC;

-- 4
SELECT *
FROM open_items_summary
LIMIT 5;

-- 5
CREATE OR REPLACE VIEW vendor_address
AS
SELECT vendor_id, vendor_address1, vendor_address2, vendor_city, vendor_state, vendor_zip_code
FROM vendors;

-- 6
UPDATE vendor_address
SET vendor_address1 = '1990 Westwood Blvd',
    vendor_address2 = 'Ste 260'
WHERE vendor_id = 4;




