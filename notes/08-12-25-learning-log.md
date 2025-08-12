# Learning Log – SQL 01-data-cleaning

## Overview
Today I worked on creating staging tables, identifying duplicate rows, and removing them safely using **ROW_NUMBER** and **CTEs**.  
This exercise focused on best practices for cleaning and transforming data without risking the integrity of the original dataset.

---

## Key Takeaways

### 1. **Creating a Staging Table**
- A **staging table** is a copy of the original table used for transformation or cleaning tasks.
- Purpose:  
  - Prevents accidental changes to the source data.
  - Allows experimentation and testing before committing changes.
- Learned that you can clone a table structure using:
  ```sql
  CREATE TABLE new_table LIKE existing_table; 
  ```

### 2. **Finding Duplicates**
- This dataset didn't have a unique ID, so finding duplicates required checking all columns.
- Used ROW_NUMBER() with PARTITION BY across all relevant columns to identify duplicates. 
- Wrapped the logic in a CTE to keep the query organized

### 3. **Second Staging Table**
- CTEs cannot be directly updated or deleted from because they are temporary result sets.
- To delete rows based on ROW_NUMBER(), I had to create a second staging table with the same structure plus a row_num column, insert the data with its row numbers, and delete any row where ```row_num > 1 ```
  
