# Cafe Sales Analysis

A self-practice data analytics project: cleaning and analyzing a ~200-row generated cafe sales dataset across **SQL, Python, Power BI, and Excel**.

##  Files in this repo

| File | Description |
|---|---|
| `cafe_sales_dataset.xlsx` | Raw/working dataset — cafe transactions (Order ID, Date, Customer, Item, Category, Quantity, Unit Price, Total Price, Payment Method, City, Rating) |
| `cafe_project.sql` | SQL scripts for data cleaning and aggregate analysis |
| `cafe.ipynb` | Python (pandas) notebook — cleaning, EDA, and aggregation |
| `cafe_analysis.pbix` | Power BI report with dashboard visuals |

##  Data Cleaning

Performed consistently across SQL, Python, and Excel:

- Checked for and counted null values in every column
- Dropped rows with missing `CustomerName`; filled missing `Quantity` (default 1), `Rating` (median), `PaymentMethod` (`"Unknown"`), `City` (mode)
- Filled missing `UnitPrice` using the average price per `Item`
- Recalculated missing `TotalPrice` as `Quantity * UnitPrice` where possible
- Standardized `Category` casing (title case) and trimmed whitespace from `Item`
- Identified and removed exact duplicate rows

##  Exploratory Data Analysis (Python)

Added on top of cleaning, in `cafe.ipynb`:

- `df.info()` / `df.describe()` — data types and summary statistics
- Value counts for `Category`, `PaymentMethod`, `City`
- Distribution histograms for `Quantity`, `UnitPrice`, `TotalPrice`, `Rating`
- Outlier check on `TotalPrice` using IQR method + boxplot
- Revenue-by-category bar chart and orders-over-time line chart

##  Aggregate Analysis (SQL & Python)

- Revenue by Category
- Revenue by City
- Revenue by Payment Method
- Revenue by Item
- Revenue by Month
- Top 5 Customers by total spend
- Average Rating by Item

##  Dashboard (Power BI / Excel)

Key metrics surfaced on the dashboard:

- **Total Revenue:** 55,862
- **Total Orders:** 205
- **Average Order Value:** 272.50
- **Total Items Sold:** 362

Includes interactive slicers for filtering by category, city, and payment method.

##  Tools Used

- SQL (data cleaning, aggregation)
- Python / pandas (cleaning, EDA, visualization)
- Microsoft Excel (PivotTables, slicers)
- Power BI (dashboard visuals, DAX measures)


