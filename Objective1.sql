--Task1
select * from dbo.menu_items
select count(item_name) as ItemsCount
from dbo.menu_items 
--Task2
select top 1 item_name,price
from dbo.menu_items 
order by price DESC
select top 1 item_name,price
from dbo.menu_items 
order by price ASC

--Task3
select count(item_name)as ItalianItems from dbo.menu_items where category='Italian'
select top 1 item_name,price
from dbo.menu_items where category='Italian'
order by price DESC
select top 1 item_name,price
from dbo.menu_items where category='Italian'
order by price ASC
 
 --Task4
 select category,count(item_name) ItemsPerCategory from dbo.menu_items group by category
  select category,avg(price) ItemsPerCategory from dbo.menu_items group by category