create view agegroup_vs_creditscore_count as
with cte as (select age_group , credit_score,count(*) as cn
	from(
SELECT *,
    CASE
        WHEN floor(Age) BETWEEN 14 AND 24 THEN 'Young(14-24)'
        WHEN floor(Age) BETWEEN 25 AND 34 THEN 'Young Adult(25-34)'
        WHEN floor(Age) BETWEEN 35 AND 44 THEN 'Adult(35-44)'
        WHEN floor(Age) BETWEEN 45 AND 56 THEN 'Senior Adult(45-56)'
        ELSE 'Unknown'
    END AS Age_Group
FROM customer_summary)
group by  age_group , credit_score
order by age_group)
select age_group,
sum(case when credit_score = 'Good' then cn end)as good_credit_score_count,
sum(case when credit_score = 'Standard' then cn end) as standard_credit_score_count,
sum(case when credit_score = 'Poor' then cn end) as poor_credit_score_count

from cte 
group by age_group
order by good_credit_score_count

