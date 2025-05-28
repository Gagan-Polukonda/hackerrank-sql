select product.product_name, year, SUM(price) price
from Sales
    left join Product using(product_id)
group by 1, 2, sale_id
order by 1 desc, 2 desc
