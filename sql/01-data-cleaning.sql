-- 1. ***************************************************************************
--  Create a staging table to store original data and work on it.  Important in case
-- you make a mistake, the original data isn't affected
CREATE TABLE layoffs_staging
LIKE layoffs;

SELECT *
FROM layoffs_staging;

-- Inserting into the table after creation
INSERT layoffs_staging
SELECT *
FROM layoffs;

-- 2. ******************************************************************************
-- This database doesn't have a unique row number which makes it harder to find the 
-- duplicate rows.  One way to find duplicates is by using ROW_NUMBER and partioning
-- by every column to find out if there are more than one duplicate row.
-- Using a CTE to make it more readable and organized
WITH duplicate_cte AS 
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, 
stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT * 
FROM duplicate_cte
WHERE row_num > 1;


-- 3. Creating a second staging table because using a CTE, we can't directly delete rows.
-- This can't be possible because you can't update CTEs and a delete statement is an update.
-- We are adding one more column which includes the row number
CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Checking if table was created
SELECT * 
FROM layoffs_staging2;

-- Populating table with the subquery inside the CTE which includes everything plus that row number
-- that identifies the duplicate rows
INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, 
stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

-- Now we can filter which rows exists more than one so we can delete them after
SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

-- Delete the duplicate rows from the second staging table
DELETE
FROM layoffs_staging2
WHERE row_num > 1;

























