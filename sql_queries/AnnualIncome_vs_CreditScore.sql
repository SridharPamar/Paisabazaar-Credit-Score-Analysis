create view annual_income_vs_credit_score as
SELECT credit_score,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY annual_income) AS avg_annual_income
FROM customer_summary
GROUP BY credit_score
ORDER BY  avg_annual_income DESC;

