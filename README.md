# Quandoo test assignment for the Junior Data Analyst position

## Question 1:
> Write an SQL query (or queries) to identify the most important cities for our company.

I have created two tables in the PostgreSQL 16 database (see scripts [1_create_merchants_table.sql](https://github.com/akseshina/quandoo_test_assignment/blob/main/1_create_merchants_table.sql) and [2_create_reservations_table.sql](https://github.com/akseshina/quandoo_test_assignment/blob/main/2_create_reservations_table.sql)) and then loaded data into them from files.

My final SQL script for ranking cities is in the file [3_cities_statistics.sql](https://github.com/akseshina/quandoo_test_assignment/blob/main/3_cities_statistics.sql). The resulting table from this script is in the file [cities_statistics.csv](https://github.com/akseshina/quandoo_test_assignment/blob/main/cities_statistics.csv).

One of the key metrics in product analytics is revenue. It is not always the primary metric, as businesses may focus on different goals at different stages of their development (for example, aiming for rapid growth to establish a market presence, reducing expenses during a crisis, or working on user retention). However, revenue is always considered as one of the main metrics.

The files provided contain data for 10 months, and besides revenue and the mere fact of reservation creation, we almost don't have any other quantitative data. Therefore, I decided to focus simply on the metric **"how much total revenue the company earned in each city for the given period"**. In the final result, the cities are ordered by this total revenue.

However, it is important not to look at just one metric. When comparing the top cities in the list, we are also interested in how many reservations were made in each city and how much revenue, on average, each reservation brings to that city. Such data will complement the picture and provide more information for making business decisions. Additionally, I added columns with rankings by different metrics so one could quickly understand from the table who is the leader not just in total revenue, but also, for example, in the number of reservations, the number of unique customers, or the number of active merchants.

Below is a list with a brief description of all the fields of the final table:
1. **city**: The name of the city where the reservations were made.
1. **country**: The country in which the city is located.
1. **revenue_total**: The total revenue generated from reservations in each city.
1. **revenue_percentage**: The percentage contribution of each city's revenue to the total revenue.
1. **revenue_rank**: The ranking of cities based on total revenue, with a higher rank indicating higher revenue.
1. **revenue_rank_in_country**: The ranking of cities within their respective countries, based on total revenue.
1. **revenue_avg**: The average revenue per reservation in a city.
1. **revenue_median**: The median revenue value per reservation in a city.
1. **reservations**: The total number of reservations made in a city.
1. **reservations_percentage**: The percentage of total reservations that a city represents, relative to the overall number.
1. **active_days**: The number of distinct days on which reservations were made in a city.
1. **reservations_per_day_avg**: The average number of reservations made per active day in a city.
1. **customers**: The total number of distinct customers who made reservations in a city.
1. **customers_rank**: The ranking of cities based on the number of distinct customers, with a higher rank indicating more customers.
1. **customers_rank_in_country**: The ranking of cities within their respective countries, based on the number of distinct customers.
1. **merchants**: The total number of active merchants involved in the reservations in a city.
1. **merchants_rank**: The ranking of cities based on the number of active merchants, with a higher rank indicating more merchants.
1. **merchants_rank_in_country**: The ranking of cities within their respective countries, based on the number of active merchants.

## Question 2:
> Please summarize the most important observations based on the csv files.
> What in your opinion are important metrics for our business?

My dashboard is located [here on Tableau Public](https://public.tableau.com/app/profile/margarita.akseshina/viz/Quandootestassignment/Dashboard).

Like in the first task, I decided to focus on revenue as one of the most important metrics for business. Additionally, I suggest monitoring the number of reservations, as this is Quandoo's main service, so it makes sense to track its progress. Besides total revenue, I recommend tracking the median revenue of a single reservation (often referred to as "average," but I suggest the median as a better alternative to the mean due to its resistance to outliers). Firstly, it would be ideal if the median revenue does not decrease over time, and even better if it increases. Secondly, it's a useful metric for comparing different sources of reservations.

On the dashboard, I have presented these three metrics both grouped for the entire dataset and broken down by countries and marketing channels. On the left panel of the dashboard are filters, so if you want, for example, to view metrics broken down by marketing channels within a single country, it could be done easily.

In the top right corner, I have displayed overall statistics for the main entities of the service – revenue, reservations, customers, merchants.

I have also added two maps to the dashboard, by countries and by cities, to better represent the service's geography.

At the bottom is a section with charts that do not directly affect the company's performance but are useful for understanding the nature of this data.
