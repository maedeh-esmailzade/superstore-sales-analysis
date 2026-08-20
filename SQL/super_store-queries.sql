select sso.[Row ID],
       sso.[Order ID],
	   ssr.Returned,
	   sso.[Order Date],
	   sso.[Ship Date],
	   sso.[Ship Mode],
	   sso.[Customer ID],
	   sso.[Customer Name],
	   sso.Segment,
	   sso.Country,
	   sso.City,
	   sso.State,
	   sso.[Postal Code],
	   sso.Region,
	   sso.[Product ID],
	   sso.Category,
	   sso.[Sub-Category],
	   sso.[Product Name],
	   sso.Sales,
	   sso.Quantity,
	   sso.Discount,
	   sso.Profit
into super_store_datasets
from superstore_Orders as sso
left join superstore_Returns as ssr
on sso.[Order ID] = ssr.[Order ID]
go
------------------
select year([Order Date]) as 'year',
       count(distinct [Order ID]) as 'cnt order',
       cast(sum(profit) as decimal(8,2)) as 'profit',
	   cast(sum(sales) as decimal(8,2)) as 'sales',
	   cast(sum(Discount) as decimal(8,2)) as 'discount'
from super_store_datasets
group by year([Order Date])
order by year([Order Date]) asc
go

select Region,
       count(distinct [Order ID])
from super_store_datasets
group by Region
go
-----------------------
-- PROFIT

select year([Order Date]) as 'year',
       cast(sum(Sales) as int) as 'sales',
	   cast(sum(Profit) as int) as 'profit',
	   count(distinct [Order ID]) as 'cnt order',
	   cast(avg(discount)*100 as decimal(10,2))  as 'discnt',
	   cast(sum(Profit)/sum(Sales) *100 as decimal(5,1)) as 'profit % year'
from super_store_datasets
group by year([Order Date])
order by year([Order Date])

select Category,
       cast(sum(Sales) as int) as 'sales',
	   cast(sum(profit) as int) as 'profit',
	   cast(avg(discount)*100 as decimal(10,2))  as 'discnt',
	   cast(sum(Profit)/sum(Sales) *100 as decimal(5,1)) as 'profit % year'
from super_store_datasets
where year([Order Date]) = '2017'
group by Category

select Category,
       cast(sum(Sales) as int) as 'sales',
	   cast(sum(profit) as int) as 'profit',
	   cast(avg(discount)*100 as decimal(10,2))  as 'discnt',
	   cast(sum(Profit)/sum(Sales) *100 as decimal(5,1)) as 'profit % year'
from super_store_datasets
where year([Order Date]) = '2016'
group by Category



