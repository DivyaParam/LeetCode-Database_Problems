Table: Customers

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| customer_id   | int     |
| customer_name | varchar |
| email         | varchar |
+---------------+---------+
customer_id is the column of unique values for this table.
Each row of this table contains the name and the email of a customer of an online shop.
 

Table: Contacts

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| user_id       | id      |
| contact_name  | varchar |
| contact_email | varchar |
+---------------+---------+
(user_id, contact_email) is the primary key (combination of columns with unique values) for this table.
Each row of this table contains the name and email of one contact of customer with user_id.
This table contains information about people each customer trust. The contact may or may not exist in the Customers table.
 

Table: Invoices

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| invoice_id   | int     |
| price        | int     |
| user_id      | int     |
+--------------+---------+
invoice_id is the column of unique values for this table.
Each row of this table indicates that user_id has an invoice with invoice_id and a price.
 

Write a solution to find the following for each invoice_id:

customer_name: The name of the customer the invoice is related to.
price: The price of the invoice.
contacts_cnt: The number of contacts related to the customer.
trusted_contacts_cnt: The number of contacts related to the customer and at the same time they are customers to the shop. (i.e their email exists in the Customers table.)
Return the result table ordered by invoice_id.
------------------------------------------------------
SELECT i.invoice_id,
       c.customer_name,
       i.price,
       Count(d.user_id)            contacts_cnt,
       count(cus2.email) trusted_contacts_cnt
FROM   customers c
       LEFT OUTER JOIN contacts d
                    ON c.customer_id = d.user_id
       INNER JOIN invoices i
               ON i.user_id = c.customer_id
       LEFT JOIN customers cus2
              ON cus2.email = d.contact_email
GROUP  BY c.customer_name,
          i.invoice_id,
          i.price
ORDER  BY invoice_id 