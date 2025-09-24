create view credit_score_vs_utilisation as
select credit_score,round(percentile_cont(0.5) within group (order by credit_utilization_ratio)::numeric,2) as avg_credit_utilization_ratio
from customer_summary
group by credit_score
order by avg_credit_utilization_ratio desc

