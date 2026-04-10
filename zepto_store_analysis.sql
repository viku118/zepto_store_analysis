create database zepto_store_analysis;
use zepto_store_analysis;
select*from zepto;

describe zepto;

#change the datatype and rename the column names 

alter table zepto change price Price decimal(10,2) ;
alter table zepto change discountpercent Discountpercent decimal(5,2);
alter table zepto change discountedsellingprice   DiscountedSellingprice decimal(10,2) ;
alter table zepto change weightingrams Weightingrams bigint;
alter table zepto change productname Productname varchar(200) ;
alter table zepto change outofstock Outofstock char(20) ;
alter table zepto add primary key (sku_id);

# to check the null value
select *from zepto where sku_id is null 
or category is null 
or productname is null 
or price is null 
or discountpercent is null 
or availablequantity is null 
or discountedsellingprice is null 
or weightingrams is null
or outofstock is null 
or quantity is null ;


#data cleaning

select *from zepto where price=0 or discountedsellingprice=0;

delete from zepto where price=0 or discountedsellingprice=0;

set sql_safe_updates=0;


#Find total number of products in each category.

select category, count(*) as count_of_product from zepto
group by category;

#Identify products that are out of stock.

select productname from zepto where outofstock="true";

#Filter products with discount greater than 15%.

select productname,discountpercent from zepto where discountpercent>15;

#Estimate average discount percentage for each category.

select category,avg(discountpercent) as estimated_avg_discount_percent
from zepto
group by category 
order by estimated_avg_discount_percent desc;

#Find top 5 most expensive products (highest MRP).

select productname,price from zepto 
order by price desc
 limit 5 ;

#Identify categories where average MRP is above ₹10,000.

select category,avg(price) as avg_price from zepto 
group by category having avg_price>10000 order by avg_price desc ;

#Filter products that weight more than 500 grams.

select productname,weightingrams from zepto
where weightingrams>500 order by weightingrams desc;

#Estimate total potential revenue  for whole dataset.

select round(sum(price*availablequantity),2) as total_potentital_revenue
 from zepto;
 
 #Find products that have zero discount but are in stock.
 
 select productname,discountpercent,outofstock
 from zepto 
 where
 discountpercent=0 and outofstock="false";
 
 
 #Identify duplicate product names (same name appearing multiple times).
 
 select productname,count(*) as count_of_duplicates
 from zepto
 group by productname having count_of_duplicates>1
 order by count_of_duplicates desc;
 
 #Filter products from 'Fruits & Vegetables' category with stock less than 10.
 
 select productname,availablequantity from zepto 
 where category="Fruits & Vegetables"
 and availablequantity<10;
 
 
 #Estimate average weight of products in 'Cooking Essentials' category.
 
 select category,productname,avg(weightingrams) as avg_weightof_product
 from zepto
 where category="Cooking Essentials"
 group by productname 
 order by avg_weightof_product desc ;
 
 # Find products where discounted price is less than ₹100.

select productname,discountedsellingprice 
from zepto
where discountedsellingprice<100;

#Identify categories with highest total stock

select category,sum(availablequantity) as total_stock
from zepto
group by category 
order by total_stock desc;

#Filter products that contain 'Organic' in their name.

select distinct productname from zepto
where productname like "%organic%";

#Estimate how many products are out of stock in each category.

select category,productname,
count(*) as out_of_stock
from zepto
where outofstock="true"
group by category;

# Find products with high MRP (>₹15,000) but low stock (<5).

select productname,price,availablequantity
from zepto 
where price>15000 and availablequantity<5;

#Filter products with discount between 10% and 20%.

select productname,discountpercent
from zepto 
where discountpercent between 10 and 20;


#Estimate average discounted selling price for in-stock products only.

select distinct productname,avg(discountedsellingprice) 
as avg_selling_price
from zepto
where outofstock="false"
group by productname;
 
 #Identify products where available quantity is less than the quantity column. 
 
 SELECT productname, availableQuantity, quantity
FROM zepto
WHERE availableQuantity < quantity;
