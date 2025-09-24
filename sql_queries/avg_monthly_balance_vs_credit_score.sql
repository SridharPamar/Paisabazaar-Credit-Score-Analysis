create view avg_monthly_balance_vs_credit_score as 
select credit_score , round(PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY monthly_balance)::Numeric,2) AS avg_monthly_balance
from customer_summary
group by credit_score
order by avg_monthly_balance desc