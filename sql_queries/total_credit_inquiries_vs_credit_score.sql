create view total_credit_inquiries_vs_credit_score as 
select credit_score,sum(num_credit_inquiries) as total_credit_inquiries
from customer_summary 
group by credit_score
order by total_credit_inquiries desc

