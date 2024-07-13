-- TASK 8: Get 10 unknown question on REGEXP and solve it --

select * from sales

-- Condition-1: From order_id, 1st char between c to u, year between 2014 or 2016, last 3rd digit between 3 to 7, last digit 8 or 6 or 2.

	select order_id from sales where order_id ~* '^[c-u][a-z]-201(4|6)-[0-9]{3}[3-7](8|6|2){2}$'


-- Condition-2: From order_date, year between 2014 & 2015, month between 7 to 11, date should be 9 or 13 or 27 or 17

	select order_date from sales where order_date ~* '^201[4-5]-[7-11]-(9|13|27|17)$'


-- Condition-3: From ship_mode we have to find standard class and first class

	select order_id, ship_mode from sales where ship_mode ~* '^[standard class - first class]'


-- Condition-4: From customer_id, 2nd character between h to v, last digit should be 5 or 1 

	select order_id, ship_mode, customer_id from sales where customer_id ~* '^[a-z][h-v]-[0-9]{4}(5|1)$'



-- Condition-5: From product_id, 1st char f or o, 2nd char a to z, 3rd char r,t,a. last 2 digit [0-7], last digit 5,2,6

	select order_id, order_date, product_id from sales 
		where product_id ~* '^(f|0)[a-z](r|t|a)-[a-z]{2}-[0-9]{6}[0-7](5|2|6)$'

	

-- Condition-6: From sales, 1st digit between 3 to 9, 2nd digit 5 or 7 or 4, after dot last 2 digit between 6 or 8
	
	select order_id, ship_mode, sales from sales where sales::varchar ~* '^[3-9](5|7)[0-9].(6|8){2}$'


	
-- Condition-7: Quantity should be 7 or 3
	select order_id, ship_mode, sales, quantity from sales where quantity::varchar ~* '^(7|3)$'


-- Condition-8: Profit, 1st digit should be 1 or 8 and total having 4 digits, after dot should have at least 4 digit where 1st digit should be 9 or 5 or 1, last 2 digit between 3 to 7

	select order_id, ship_mode, sales, quantity, profit from sales where profit::varchar ~* '^(1|8)[0-9]{3}.(9|5|1)[0-9]{2}[3-7]$'


-- Condition-9: From order_id year between 2015 or 2017, last two digit between 4 to 8, last digit shpuld be 7 or 8 or 1

	select order_id,product_id, sales from sales where order_id ~* '^us-201(5|7)-[0-9]{4}[4-8](7|8|1)$'


-- Condition-10: From product_id, 1st 3 character should be TEC , middle two between p to h, 
	-- after dash last digit should be 7 or 8 or 0

select product_id from sales where product_id ~* 'tec'
select product_id, sales from sales where product_id ~* '^tec-[a-z]{2}-[0-9]{7}(7|8|0)$'
