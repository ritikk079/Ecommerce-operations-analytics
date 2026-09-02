# E-Commerce Operations Analytics — Olist Dataset

A SQL + Power BI analysis of a Brazilian e-commerce marketplace (Olist), focused on the kind of operational questions a Data Analyst is actually asked to answer: revenue drivers, delivery performance, customer satisfaction, and payment behavior.

![Dashboard Overview](Screenshots/dashboard_overview.pn)g

## Business Problem

E-commerce operations teams need to understand where revenue comes from, whether logistics performance is meeting customer expectations, and how operational issues (like late deliveries) impact customer satisfaction. This project answers four core questions using SQL for analysis and Power BI for visualization:

1. Which product categories drive the most revenue?
2. How does delivery performance vary by region?
3. Does delivery performance actually affect customer satisfaction?
4. How do customers prefer to pay?

## Dataset

[Olist Brazilian E-Commerce Public Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) — ~100,000 real orders placed on the Olist marketplace between 2016-2018, spanning customers, orders, order items, payments, reviews, products, and sellers across 9 linked tables.

## Tools

- **SQL (SQLite)** — data cleaning, validation, and exploratory analysis
- **Power BI Desktop** — dashboard and data modeling
- **DB Browser for SQLite** — database management

## Approach

1. **Data validation** — checked row counts, null rates, duplicate keys, and join integrity across all 9 tables before analysis. Caught and fixed a table with a duplicated import (customers table had ~12x too many rows) and several tables that had imported without proper headers.
2. **SQL analysis** — wrote 4 business-question queries covering revenue, logistics, customer satisfaction, and payments (see `/sql`).
3. **Dashboard** — rebuilt the same analysis visually in Power BI, including a relational data model connecting all 7 core tables.

## Key Insights

**1. Health & Beauty and Watches & Gifts lead in revenue**, but with very different order profiles — Watches & Gifts generates nearly as much revenue (R$1.2M) with 36% fewer orders than Health & Beauty, suggesting a materially higher average order value.

**2. Deliveries consistently arrive early, not late** — every single state in the dataset shows a *negative* average delay (8 to 12.5 days ahead of the estimated delivery date). This suggests Olist intentionally sets conservative delivery estimates rather than facing systemic fulfillment delays.

**3. Late delivery has a severe impact on customer satisfaction.** Orders delivered late score an average of **2.57/5** in reviews, compared to **4.29/5** for on-time or early orders — a 40% drop, affecting roughly 8% of all delivered orders. Delivery reliability is one of the highest-leverage areas for improving customer experience on the platform.

**4. Credit card dominates payments** (74% of all transactions) and is the only method customers commonly split into installments (avg. 3.5), while boleto, debit card, and vouchers are almost always paid in full upfront.

## Repository Structure

```
ecommerce-analytics/
├── data/                    # Raw Olist CSV files (not included — download from Kaggle)
├── sql/
│   ├── 01_top_categories.sql
│   ├── 02_delivery_delay_by_state.sql
│   ├── 03_review_score_vs_delivery.sql
│   └── 04_payment_methods.sql
├── screenshots/
│   └── dashboard_overview.png
├── dashboard.pbix           # Power BI file
└── README.md
```

## How to Reproduce

1. Download the [Olist dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) and place the CSVs in `/data`
2. Import the CSVs into a SQLite database using DB Browser for SQLite
3. Run the queries in `/sql` to reproduce the analysis
4. Open `dashboard.pbix` in Power BI Desktop to explore the interactive dashboard

## Author

**Ritik Kumar** — Data Analyst
[LinkedIn](https://linkedin.com/in/ritik-kumar-229857364) | [GitHub](https://github.com/ritikk079)
