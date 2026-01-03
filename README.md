Retail Sales & Customer Analytics Dashboard

📌 Project Overview

This project delivers an end-to-end retail analytics solution designed to analyze sales performance and customer behavior using real-world transactional data.

The workflow covers data ingestion, cleaning, dimensional modeling, KPI calculation, and interactive dashboard development.
The final output supports management-level decision-making through clear, data-driven insights and executive-ready visualizations.

Key technologies: SQL Server, Python, Power BI, Excel, GitHub

📊 Dataset Description

The dataset consists of historical retail transaction records, including:

Invoice and order information

Product details (stock code, description)

Customer identifiers

Quantity and unit price

Transaction dates

The raw data reflects real-world inconsistencies and required cleaning, validation, and transformation prior to analysis.

🎯 Project Scope
In Scope

Sales performance analysis (monthly trends, revenue growth)

Product performance analysis (top products, revenue contribution)

Customer analytics (order behavior, revenue per customer)

KPI-driven reporting

Dimensional modeling using star schema

Interactive dashboards using Power BI

Out of Scope

Sales forecasting

Machine learning models

Recommendation systems

Advanced AI or deep learning solutions

🧹 Data Cleaning Summary

Initial data preparation was performed using Python and Excel:

Removed records with missing CustomerID

Excluded transactions with non-positive quantities or prices

Created derived analytical columns (TotalPrice, OrderDate, OrderMonth)

Standardized date and numeric formats

Exported a cleaned dataset for SQL ingestion

🏗️ Data Ingestion & Staging (SQL Server)
Objective

Load cleaned retail data into SQL Server using a robust and production-oriented approach that handles real-world data issues safely.

Approach

Instead of using SQL Server BULK INSERT (which is sensitive to encoding, permissions, and strict schema constraints), a Python-based ETL approach was implemented.

Staging Design

Database: RetailAnalytics

Table: staging_sales

All columns defined as VARCHAR(MAX)

Acts as a raw ingestion layer (no type enforcement)

This design ensures ingestion reliability and mirrors industry-standard ELT practices.

Loading Process

Data loaded from cleaned_data.csv using pandas

SQL Server connection via SQLAlchemy + pyodbc

Staging table truncated before load (idempotent design)

Chunked inserts for performance optimization

Result

397,884 records successfully loaded into staging_sales

🔄 Data Transformation & Fact Table

Data from the staging layer was transformed into an analytics-ready fact table using SQL.

Key Transformations

Safe type casting using TRY_CAST and TRY_PARSE

Locale-aware date parsing (en-GB)

Removal of invalid or inconsistent records

Standardization of numeric and date fields

Output

Fact table: fact_sales

Valid records loaded: 168,631

This table serves as the analytical foundation for dimensional modeling and reporting.

⭐ Dimensional Modeling

A star schema was implemented to optimize analytical querying and BI performance.

Tables

fact_sales — transactional sales data

dim_customer — customer-level attributes

dim_product — product-level attributes

dim_date — standardized calendar dimension

Surrogate keys were used to link fact and dimension tables, resulting in a clean and scalable analytical model.

📈 Visualization (Power BI Dashboards)

Interactive dashboards were built on top of the star schema to surface actionable business insights.

Dashboard Pages

1. Sales Overview

Total Revenue

Average Order Value

Total Orders

Monthly Revenue Trend

2. Product Analysis

Top 10 products by revenue

Total quantity sold per product

Revenue Share %

3. Customer Analysis

Revenue by country

Top customers by revenue

Customer-level KPIs

Implementation Details

Data source: SQL Server (RetailAnalytics)

Model: Star schema (fact_sales centered)

Measures implemented using DAX

Dedicated \_Measures table for semantic clarity

Heavy transformations handled in SQL; Power BI focused on analytics and visualization

🧠 Business Objectives

Monitor overall sales performance

Identify revenue-driving products

Understand customer purchasing behavior

Support strategic decision-making using KPIs

Deliver executive-ready dashboards

🛠️ Tools & Technologies

SQL Server — data modeling and transformations

Python (pandas) — data cleaning and EDA

Power BI — interactive dashboards and KPIs

Excel — validation and exploratory analysis

GitHub — version control and documentation

📁 Project Structure
```
Retail-Sales-Customer-Analytics/
│
├── data/
│ └── cleaned_data.csv
│
├── sql/
│ ├── create_tables.sql
│ └── transformation_queries.sql
│
├── python/
│ └── eda_analysis.ipynb
│
├── powerbi/
│ └── sales_dashboard.pbix
│
├── screenshots/
│ └── dashboard_pages.png
│
├── presentation/
│ └── executive_summary.pdf
│
└── README.md
```

🔐 Data Privacy Note

The dataset contains anonymized customer identifiers only.
No personally identifiable information (PII) is included in this project.

✅ Conclusion

This project demonstrates a complete analytics pipeline—from raw data ingestion to executive-level insights—reflecting real-world responsibilities of Data Analysts and BI Analysts.

It highlights strong skills in SQL-based data modeling, data validation, KPI design, and dashboard development using Power BI.
