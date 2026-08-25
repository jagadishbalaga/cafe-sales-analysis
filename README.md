# SQL Notes

## 🗄️ SQL — `cafe_project.sql`
Data loading, cleaning, and aggregate analysis using SQL.

### 📥 Data Loading
- Loaded the dataset into a table `cafe_sales_practice`

### 🧹 Data Cleaning
- Counted nulls per column (e.g. `UnitPrice`)
- Removed exact duplicates using `ROW_NUMBER()` + `PARTITION BY` across all columns, keeping only `rn = 1`
- Standardized `Category` to uppercase and trimmed whitespace; trimmed `Item`
- Recalculated missing `TotalPrice` as `Quantity * UnitPrice` where both existed, using an `UPDATE` statement

### 📈 Aggregate Queries
- Revenue by Category
- Revenue by City (including a version filtering out NULL `TotalPrice`/`City`)
- Revenue by Payment Method
- Revenue by Item
- Top 5 Customers by total revenue
- Average Rating by Item

---

# Python Notes

## 🐍 Python — `cafe.ipynb`
Cleaning, EDA, and aggregation using pandas.

### 🧹 Data Cleaning
- Counted nulls per column (`df.isnull().sum()`)
- Dropped rows with missing `CustomerName`
- Filled missing `Quantity` (default 1), `Rating` (median), `PaymentMethod` (`"Unknown"`), `City` (mode)
- Filled missing `UnitPrice` using the average price per `Item`
- Recalculated missing `TotalPrice` as `Quantity * UnitPrice`
- Standardized `Category` to title case; trimmed whitespace from `Item`
- Dropped exact duplicate rows (`df.drop_duplicates()`)

### 📊 Exploratory Data Analysis (EDA)
- `df.info()` / `df.describe()` — data types and summary statistics
- Value counts for `Category`, `PaymentMethod`, `City`
- Distribution histograms for `Quantity`, `UnitPrice`, `TotalPrice`, `Rating`
- Outlier check on `TotalPrice` using IQR method + boxplot
- Revenue-by-category bar chart and orders-over-time line chart

### 📈 Aggregate Analysis
- Revenue by Category (`groupby`)
- Revenue by City (`groupby`)
- Revenue by Month (`groupby` on `OrderDate.dt.month`)

---

# Excel Notes

## 📗 Excel — Dashboard
PivotTables and slicers built on the cleaned dataset for an interactive summary view.

### 🛠 Setup
- Loaded the cleaned dataset into a table and built PivotTables for the summary cards (Total Revenue, Total Orders, Avg Order Value, Total Items Sold)

### 🎚️ Interactivity
- Added slicers to filter by Category, City, and Payment Method
- Fixed slicer connectivity issue via right-click slicer → **Report Connections**, ensuring every relevant PivotTable was checked so the cards actually respond to filtering

### 📊 Output
- Dashboard view combining PivotTables + slicers + summary cards for a quick interactive view of the data

---

# Power BI Notes

## 📘 Power BI — `cafe_analysis.pbix`
Dashboard report with card visuals and slicer-based filtering.

### 🛠 Setup
- Imported the cleaned dataset and built card visuals for:
  - **Total Revenue:** 55,862
  - **Total Orders:** 205
  - **Average Order Value:** 272.4976
  - **Total Items Sold:** 362
- Added a slicer for filtering the dashboard

### 🔧 Troubleshooting
- When the slicer wasn't filtering the cards, checked (in order):
  - Slicer's field source
  - Model view relationships (solid vs dashed lines)
  - **Edit interactions** settings per visual
  - Whether cards used proper DAX measures vs. disconnected tables
  - Duplicate data sources in the model

### 📊 Output
- Interactive report page where selecting a slicer value updates all four summary cards
