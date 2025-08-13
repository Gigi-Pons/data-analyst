-- 1. **********************************************************************************
-- Looking at industries that are null or empty
SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

-- The logic here is that if the company Airbnb has the industry column populated, then
-- we can grab that industry column and populate all other industry columnns that 
-- belong to the same company
SELECT *
FROM layoffs_staging2
WHERE company = 'Airbnb';

-- Changing all the blanks in the industry column to null 
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';




-- 2. *******************************************************************************
-- With this logic i am able to join one table, where the industry is null/empty for one 
-- while it is populated for the other table.  This helps me see what industry that 
-- company belongs to and i can populate it
SELECT *
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;


-- We are updating table t1, we are joining on t2 (same table).  We are setting the blank 
-- industry (t1) to the populated industry (t2), therefore this line: AND t2.industry IS NOT NULL
UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

-- Now we select the everything where industry is null.  The only row that comes back is for Bally's but
-- this is because there is only one row for that, there wasn't any other one with a populated industry
-- field that could've helped us populate this one
SELECT *
FROM layoffs_staging2
WHERE industry IS NULL;
