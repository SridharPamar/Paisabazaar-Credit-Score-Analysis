create view loantypes_total_count as
select trim(loan_type) as loan_type ,total_loans
	from (
select loan_type, count(*) as total_loans
from (
  select trim(leading 'and' from trim(unnest(string_to_array(type_of_loan, ',')))) as loan_type
  from customer_summary
) as sub
group by loan_type
order by total_loans desc)

