--Window function
rank() -- assigns ranking to rows from 1 and when there is a tie it jumps to the naturally occuring next no
dense_rank() -- doesnt jump e.g 1,2,2,3
row_number() -- each row gets a uniques no

-- use partition by to assign this bs within groups

rank() over(partition by col_name) as ranked_col



cte
with order_counts as (

select count(order_id) as total_orders from orders

)



-- select 
--     order_id
--     case 
--     when order_id%2 !=0 and order_id != total_orders then order order_id+1
--     when order_id%2 !=0 and order_id = total_orders then order order_id
--     else order_id-1
--     end as corrected_order_id, item
--     from orders cross join order_counts 
    

SELECT
  order_id,
  CASE
    WHEN order_id % 2 != 0 AND order_id != total_orders THEN order_id + 1 -- Line 1
    WHEN order_id % 2 != 0 AND order_id = total_orders THEN order_id -- Line 2
    ELSE order_id - 1 -- Line 3
  END AS corrected_order_id,
  item
FROM orders
CROSS JOIN order_counts



-- window functions 

select card_name, issued_amount
from( SELECT *,  

rank() over(partition by card_name order by issue_year, issue_month) as ranking


FROM monthly_cards_issued)t
where ranking = 1
order by issued_amount desc