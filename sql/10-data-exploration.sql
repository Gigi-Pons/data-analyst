-- Exploratory Data Analysis
SELECT *
FROM layoffs_staging2;

-- 1. The total amount of people that got laid off in one day
SELECT MAX(total_laid_off)
FROM layoffs_staging2;


-- 2. The column percentage_laid_off represents the percentage of employees 
-- that were laid off, a number 1 means 100%. 
-- In the results it shows that 116 companies let go of 100% of its employees
-- and the highest number of employees in one of those companies that went under was 2434
SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;


-- 3. Showing the total sum of layoffs that a company has made in the time frame
-- of the years provided in this dataset.  The highest being Amazon, laying off 18150 employees. 
SELECT company, SUM(total_laid_off) AS total_employees
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;


-- 4. Checking the time frame that this dataset is providing
SELECT MAX(`date`), MIN(`date`)
FROM layoffs_staging2;


-- 5. Looking at what industries got affected the most with the highest number of layoffs. 
-- This happened during the corona virus pandemic and the consumer and retail industry 
-- seemed to be more affected 
SELECT industry, MAX(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;


-- 6. Checking what country was affected the most by these layoffs. 
SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;


-- 7. Looking at the sum of layoffs per year in the 4 years that have been provided. 
-- The year 2022 seems to be the worst one but givent hat for 2023, only 3 months have been provided,
-- it might mean that 2023 will surpass 2022
SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;


-- 8. This query checks which stage was most affected by the largest number of layoffs within those 4 years
SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;


-- 9. Exploring how many people got laid off per month starting from the earliest year up to the latest. 
-- We'll use this as a subquery in a CTE for better organization and come up with a rolling total
SELECT SUBSTRING(`date`, 1, 7) AS month, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY month
ORDER BY 1 ASC;


-- 10. This CTE looks at the total layoffs per month for the 4 years provided and also
-- provides a running total from the very first month until the very last
WITH Rolling_Total AS 
(
SELECT SUBSTRING(`date`, 1, 7) AS month, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY month
ORDER BY 1 ASC
)
SELECT month, total_off,
SUM(total_off) OVER(ORDER BY month) AS rolling_total
FROM Rolling_Total;