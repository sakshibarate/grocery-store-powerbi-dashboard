# Grocery Store Interactive Power BI Dashboard — Starter Project

## What is included
- `Grocery_Store_Sales_Data.xlsx`: Excel workbook with 1,400 synthetic transaction rows and a product reference sheet.
- `Grocery_Store_Sales_Data.csv`: flat file for Power BI or SQL import.
- `DAX_Measures.txt`: suggested measures and Calendar table DAX.
- `SQL_Setup_and_Queries.sql`: SQL Server starter schema and sample analysis queries.

**Important:** This is synthetic sample data for learning and portfolio demonstration, not real store records. The starter pack does not contain a `.pbix` file; create and save the report in Power BI Desktop using the steps below.

## 1. Install Power BI Desktop
1. On Windows, install Power BI Desktop from the Microsoft Store or Microsoft's official Power BI Desktop download page.
2. Open Power BI Desktop and choose **Blank report**.

## 2. Import the data
1. Select **Home → Get data → Excel workbook**.
2. Choose `Grocery_Store_Sales_Data.xlsx`.
3. In Navigator, select **SalesData** and click **Load**. (You may also load `ProductReference` if you want to practice relationships.)
4. In Data view, check `OrderDate` is Date, `SalesAmount`, `Profit`, `CostAmount`, `UnitPrice` are Decimal number, `Quantity` is Whole number, and `DiscountPct` is Decimal number / Percentage.

## 3. Create the date table
1. Select **Modeling → New table**.
2. Copy the `Calendar = ...` expression from `DAX_Measures.txt`.
3. Select `Calendar[Date]`, then **Table tools → Mark as date table** and choose `Date`.
4. In Model view, create a relationship from `Calendar[Date]` to `SalesData[OrderDate]` (one-to-many, single direction).
5. Sort `Calendar[Month]` by `Calendar[Month Number]` using **Column tools → Sort by column**.

## 4. Create measures
1. Select the `SalesData` table in the Data pane.
2. Choose **Modeling → New measure**.
3. Copy each measure from `DAX_Measures.txt` one at a time. Do not paste the Calendar table expression as a measure; it is a New table.
4. Format `Total Sales`, `Total Profit`, and `Average Order Value` as Currency (₹ if desired); format `Profit Margin %`, `Average Discount %`, and `Sales MoM Change %` as Percentage.

## 5. Build the report page
Create a page named **Overview** and add:
- **Card visuals**: `Total Sales`, `Total Profit`, `Total Orders`, `Profit Margin %`.
- **Line chart**: `Calendar[Year-Month]` on X-axis; `Total Sales` on Y-axis.
- **Clustered bar chart**: `Category` on Y-axis; `Total Sales` on X-axis.
- **Bar chart**: `Product` on Y-axis; `Total Profit` on X-axis. Sort descending and optionally use Top N = 10.
- **Donut chart**: `PaymentMethod` as Legend; `Total Sales` as Values.
- **Column chart**: `Store` on X-axis; `Total Sales` on Y-axis.
- **Slicers**: `Calendar[Year]`, `Store`, `Category`, `Channel`, `CustomerType`.
- Use **Format → Edit interactions** to confirm slicers filter all relevant visuals.
- Turn on data labels where useful; add clear visual titles and align visuals.

## 6. Suggested layout
Top row: report title + 4 KPI cards.
Middle row: monthly sales trend + category sales.
Bottom row: top products by profit + sales by store + payment mix.
Place slicers in a left panel or across the top. Keep the page uncluttered.

## 7. Make it interactive
- Select a category bar to cross-filter other charts.
- Use slicers for year, store, channel, customer type, and category.
- Add a drill-through page named **Product Details** with Product as the drill-through field, then add sales, profit, units sold, and a table by month.
- Add tooltips to charts (for example, include `Total Profit` and `Profit Margin %`).
- Optional: add a second page named **Store Performance** with sales/profit by store and category.

## 8. Save and share
1. Choose **File → Save as** and save as `Grocery_Store_Dashboard.pbix`.
2. To share interactively, publish using **Home → Publish** and sign in to Power BI. Publishing and sharing may require a work/school account and suitable Power BI licensing/permissions.
3. If you only need a portfolio screenshot, use **File → Export → Export to PDF** or take screenshots after filtering.

## 9. Optional SQL workflow
Use `SQL_Setup_and_Queries.sql` in SQL Server Management Studio (SSMS). Run the database/table creation statements first, then import the CSV into `dbo.SalesData` using **Tasks → Import Data** or the Import Flat File wizard. If you are new to SQL, Power BI can connect directly to the Excel workbook and you can skip SQL initially.

## Troubleshooting
- If the date trend looks out of order, sort `Year-Month` by a numeric year-month key or use the Calendar date hierarchy.
- If totals show blank, check the Calendar relationship and column data types.
- If a DAX expression errors due to regional settings, try semicolons instead of commas.
- If Power BI Desktop is not installed, install it first; this project pack does not run as a standalone dashboard outside Power BI.
