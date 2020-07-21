Q -Write a query that displays only the state with the largest amount of fruit
supply.

A - SELECT state , max(supply) as max_supply
    FROM fruit_imports
    GROUP BY state
	  ORDER BY max_supply DESC
	  LIMIT 1



Q -Write a query that returns the most expensive cost_per_unit of every season.
The query should display 2 columns, the season and the cost_per_unit

A - SELECT season, max(cost_per_unit)
    FROM fruit_imports
    GROUP BY season
    ORDER BY max(cost_per_unit) desc


Q -Write a query that returns the state that has more than 1 import of the
same fruit.
A - SELECT state, name, count(*)
    FROM fruit_imports
    GROUP BY state, name
    HAVING count(*) > 1

Q -Write a query that returns the seasons that produce either 3 fruits or
4 fruits.

A - SELECT season, COUNT(name)
FROM fruit_imports
GROUP BY season
HAVING count(name) = 3 OR count(name) = 4

Q -Write a query that takes into consideration the supply and cost_per_unit
columns for determining the total cost and returns the most expensive state
with the total cost.

A- SELECT SUM(supply * cost_per_unit) as total_cost, state
  FROM fruit_imports
  GROUP BY state
  ORDER BY total_cost desc
  LIMIT 1

Q -Execute the below SQL script and answer the question that follows:


CREATE table fruits (fruit_name varchar(10));
INSERT INTO fruits VALUES ('Orange');
INSERT INTO fruits VALUES ('Apple');
INSERT INTO fruits VALUES (NULL);
INSERT INTO fruits VALUES (NULL);

Write a query that returns the count of 4. You'll need to count on the column
fruit_name and not use COUNT(*)

HINT: You'll need to use an additional function inside of count to make this work.

A - SELECT COUNT(COALESCE(fruit_name,'NONE'))
    FROM fruits
