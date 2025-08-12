-- 01 Standardizing data
-- 1. *************************************************************************
-- TRIM is used for taking the white space off the end or off the right hand side
SELECT DISTINCT(company)
FROM layoffs_staging2;

-- We are setting the company column to remove that white space at the beginning
UPDATE layoffs_staging2
SET company = TRIM(company);



-- 2. **************************************************************************
-- Checking the industry column and making sure there are no random duplicates or
-- columns that have been misspelled 
SELECT DISTINCT(industry)
FROM layoffs_staging2
ORDER BY 1;

-- There are some columns that should be Crypto under industry but show as CryptoCurrency
-- or other name
SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

-- Updating the industry column to set any other Cyrpto like field to just 'Crypto'
UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

-- Check industry fields to make sure Crypto was correctly updated
SELECT DISTINCT(industry)
FROM layoffs_staging2
ORDER BY 1;

-- 3. **********************************************************************************
-- Checking the location column to make sure everything looks normal
SELECT DISTINCT(location)
FROM layoffs_staging2
ORDER BY 1;

-- Checking the country column to make sure the fields look correct
-- and United States looks bad because one ends with a period
SELECT DISTINCT(country)
FROM layoffs_staging2
ORDER BY 1;

-- Lets take that period off the row(s) that containg 'United States.' by using TRIM
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';



-- 4. *********************************************************************************
-- The date column should not be text but rather date datatype
-- Grabbing the `date` column and comparing it to how it should be formatted using the STR_TO_DATE
-- function
SELECT `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging2;

-- Seeing the result from above, we know that we need to set the date column to the correct formatting
-- which is month-day-year
UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

-- To change the datatype of the date column after we have formatted it correctly, we use the 
-- ALTER TABLE to modify that column
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

-- Double check that the table is correct with the changes alter
SELECT * 
FROM layoffs_staging2;





