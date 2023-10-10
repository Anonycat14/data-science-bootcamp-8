-- to open database --
.open restaurant.db

-- to create table and columns, then insert the data --
create table Customers (
    Customer_Id int,
    Customer_Name text, 
    Member_level text,Email text, 
    City text, Country  text 
    );

insert into Customers values 
    (01,'Lizzy','VIP','Lizzy@gmail.com','Michigan','USA'),
    (02,'Raymond','SVIP','Raymond@anonycat.com','unidentified','Top Secret'),
    (03,'Glen','Bronze','Glen@yahoo.com','Tennessee','USA'),
    (04,'Dembe','Gold','Dembe@anonycat.com','unidentified','South Sudan'),
    (05,'Tom','Gold','Tom@gmail.com','New York','USA'),
    (06,'Marvin','Gold','Marvin@anonycat.com','Chicago','USA');

Create table Menus (
    Menu_Id int, 
    Menu_Name text, 
    Meal_Price REAL
    );

insert into Menus values
    (01,'Packzi',25),
    (02,'baklava',75),
    (03,'fried butter',77),
    (04,'Pancakes',57),
    (05,'Strawberry Bismarck',19),
    (06,'Beef Stroganoff',98);

create table Employees (
    Employee_Id int,
    First_Name text,
    Last_Name text, 
    Position text
    );

insert into Employees values
    (01, 'Harold','Cooper', 'Manager'),
    (02,'Donald', 'Ressler',' Bartender'),
    (03,'Alina', 'Park', 'Cashier'),
    (04,'Aram', 'Mojtabai', 'Barista'),
    (05,'Samar', 'Navabi', 'Chef'),
    (06,'Meera','Malik','Waitress');

create table Beverages (
    Beverages_Id int,
    Beverage_name text, 
    Beverage_Price real
    );

insert into Beverages values
    (01,'Aviation Cocktail',100),
    (02,'Red Wine',70),
    (03,'Peach Bellini',58),
    (04,'viagra cocktail',25),
    (05,'Champagne',230),
    (06,'Espresso',23);
 

create table Orders (
    Order_Id int,
    Customer_Id int,
    Employee_Id int,
    Menu_Id int,
    Beverages_Id int,
    Total int,
    Order_Date datetime
    );

insert into Orders values 
(101,01,03,05,01,119,'2019-03-01'),
(102,02,05,05,04,44,'2019-05-02'),
(103,03,01,01,02,95,'2019-01-03'),
(104,04,02,04,01,157,'2019-02-04'),
(105,06,04,06,03,156,'2019-04-06'),
(106,05,06,03,02,147,'2019-06-05'),
(201,01,05,02,05,305,'2020-05-05'),
(202,02,01,01,06,48,'2020-05-05'),
(203,04,01,04,05,287,'2020-05-05'),
(301,02,02,06,04,123,'2021-12-12'),
(302,06,01,02,03,133,'2021-12-12'),
(401,05,02,01,04,50,'2022-06-05');

-- try to run a SQL Query --

-- SUB QUERY + JOIN --
SELECT  
        SUB2.order_id,
		SUB1.customer_name,
		SUB1.member_level,
        SUB1.country,
        SUB2.total
  FROM 
 		(SELECT * from Customers 
		where country = 'USA') AS SUB1
        
  JOIN
  		(SELECT * from Orders
  		 where order_id BETWEEN '102' and '201' ) as SUB2
  ON    
        SUB1.customer_id = SUB2.customer_id 
  ORDER BY total desc;

  --WITH (common table expression)--
WITH SUB1 AS (SELECT * from Menus 
			 			  WHERE meal_price >= 50),
		 SUB2 AS (SELECT * FROM Orders
              WHERE order_date BETWEEN '2019-01-01' AND '2021-12-12'),
		 SUB3 AS (SELECT * FROM Customers),
		 SUB4 AS (SELECT * FROM Beverages)
SELECT  SUB3.customer_name,
        SUB3.member_level,
        SUB3.country,
		SUB1.meal_price,
        SUB4.beverage_price,
        SUB2.total,
        SUB2.order_date 
FROM SUB1 JOIN SUB2
ON SUB1.menu_id = SUB2.menu_id
JOIN SUB3
On SUB3.customer_id = SUB2.customer_id
JOIN SUB4 
ON SUB4.beverages_id = SUB2.beverages_id
order by order_date;

-- aggregate functions --
SELECT ROUND(AVG(Beverage_price),2) Drink_AVG,
	   		SUM(beverage_price) Drink_SUM,
       		MIN(beverage_price)Drink_MIN,
       		MAX(beverage_price)Drink_MAX,
       		SUM(meal_price),
       		MIN(meal_price) Meal_Min,
            AVG(meal_price) meal_AVG
	   FROM Menus
       JOIN Beverages
ON Menus.Menu_Id = Beverages.Beverages_Id;


--Case when --
 SELECT Cus.customer_name,
        Cus.member_level,
        Odr.total,
        CASE 
        	when total > 150 then 'Debit' 
            else 'Cash' 
        END Payment
FROM  Orders as Odr
    join Customers as CUS
     ON Cus.Customer_Id = Odr.Customer_Id
ORDER BY TOTAL DESC;
