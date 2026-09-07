# 🍕 Pizza Sales Analysis (SQL Project)

> SQL-based analysis of 21,000+ pizza orders to uncover revenue drivers, best-selling products, and peak ordering patterns.

An end-to-end SQL analytics project built on a pizza restaurant's 2015 sales data. Using MySQL, this project answers real business questions around revenue, product performance, and customer ordering behavior — turning four raw relational tables into clear, decision-ready insights.

---

## 📑 Table of Contents

- [Dataset Overview](#-dataset-overview)
- [Database Schema](#️-database-schema)
- [Business Questions Answered](#-business-questions-answered)
- [Key Insights](#-key-insights)
  - [Sales & Revenue](#1-sales--revenue-insights)
  - [Product Insights](#2-product-insights)
  - [Category Insights](#3-category-insights)
  - [Time & Order Patterns](#4-time--order-pattern-insights)
- [SQL Concepts Used](#-sql-concepts-used)
- [Tools Used](#️-tools-used)
- [Repository Structure](#-repository-structure)
- [How to Use](#-how-to-use)
- [Future Enhancements](#-future-enhancements)
- [Author & Contact](#-author--contact)

---
             
## 📁 Dataset Overview
                                                         
| Metric | Value |
|---|---|
| Total Orders | 21,350 |
| Total Order Line Items | 48,620 |
| Total Pizzas Sold | 49,574 |
| Total Revenue | ~$817,860 |
| Date Range | Jan 1, 2015 – Dec 31, 2015 |
| Pizza Types | 32 |
| Pizza Sizes/Variants | 96 |
| Categories | Chicken, Classic, Supreme, Veggie |

**Source files:**
- `orders.csv` – Order ID, date, and time of each order
- `order_details.csv` – Line-item level detail: order ID, pizza ID, and quantity
- `pizzas.csv` – Pizza ID, type, size, and price
- `pizza_types.csv` – Pizza name, category, and ingredients
- `Pizza.sql` – Full SQL script with table creation and all analysis queries

---
                                       
## 🗄️ Database Schema

The dataset is modeled as four relational tables in MySQL:
                
```
orders (order_id, date, time)
        │
        │ 1:N
        ▼
order_details (order_details_id, order_id, pizza_id, quantity)
        │
        │ N:1
        ▼
pizzas (pizza_id, pizza_type_id, size, price)
        │
        │ N:1
        ▼
pizza_types (pizza_type_id, name, category, ingredients)
```

`orders` and `order_details` are joined on `order_id`; `order_details`, `pizzas`, and `pizza_types` are joined through `pizza_id` and `pizza_type_id` to compute revenue, quantity, and category-level metrics.

---

## ❓ Business Questions Answered

This project answers the following questions using SQL (full queries in [`Pizza.sql`](Pizza.sql)):

1. What is the total number of orders placed?
2. What is the total revenue generated from pizza sales?
3. Which is the highest-priced pizza?
4. What is the most common pizza size ordered?
5. What are the top 5 most ordered pizza types along with their quantities?
6. What is the total quantity ordered per pizza category?
7. What is the distribution of orders by hour of the day?
8. What is the category-wise distribution of pizzas offered?
9. What is the average number of pizzas ordered per day?
10. What are the top 3 most ordered pizza types based on revenue?

*(Plus additional queries covering monthly revenue, revenue contribution %, average price by category, peak hours, and orders by day of week.)*

---

## 🔑 Key Insights

### 1. Sales & Revenue Insights
- **Total Orders:** 21,350
- **Total Pizzas Sold:** 49,574
- **Total Revenue:** ~$817,860
- **Top Revenue Category:** Classic (~$220K), followed closely by Supreme (~$208K) and Chicken (~$196K)
- **Top 5 Pizzas by Revenue:** The Thai Chicken, Barbecue Chicken, California Chicken, Classic Deluxe, and Spicy Italian pizzas drive the highest revenue

### 2. Product Insights
- **Highest-Priced Pizza:** The Greek Pizza (XXL) at **$35.95**
- **Most Common Size Ordered:** **Large (L)** — 18,526 orders, ahead of Medium (15,385) and Small (14,137)
- **Top 5 Most Ordered Pizzas (by quantity):** Classic Deluxe (2,453), Barbecue Chicken (2,432), Hawaiian (2,422), Pepperoni (2,418), and Thai Chicken (2,371)

### 3. Category Insights
- **Most Ordered Category:** Classic pizzas lead in both quantity and revenue
- **Widest Menu Category:** Veggie has the most variants (27), followed by Classic (26) and Supreme (25)
- **Highest Average Price:** Supreme pizzas have the highest average price (~$16.79), followed closely by Chicken (~$16.75)

### 4. Time & Order Pattern Insights
- **Peak Ordering Hours:** 12 PM (lunch) and 5–7 PM (dinner) are the busiest hours, with 12–1 PM being the single busiest slot
- **Busiest Day of the Week:** **Friday**, followed by Thursday and Saturday — confirming a strong weekend/end-of-week ordering pattern
- **Quietest Day:** Sunday sees the lowest order volume

---

## 🧠 SQL Concepts Used

- Multi-table `JOIN`s (INNER JOIN across 4 tables)
- Aggregate functions: `SUM`, `COUNT`, `AVG`, `ROUND`
- `GROUP BY` and `ORDER BY` for category/time-based breakdowns
- Subqueries (for revenue percentage contribution)
- Date/time functions: `MONTH()`, `MONTHNAME()`, `DAYNAME()`, `HOUR()`, `DAY()`
- `LIMIT` for top-N analysis (Top 3, Top 5 rankings)

---

## 🛠️ Tools Used

- **MySQL** – Database creation, querying, and business analysis
- **Dataset:** Pizza Place Sales dataset (order, product, and pricing data for a pizza restaurant)

---

## 📂 Repository Structure

```
├── Pizza.sql                          # Table creation + all analysis queries
├── orders.csv                         # Order ID, date, time
├── order_details.csv                  # Order line items (pizza + quantity)
├── pizzas.csv                         # Pizza ID, type, size, price
├── pizza_types.csv                    # Pizza name, category, ingredients
├── Pizza_Sales_Analysis_questions.pdf # Original business questions brief
└── README.md
```

---

## 🚀 How to Use

1. Clone this repository.
2. Open `Pizza.sql` in MySQL Workbench (or any MySQL client).
3. Run the `CREATE DATABASE` and `CREATE TABLE` statements at the top of the script.
4. Import the four CSV files (`orders`, `order_details`, `pizzas`, `pizza_types`) into their respective tables.
5. Run the analysis queries section by section to reproduce each insight.

---

## 📌 Future Enhancements

- Build a Power BI / Tableau dashboard on top of these SQL query results for visual reporting
- Add customer-level analysis if customer ID data becomes available
- Perform basket analysis to identify pizzas frequently ordered together
- Automate monthly/quarterly reporting via stored procedures or views

---

## 👤 Author & Contact

**Mandeep Kaur**

- 📧 Email: kaur.mandeeep.08@gmail.com
- 💼 LinkedIn:(https://www.linkedin.com/in/-mandeep-kaur-/)
- 🐙 GitHub:(https://github.com/mandeepkaur-tech)

Feel free to reach out for feedback, collaboration, or questions about this project!

---

*This project is for educational and portfolio purposes, analyzing publicly available pizza sales data.*
