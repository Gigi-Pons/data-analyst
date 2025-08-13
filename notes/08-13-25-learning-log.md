# Learning Log – SQL 01-standardizing-data

## Overview
Today I worked on filling missing or blank values in the `industry` column of the `layoffs_staging2` table.  
The main goal was to **use existing data in the table** to fill in missing values for the same company, ensuring a more complete dataset.

---

## Key Takeaways

### 1. Identifying Missing or Blank Data
- Used `WHERE industry IS NULL OR industry = ''` to find all rows with missing or blank industry values.
- Learned that `NULL` and `''` (empty string) are **not the same** in SQL, and both need to be handled.
- Verified that certain companies (e.g., Airbnb) already had at least one row with a populated industry, meaning we could use those to fill in the blanks.


### 2. Using Self-Joins to Populate Missing Data

Learned that a **self-join** can match rows from the same table based on a shared key (`company` in this case).

The join pairs:

- **t1**: Rows where `industry` is `NULL`
- **t2**: Rows where the same company has a populated `industry`.

This allows us to copy the `industry` value from **t2** into **t1**.

- This method only works when the same company has at least one populated industry value.

- Companies with only one row in the dataset and a missing industry (e.g., Bally's) remain NULL after this process because there’s no reference row to pull from.

