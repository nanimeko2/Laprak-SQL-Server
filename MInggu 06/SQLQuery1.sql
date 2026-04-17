create database DB_Marketing;

-- Create a table named "sales" to illustrate aggregate function
CREATE TABLE sales (
    order_id INT PRIMARY KEY, -- id transaksi penjualan
    product_name VARCHAR(50), -- nama produk
    quantity INT, -- kuantitas barang yang terjual
    price DECIMAL(10, 2), -- harga barang satuan
    order_date DATE -- tanggal pemesanan
);

insert into sales (order_id, product_name, quantity, price, order_date)
values
(1, 'Product A', 5, 10.00, '2026-01-01'),
(2, 'Product B', 12, 25.50, '2026-01-15'),
(3, 'Product C', 8, 42.00, '2026-01-20'),
(4, 'Product D', 20, 15.75, '2026-02-02'),
(5, 'Product E', 3, 120.00, '2026-02-10'),
(6, 'Product F', 15, 33.40, '2026-02-18'),
(7, 'Product G', 22, 19.99, '2026-03-01'),
(8, 'Product H', 7, 55.00, '2026-03-05'),
(9, 'Product I', 10, 8.50, '2026-03-12'),
(10, 'Product J', 30, 12.00, '2026-03-25'),
(11, 'Product K', 5, 210.00, '2026-04-01'),
(12, 'Product L', 18, 27.25, '2026-04-05'),
(13, 'Product M', 14, 38.00, '2026-04-12'),
(14, 'Product N', 25, 11.50, '2026-04-20'),
(15, 'Product O', 9, 64.00, '2026-05-02'),
(16, 'Product P', 11, 45.90, '2026-05-10'),
(17, 'Product Q', 6, 88.00, '2026-05-18'),
(18, 'Product R', 13, 22.10, '2026-06-01'),
(19, 'Product S', 21, 14.25, '2026-06-07'),
(20, 'Product T', 4, 150.00, '2026-06-15'),
(21, 'Product U', 17, 31.00, '2026-07-01'),
(22, 'Product V', 19, 29.50, '2026-07-10'),
(23, 'Product W', 2, 320.00, '2026-07-22'),
(24, 'Product X', 16, 18.75, '2026-08-05'),
(25, 'Product Y', 28, 9.99, '2026-08-12'),
(26, 'Product Z', 10, 75.50, '2026-08-25')

select *
from sales
 
-- Fungsi Agregat
 
-- SUM
-- menghitung total pendapatan seluruh transaksi
select SUM(quantity*price) as total_revenue -- rumus revenue / omzet = jumlah barang terjual * harga satuan
from sales;
 
-- menghitung total jumlah barang yang terjual
select SUM(quantity) as total_quantity_sold
from sales;
 
-- COUNT()
-- menghitung jumlah data di kolom tertentu
select count(order_id)
from sales;
 
-- menghitung jumlah baris di sebuah tabel
select count(*)
from sales;

-- AVG()
-- menghitung harga jual satuan rata-rata
select avg(quantity) avg_price
from sales;

-- MIN()
-- menghitung nilai minimal
select min(price) min
from sales;

-- MAX()
-- menghitung nilai maxsimal
select max(quantity) max
from sales;