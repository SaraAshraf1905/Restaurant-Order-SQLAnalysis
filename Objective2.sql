--Task1
select * from dbo.order_details
select * from dbo.order_details order by order_date
--Task2
select count(order_id)OrdersCount from dbo.order_details 
select count(item_id)ItemsCount from dbo.order_details 
--Task3
select top 5 order_id,count(item_id)ItemCount from dbo.order_details group by order_id 
--Task4
select order_id,count(item_id)ItemsCount from dbo.order_details group by order_id having count(item_id) >12

