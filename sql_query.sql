	use bike_share;


	select * from 
	(WITH cte as (
		select * from bike_share_21 
		union 
		select * from bike_share_22)
	SELECT dteday, season, cte.yr, weekday, hr, rider_type, riders, price, COGS
	FROM cte
	left join cost_table ct
	on cte.yr = ct.yr) db;


	select * from 
	(with cte as 
	(select * from bike_share_21 
	union 
	select * from bike_share_22 )
	select  
	dteday,
	season,
	cte.yr,
	weekday, 
	hr, 
	rider_type, 
	riders, 
	price, 
	COGS,
	riders*price as revenue,
	riders*price-COGS as profit
	from cte
	left join cost_table ct
	on cte.yr = ct.yr) db;
