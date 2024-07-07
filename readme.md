# Toman Bike Share Project

## Project Overview

The **Toman Bike Share Project** involves the analysis of bike share data for the years 2021 and 2022. This project utilizes SQL for data extraction and transformation, and Power BI for data visualization. The data is stored in three CSV files and is analyzed to gain insights into usage patterns, financial performance, and other key metrics.

## Data Sources

The data used in this project is contained in the following three CSV files:
1. `bike_share_21.csv` - Contains bike share data for the year 2021.
2. `bike_share_22.csv` - Contains bike share data for the year 2022.
3. `cost_table.csv` - Contains cost information associated with bike share operations.

## Tools and Technologies

- **SQL**: Used for data extraction, transformation, and merging.
- **Power BI**: Used for creating interactive visualizations and dashboards.

## SQL Queries

The SQL queries used in this project are detailed below. These queries combine data from the two years and join it with the cost information to calculate revenue and profit.

### Query 1: Basic Data Extraction and Transformation
```sql
USE bike_share;

SELECT * FROM 
(WITH cte AS (
    SELECT * FROM bike_share_21 
    UNION 
    SELECT * FROM bike_share_22)
SELECT dteday, season, cte.yr, weekday, hr, rider_type, riders, price, COGS
FROM cte
LEFT JOIN cost_table ct
ON cte.yr = ct.yr) db;
```

### Query 2: Calculating Revenue and Profit

```sql
SELECT * FROM 
(WITH cte AS 
(SELECT * FROM bike_share_21 
UNION 
SELECT * FROM bike_share_22)
SELECT  
    dteday,
    season,
    cte.yr,
    weekday, 
    hr, 
    rider_type, 
    riders, 
    price, 
    COGS,
    riders * price AS revenue,
    riders * price - COGS AS profit
FROM cte
LEFT JOIN cost_table ct
ON cte.yr = ct.yr) db;
```
## Visualizations

The Power BI visualizations created for the Toma Bike Share Project provide comprehensive insights into various aspects of the bike share program for the years 2021 and 2022. Below are the key visualizations included in the Power BI report:

### Hourly Sales Data Across a Week

**Description:** This table displays the hourly sales data across a week, highlighting higher earnings during midday and early evening hours, particularly around 10 AM and 3 PM.

**Insights:** It suggests these hours as the most profitable times. Days like Wednesday and Friday show notably higher sales, indicating variable profitability across the week.

### KPI Over Time

**Description:** This line and bar chart shows the average profit and revenue over each month of the year 2021.

**Insights:** The chart helps to identify trends in profitability and revenue, showing peak performance months.

### Revenue by Season

**Description:** This bar chart breaks down the average revenue by season.

**Insights:** Helps to understand how different seasons affect bike share usage and revenue generation.

### Rider Demographics

**Description:** This pie chart displays the distribution of rider types, showing the percentage of casual vs. registered riders.

**Insights:** Provides insight into the composition of the bike share user base, with a significant majority being registered users (80.11%) compared to casual users (19.89%).

## How to Run the Project

1. **Data Preparation:** Ensure all three CSV files (`bike_share_21.csv`, `bike_share_22.csv`, `cost_table.csv`) are available in your working directory.
2. **SQL Execution:** Use a SQL environment to execute the provided queries. This can be done using any SQL client that supports the execution of SQL scripts.
3. **Load Data into Power BI:** Import the resultant data into Power BI for visualization.
4. **Create Visualizations:** Use the Power BI dashboard to create the visualizations as described above.

## Conclusion

This project provides a comprehensive analysis of the Toma Bike Share data for 2021 and 2022. By utilizing SQL for data manipulation and Power BI for visualization, we can derive meaningful insights into bike share usage patterns, financial performance, and operational costs. These insights can help in making data-driven decisions to improve the bike share service.
