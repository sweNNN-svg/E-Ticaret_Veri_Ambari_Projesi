select *
from facttable

select *
from products

select *
from customers

select *
from time

select *
from payments

select *
from shipments

select *
from campaigns

select a.time_id, b.order_date, c.shipments_id, SUM(d.unit_price)
from facttable a
	left join products d
		on a.product_id=d.product_id
	left join shipments c
		on a.shipments_id=c.shipments_id
	left join time b
		on a.time_id=b.time_id
		where b.order_date between '01/01/2023' and '01/01/2024'
		order by b.order_date asc


-- Belirli bir zaman aralığında toplam kaç satış yapılmış ve toplam gelir ne olmuş?
select count(*) as "Toplam satış miktarı", SUM(b.unit_price) as "Toplam gelir"
from facttable a
	left join products b
		on a.product_id=b.product_id
	left join time c
		on a.time_id=c.time_id
		where c.order_date between '01/01/2023' and '01/01/2024'

-- Aylara göre toplam satışlar nasıl değişmiş?
select count(*) as "Aylık toplam satış miktarı", b.month as "Ay", b.year as "Yıl", b.quarter as "Çeyrek"
from facttable a
	left join time b
		on a.time_id=b.time_id
		group by b.month, b.year, b.quarter
		order by b.year, b.month


-- Kaç müşterimiz birden fazla sipariş vermiş?
select count(*) as "Birden fazla sipariş veren müşteri sayısı", a.customer_id as "Müşteri ID"
from facttable a
	left join customers b
		on a.customer_id=b.customer_id
	group by a.customer_id
	having count(*) > 1

select count(*) as "Birden fazla sipariş veren müşteri sayısı"
from customers
where customer_id in(
	select customer_id
	from facttable
	group by customer_id
	having count(*)>1
)

-- Kampanya döneminde yapılan satışlar ile kampanya dışındaki satışlar arasında fark var mı?
select *
from campaigns

select count(*), b.start_date, b.end_date
from facttable a
	left join campaigns b
		on a.campaigns_id=b.campaigns_id
	group by b.campaigns_id, b.start_date, b.end_date
	order by b.start_date



-- En çok satan 5 ürün kategorisi ve markası hangileri?
select b.product_category, b.product_brand
from facttable a
	left join products b
		on a.product_id=b.product_id

select product_category, product_brand
from products
where product_id in(
	select product_id
	from facttable
	group by count(*)
)
limit 5;


select product_category, product_brand
from products
where product_id in(
	select product_id
	from facttable a
		left join customers b
			on a.customer_id=b.customer_id
	order by product_id desc
)
limit 5;


select count(*), b.product_category, b.product_brand
from facttable a
	left join products b
		on a.product_id=b.product_id
group by a.product_id, b.product_category, b.product_brand
order by count(*) desc
limit 5;
