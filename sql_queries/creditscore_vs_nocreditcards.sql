create view creditscore_vs_nocreditcards as
select credit_score , round(avg(num_credit_card)::Numeric,0) as num_credit_card
from customer_summary 
group by credit_score
order by num_credit_card asc