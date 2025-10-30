# Silverscreen Project

A small Masterschool dbt project to get familiar with dbt and build a basic data pipeline.  
The goal is to analyze and evaluate movie performance across different cinema locations in New Jersey (NJ_001, NJ_002, NJ_003).  
This project demonstrates fundamental concepts like data modeling, testing, and automation in dbt.

---

## Project Overview
This project is designed as a learning exercise to explore dbt workflows.  
It focuses on:
- Tracking monthly rental costs for movies
- Aggregating ticket sales and revenue across multiple cinema locations
- Calculating profitability per movie and location
- Ensuring data quality with automated tests

---

## Project Structure
```
silverscreen_project/
│
├── analyses/ # Ad-hoc queries and analysis
├── macros/ # Custom dbt macros (e.g. tests)
├── models/ # Core models
│ ├── staging/ # Source cleaning & standardization
│ ├── intermediate/ # Aggregations & business logic
│ └── mart/ # Final business-ready tables
├── seeds/ # Static reference data
├── snapshots/ # Historical snapshots
├── sources/ # Source definitions
├── tests/ # Custom data tests
├── dbt_project.yml # Project configuration
└── README.md # Project documentation
```

---

## Key Models
- **stg_invoices** → Standardizes raw invoice data (weekly & total rental cost)  
- **stg_location_sales** → Combines ticket sales data from NJ_001, NJ_002, NJ_003  
- **int_monthly_sales_by_location** → Aggregates sales & revenue per month, movie, location  
- **int_invoices** → Aggregates rental costs per movie & month  
- **mart_monthly_movie_performance** → Final fact table with:
  - Movie info (title, genre, studio)  
  - Location ID  
  - Total rental cost  
  - Tickets sold  
  - Total revenue  
  - Profit (Revenue – Rental Cost)  

---

## Testing and Automation
The project includes:
- Generic dbt tests: `not_null`, `unique`, `accepted_values`  
- Custom tests: e.g. `revenue_non_negative`  
- Source freshness checks to ensure data is up to date  

Every `dbt build` run validates that:
- All models build successfully
- All tests pass without errors

---

## Lineage
The lineage follows the standard dbt structure:

sources → staging → intermediate → mart

---

## How to Run
## How to Run

1. Clone this repository
   git clone https://github.com/Sadiyaman1/silverscreen_project.git
   cd silverscreen_project 

2. Install dependencies  
   dbt deps  

3. Run models  
   dbt build  

4. View documentation  
   dbt docs generate && dbt docs serve  

---

## License
This project is licensed under the MIT License.
