# Pizza-Sales-Analysis-Project

## 🍕 Introduction

Welcome to the **Pizza Sales Analysis** project— A SQL and PowerBI based analysis.

Athena’s Oven has gathered extensive transactional data over the past year and now seeks meaningful insights to better understand their sales patterns and make informed decisions. As a data analyst, I’m diving into this data to uncover trends and opportunities that can help the business enhance its sales performance and drive greater revenue.

#### 🔍 Project Goals

Your task is to transform raw data into actionable insights, with particular focus on:

- 🕒 Identifying the busiest times for the restaurant
- 🍕 Measuring pizza production during peak periods
- 🌟 Highlighting best and worst-selling pizzas
- 💸 Calculating the average order value
- 💰 Revealing which pizza generates the **highest revenue** overall
- 📅 Uncovering **weekday sales patterns** to optimize staffing and inventory

This README walks you through the project structure, database design, analytical approach, and visual dashboard created to answer these business-critical questions.

## 🛠️ Tools I Used

- **SQL**: Employed for comprehensive data transformation and querying. Crafted normalized table structures from raw transactional data to ensure relational integrity and analytical flexibility.
- **PostgreSQL**: Used as the database engine to store, manage, and optimize data. Enabled efficient joins and aggregations across normalized tables.
- **GitHub**: Utilized for version control, documentation, and sharing of both raw and structured data files with the community.
  
- This project involved cleaning and restructuring raw sales data into a set of normalized tables (e.g., Orders, Pizzas) to enable more efficient querying and scalable analysis. The final dashboard reflects this organized structure, making insights clearer and more actionable. This project showcases the transformation of raw sales data into a relational model using best practices in database design, enabling visualizations through a dynamic dashboard.

## 📁 Project Folder Structure

```text
Pizza-Sales-Analysis/
├── CSV Files/
│   ├── PizzaSales.csv         # Combined raw sales data with details
│   ├── Pizzas.csv             # Pizza metadata (e.g., type, size, category)
│   └── Orders.csv             # Order transaction information
│
├── SQL Files/
│   ├── Schema.sql             # SQL script to create database schema
│   └── Views.sql              # Analytical SQL views for insights
│
├── Pizza Sales Dashboard.pbix # Power BI dashboard for data visualization

└── README.md                  # Project documentation
```

## 📂 Database Schema

![Schema](https://github.com/SarikaGithub1/Pizza-Sales-Analysis-Project/blob/main/Images/Table%20Schema.png)

## 🗃️ Database Schema Overview

The project utilizes two main relational tables to store and analyze pizza sales data:

### 1. `pizzas` Table  
Contains metadata about different pizzas.

- **Row count:** 91  
- **Primary key:** `pizza_id`

| Column Name       | Description                               |
|-------------------|-------------------------------------------|
| `pizza_id`        | Unique identifier for each pizza (Primary Key) |
| `pizza_name_id`   | Short name or code for the pizza          |
| `pizza_name`      | Full display name of the pizza            |
| `pizza_size`      | Available size (e.g., S, M, L, XL)         |
| `unit_price`      | Price of one unit                         |
| `pizza_category`  | Category (e.g., Classic, Veggie, Chicken, Supreme) |
| `pizza_ingredients` | List of ingredients                      |

---

### 2. `orders` Table  
Captures transaction-level sales data.

- **Row count:** 48,620  
- **Foreign key:** `pizza_id` references `pizzas(pizza_id)`

| Column Name     | Description                                    |
|------------------|------------------------------------------------|
| `order_id`      | Unique identifier for each order               |
| `pizza_id`      | Identifier linking to the pizza ordered (Foreign Key) |
| `order_datetime`| Timestamp of when the order was placed         |
| `quantity`      | Number of pizzas ordered                       |
| `total_price`   | Total cost for the ordered quantity            |


## 📊 Dashboard Preview

![Pizza Sales Dashboard Screenshot](/Images/Dashboard.png)

## 🔍 Insights Gained

Through extensive data exploration and dashboard analysis, the following key insights were uncovered from Athena’s Oven's pizza sales data:

- 🕛 **Peak Hour:** The busiest time of day for pizza sales is **12:00 PM**, with approximately **6.5k sales** during that hour alone.
- 📆 **Seasonal Surge:** The **July–August** period saw the highest pizza production volume, totaling **4,392 pizzas**.
- 🍕 **Best & Worst Sellers:**
  - **Best-selling pizza:** `big_meat_s`
  - **Worst-selling pizza:** `the_greek_xxl`
- 💳 **Average Order Value:** Customers spent an average of **$16.82** per order.
- 💰 **Top Revenue Generator:** `thai_ckn_l` emerged as the most profitable pizza, generating **$29.26k** in annual revenue.
- 📊 **Weekday Pattern:** **Thursdays** recorded the highest sales activity across all weekdays.

These insights provide a foundation for data-driven decisions around menu offerings, staffing, inventory, and promotional strategies.
