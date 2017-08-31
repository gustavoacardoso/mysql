USE ex;

SELECT * FROM null_sample;

SELECT * FROM null_sample
WHERE invoice_total = 0;

SELECT * FROM null_sample
WHERE invoice_total <> 0;

SELECT * FROM null_sample
WHERE invoice_total IS NULL;

SELECT * 
FROM null_sample
WHERE invoice_total IS NOT NULL;