create view creditscore_vs_delay_payment as
select credit_score, floor(avg(num_of_delayed_payment)) as avg_delay_payment
from customer_summary
group by credit_score
order by avg_delay_payment desc