--Task1
select * from dbo.menu_items m full join  dbo.order_details o on o.item_id=m.menu_item_id 

--Task2
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

--Task3
select top 5
	 o.order_id,sum(m.price) total
from dbo.menu_items m full join dbo.order_details o on o.item_id=m.menu_item_id 
group by o.order_id
order by total DESC

--Task4
select top 1
o.order_id ,sum(m.price)total
from dbo.menu_items m full join dbo.order_details o on o.item_id=m.menu_item_id 
group by (order_id) 
order by total desc;

--To get the items purchased
with GetTotal as (
    select 
        o.order_id,
        o.order_date,
        o.order_time,
        o.order_details_id,
        o.item_id,
        m.price,
        sum(m.price) OVER (PARTITION BY o.order_id)TotalSpent
        from dbo.menu_items m inner join dbo.order_details o on o.item_id=m.menu_item_id 
),
RankedOrders as (select 
        *
        ,rank() over (ORDER BY TotalSpent DESC)Ranking
        from GetTotal
)

select 
    order_id,
    order_date,
    order_time,
    order_details_id,
    item_id,
    price,
    TotalSpent,
    Ranking
FROM RankedOrders
where Ranking=1

--Bonus
with GetTotal as (
    select 
        o.order_id,
        o.order_date,
        o.order_time,
        o.order_details_id,
        o.item_id,
        m.price,
        sum(m.price) OVER (PARTITION BY o.order_id)TotalSpent
        from dbo.menu_items m inner join dbo.order_details o on o.item_id=m.menu_item_id 
)
select top 5 * from GetTotal 
