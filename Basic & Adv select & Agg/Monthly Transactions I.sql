select 
to_char(trans_date, 'YYYY-MM')as month 
, coalesce(country, null) as country
, count(*) trans_count
, count(case when state = 'approved' then 1 end) as approved_count
, sum(amount) trans_total_amount
, sum(case when state = 'approved' or country is null then amount Else 0 end) as approved_total_amount
from Transactions
group by 1, 2 
order by 1, 2
