--Task1:Combine the menu_items and order_details tables into a single table
select * from dbo.menu_items m full join  dbo.order_details o on o.item_id=m.menu_item_id 

--Task2:What were the least and most ordered items? What categories were they in?
select top 1
	 m.category,m.item_name,count(o.order_id) OrderCount
from dbo.menu_items m full join dbo.order_details o on o.item_id=m.menu_item_id 
group by m.item_name,m.category
order by OrderCount DESC

select top 1
	 m.category,m.item_name,count(o.order_id) OrderCount
from dbo.menu_items m full join dbo.order_details o on o.item_id=m.menu_item_id 
group by m.item_name,m.category
order by OrderCount ASC

--Task3:What were the top 5 orders that spent the most money?
select top 5
	 o.order_id,sum(m.price) total
from dbo.menu_items m full join dbo.order_details o on o.item_id=m.menu_item_id 
group by o.order_id
order by total DESC

--Task4:View the details of the highest spend order. Which specific items were purchased?
select top 1
o.order_id ,sum(m.price)total
from dbo.menu_items m full join dbo.order_details o on o.item_id=m.menu_item_id 
group by (order_id) 
order by total desc;

--To get the items purchased
with GetTotal as (select o.order_id,o.order_date,o.order_time,o.order_details_id,o.item_id,m.price,
 sum(m.price) OVER (PARTITION BY o.order_id)TotalSpent
from dbo.menu_items m inner join dbo.order_details o on o.item_id=m.menu_item_id )
	,
RankedOrders as (select *,rank() over (ORDER BY TotalSpent DESC)Ranking
        from GetTotal)
select order_id,order_date,order_time,order_details_id,item_id,price,TotalSpent,
FROM RankedOrders
where Ranking=1
--Bonus
with GetTotal as (select  o.order_id,o.order_date,o.order_time,o.order_details_id,o.item_id,m.price,
sum(m.price) OVER (PARTITION BY o.order_id)TotalSpent
from dbo.menu_items m inner join dbo.order_details o on o.item_id=m.menu_item_id 
)
select top 5 * from GetTotal 
