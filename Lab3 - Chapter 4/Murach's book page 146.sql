-- Murach's book page 146
#1
SELECT *
FROM vendors JOIN invoices
ON vendors.vendor_id = invoices.vendor_id;

#2
SELECT vendor_name, invoice_number, invoice_date, invoice_total - payment_total - credit_total AS balance_due
FROM vendors v JOIN invoices i
ON v.vendor_id = i.vendor_id
WHERE invoice_total - payment_total - credit_total <> 0
ORDER BY v.vendor_name;

#3
SELECT vendor_name, default_account_number, account_description
FROM vendors v JOIN general_ledger_accounts gl
ON v.default_account_number = gl.account_number
ORDER BY gl.account_description;

#4
SELECT vendor_name, invoice_date, invoice_number, invoice_sequence AS li_sequence, line_item_amount AS li_amount
FROM vendors v JOIN invoices i 
ON v.vendor_id = i.vendor_id
JOIN invoice_line_items li -- Join the 3rd table after first ON command
ON i.invoice_id = li.invoice_id;

#5 SELF-JOIN
SELECT v1.vendor_id, v1.vendor_name, CONCAT(v1.vendor_contact_first_name, ' ',v1.vendor_contact_last_name) AS contact_name
FROM vendors v1 JOIN vendors v2
ON v1.vendor_id <> v2.vendor_id AND v1.vendor_contact_last_name = v2.vendor_contact_last_name
ORDER BY v1.vendor_contact_last_name;

#6 LEFT JOIN
SELECT gl.account_number, account_description, invoice_id
FROM general_ledger_accounts gl LEFT JOIN invoice_line_items li
ON gl.account_number = li.account_number
WHERE li.invoice_id IS NULL
ORDER BY gl.account_number;

# 7 UNION COMMAND
SELECT vendor_name, vendor_state
FROM vendors
WHERE vendor_state = 'CA'
    UNION
SELECT vendor_name,'Outside CA'
FROM vendors
WHERE vendor_state <> 'CA'
ORDER BY vendor_name