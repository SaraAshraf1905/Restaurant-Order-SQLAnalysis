--Task1:How many orders were made within this date range? How many items were ordered within this date range?
select * from dbo.order_details
select * from dbo.order_details order by order_date
--Task2:How many orders were made within this date range? How many items were ordered within this date range?
select count(order_id)OrdersCount from dbo.order_details 
select count(item_id)ItemsCount from dbo.order_details 
--Task3:Which orders had the most number of items?
select top 5 order_id,count(item_id)ItemCount from dbo.order_details group by order_id 
--Task4:How many orders had more than 12 items?
select order_id,count(item_id)ItemsCount from dbo.order_details group by order_id having count(item_id) >12

