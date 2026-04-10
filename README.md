
# 🛒 Zepto Store Analysis – SQL Business Intelligence Project

![MySQL](https://img.shields.io/badge/MySQL-8.0-blue)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

## 📌 Project Overview

Analyzed Zepto's product inventory (7,464 records) using SQL. Performed data cleaning and 20+ business queries to extract insights on inventory optimization, pricing strategy, and revenue potential.

## 🛠️ Tech Stack

MySQL | Data Cleaning | Business Queries | GitHub

## 📂 Dataset

- **Total Records:** 7,464
- **Categories:** 15+
- **Key Columns:** ProductName, Price, DiscountPercent, availableQuantity, OutOfStock

## 🔧 Data Cleaning Performed

- Changed incorrect data types (Price, DiscountPercent to DECIMAL)
- Renamed columns for consistency
- Checked and removed NULL values
- Deleted rows with Price = 0
- Added PRIMARY KEY on sku_id

## 📊 20 Business Questions Answered

### Inventory & Stock
1. Total products in each category
2. Identify out-of-stock products
3. Products weighing > 500 grams
4. Fruits & Vegetables with stock < 10
5. Categories with highest total stock
6. Out-of-stock count per category
7. Products where available quantity < sale quantity

### Pricing & Discount
8. Products with discount > 15%
9. Average discount per category
10. Top 5 most expensive products
11. Categories with average MRP > ₹10,000
12. Zero discount but in-stock products
13. Products with discounted price < ₹100
14. Products with discount between 10-20%

### Revenue & Performance
15. Total potential revenue (MRP × stock)
16. Average weight in Cooking Essentials
17. Products containing "Organic" in name
18. High MRP (>₹15K) but low stock (<5)
19. Average selling price of in-stock products

### Data Quality
20. Duplicate product names identification

## 🔥 Key Insights

- Cooking Essentials and Munchies have highest product count
- Out-of-stock products = missed revenue opportunity
- Zero-discount products are mostly essentials (salt, oil, atta)
- Total estimated revenue from current inventory runs in crores

## 📁 Files

- `zepto_analysis.sql` - Complete SQL script
- `zepto.csv` - Original dataset
- `README.md` - Project documentation

## 🚀 How to Run

```sql
CREATE DATABASE zepto_store_analysis;
USE zepto_store_analysis;
-- Import CSV, then run zepto_analysis.sql
