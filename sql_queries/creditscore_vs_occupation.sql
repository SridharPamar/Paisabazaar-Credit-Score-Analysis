create view creditscore_vs_occupation as
select occupation,sum(good_credit_score) as good_credit_score,sum(standard_credit_score) as standard_credit_score ,sum(poor_credit_score) as poor_credit_score
from (
select *, 
case when credit_score = 'Good' then 1 end as good_credit_score,
case when credit_score = 'Standard' then 1 end as standard_credit_score,
case when credit_score = 'Poor' then 1 end as poor_credit_score
from customer_summary)
group by occupation
order by good_credit_score desc, standard_credit_score



