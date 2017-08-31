INSERT INTO invoices VALUES
(115, 97, '456789', '2014-08-01', 8344.50, 0, 0, 1, '2014-08-31', NULL);

INSERT INTO invoices
	(vendor_id, invoice_number, invoice_total, terms_id, invoice_date, invoice_due_date)
VALUES
	(97, '456789', 8344.50, 1, '2014-08-01', '2014-08-31');

INSERT INTO invoices VALUES
(119, 97, '456701', '2014-08-02', 270.50, 0, 0, 1, '2014-09-01', NULL),
(117, 97, '456791', '2014-08-03', 4390.00, 0, 0, 1, '2014-09-02', NULL),
(118, 97, '456792', '2014-08-03', 565.60, 0, 0, 1, '2014-09-02', NULL);



INSERT INTO color_sample (color_number)
VALUES (606);

INSERT INTO color_sample (color_name)
VALUES ('Yellow');

INSERT INTO color_sample
VALUES (DEFAULT, DEFAULT, 'Orange');

INSERT INTO color_sample
VALUES (DEFAULT, 808, NULL);

INSERT INTO color_sample
VALUES (DEFAULT, DEFAULT, NULL);

INSERT INTO invoice_archive
SELECT *
FROM invoices
WHERE invoice_total - payment_total - credit_total = 0;

INSERT INTO invoice_archive
	(invoice_id, vendor_id, invoice_number, invoice_total, credit_total,
	payment_total, terms_id, invoice_date, invice_due_date)
SELECT
	invoice_id, vendor_id, invoice_number, invoice_total, credit_total,
	payment_total, terms_id, invoice_date, invice_due_date
FROM invoices
WHERE invoice_total - payment_total - credit_total = 0;

UPDATE invoices
SET payment_date = '2014-09-21',
	payment_total = 19351.18
WHERE invoice_number = '97/522';

UPDATE invoices
SET terms_id = 1
WHERE vendor_id = 95;

UPDATE invoices
SET credit_total = credit_total + 100
WHERE invoice_number = '97/522';

UPDATE invoices
SET terms_id = 1
WHERE vendor_id = 
	(SELECT vendor_id
	FROM vendors
	WHERE vendor_name = 'Pacific Bell');

UPDATE invoices
SET terms_id = 1
WHERE vendor_id IN
	(SELECT vendor_id
	FROM vendors
	WHERE vendor_state IN('CA', 'AZ', 'NV'));

DELETE FROM general_ledger_accounts
WHERE account_number = 306;

DELETE FROM invoice_line_items
WHERE invoice_id = 78 AND invoice_sequence = 2;

DELETE FROM invoice_line_items
WHERE invoice_id = 12;

DELETE FROM invoice_line_items
WHERE invoice_id IN
	(SELECT invoice_id
	FROM invoices
	WHERE vendor_id = 115);












