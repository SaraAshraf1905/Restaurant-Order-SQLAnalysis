--Task1:View the menu_items table and write a query to find the number of items on the menu
select * from dbo.menu_items
select count(item_name) as ItemsCount
from dbo.menu_items 
 
--Task2:What are the least and most expensive items on the menu?
select top 1 item_name,price
from dbo.menu_items 
order by price DESC
select top 1 item_name,price
from dbo.menu_items 
order by price ASC

--Task3:How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?
select count(item_name)as ItalianItems from dbo.menu_items where category='Italian'
select top 1 item_name,price
from dbo.menu_items where category='Italian'
order by price DESC
select top 1 item_name,price
from dbo.menu_items where category='Italian'
order by price ASC
 
 --Task4:How many dishes are in each category? What is the average dish price within each category?
 select category,count(item_name) ItemsPerCategory from dbo.menu_items group by category
  select category,avg(price) ItemsPerCategory from dbo.menu_items group by category
