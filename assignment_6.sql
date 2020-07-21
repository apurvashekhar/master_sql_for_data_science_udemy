Q -
Write a query that displays 3 columns. The query should display the fruit
and it is total supply along with a category of either LOW, ENOUGH or FULL.
Low category means that the total supply of the fruit is less than 20,000.
The enough category means that the total supply is between 20,000 and 50,000.
If the total supply is greater than 50,000 then that fruit falls in the full
category.

ANS-
select name,
supply,
case
when supply < 20000 then 'LOW'
when supply > 20000 and supply < 50000 then 'ENOUGH'
when supply > 50000 then 'FALL'
end as Category
from fruit_imports;


Taking into consideration the supply column and the cost_per_unit column, you
should be able to tabulate the total cost to import fruits by each season.
The result will look something like this:


"Winter" "10072.50"
"Summer" "19623.00"
"All Year" "22688.00"
"Spring" "29930.00"
"Fall" "29035.00"

select * from  fruit_imports ;
select season, sum(supply * cost_per_unit)
from fruit_imports
group by season;



Write a query that would transpose this data so that the seasons become columns
and the total cost for each season fills the first row?

select sum(case when season = 'Winter' THEN (supply * cost_per_unit) END) as Winter,
sum(case when season = 'Summer' THEN (supply * cost_per_unit) END) as Summer,
sum(case when season = 'All Year' THEN (supply * cost_per_unit) END) as All_Year,
sum(case when season = 'Spring' THEN (supply * cost_per_unit) END) as Spring,
sum(case when season = 'Fall' THEN (supply * cost_per_unit) END) as Fall
from fruit_imports ;
