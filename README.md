# Tableau and SQL Data Analysis

# Sales and Profit Analysis Dashboard
### Table of Contents

- [Project Description](#project-description)
- [Data Source](#data-source)
- [Data Cleaning](#data-cleaning)
- [Tools](#tools)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Data Analysis](#data-analysis)
- [Results/Findings](#resultsfindings)
  

### Project Description
The project aims to create a comprehensive dashboard to analyze sales and profit. In this project, we have created 2 different dashboards that give an in-depth analysis of the sales and profit across the year, products, and location. We have also done exploratory analysis in MySQL to find answers for some key features.

![Bank Loan Overview Dashboard image](Sales%20Dashboard.png)

### Data Source
- Sales Data: The data is available in the "Sales_Insight.xlsx" file which contains all the information about the sales that happened across the year.

### Tools
- MySQL: To perform exploratory analysis and find answers for some key metrics.
- Tableau Public: For data cleaning and visualization.

### Data Cleaning
- In the Tableau Public, we have inserted the csv data. I have checked each column for missing values and formatting issues. I have also checked whether the datatypes assigned to each column are correct. We have also filtered out such rows where the sales value is mentioned as '0'.

### Exploratory Data Analysis
Performed some exploratory data analysis to find some information about key questions like
- Total money spent by each customer.
- Total sales done by each market.
- Total sales done by customer types.
- Total sales done by each product.
- Total sales by year and month.
- Which are the top 5 products and customers by revenue?
- Which region is generating how much profit and profit %?
- How is the sale happening every month of the year?

### Data Analysis
To find the answer to the key questions, I have written some query in the MySQL as
```MySQL
-- Total sales done by each product.
select product_code, sum(sales_amount) as Total_Sales from transactions
group by product_code
order by Total_Sales desc;
```
```MySQL
-- Total sales by year and month
with sale as(select year(order_date) as year, monthname(order_date) as month, month(order_date) as month_value, sum(sales_amount) as Total_sales from transactions
group by year(order_date), monthname(order_date), month(order_date))
select year, month, Total_sales from  sale
order by year, month_value;
```

### Results/Findings
[Dashboard View](https://public.tableau.com/app/profile/manjeet.kumar8420/viz/SalesInsight_17379659824760/SalesInsights)

- Product Prod040 is the maximum sold product.
- Electricalsara Stores is the maximum revenue-generating customer.
- Delhi NCR generates the most revenue whereas Bangalore is the least to generate revenue.
- Bangalore is the loss-making region for the company.
- The sales declined from April to June.
