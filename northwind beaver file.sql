select * from all_together;

select * from order_details od  ;

--1
SELECT DISTINCT p.productname
FROM products p
INNER JOIN order_details od ON p.productid = od.productid
INNER JOIN orders o ON od.orderid = o.orderid
WHERE o.orderdate BETWEEN '1996-01-01' AND '1997-12-31'


--2
SELECT productname, unitsinstock
FROM products p
INNER JOIN orders o ON p.productid = o.orderid
WHERE o.orderdate = '1998-05-06'


select* from orders o  ;
select * from products p;


--3
SELECT "productname", "unitprice"
FROM products p 
WHERE "unitprice" > 21
ORDER BY "unitprice" desc
LIMIT 3



--4

select * from products p;

SELECT "productname", "unitprice"
FROM products
WHERE UnitPrice > 21

--5
SELECT productname
FROM products
WHERE unitprice BETWEEN 5 AND 15;

--6
SELECT productname
FROM products
WHERE unitprice < (SELECT AVG(unitprice) FROM products);

--7
SELECT
    SUM(CASE WHEN o.orderdate >= '1998-01-01' THEN 1 ELSE 0 END) AS verkauft,
    SUM(CASE WHEN p.discontinued = 1 THEN 1 ELSE 0 END) AS eingestellt
FROM
    orders o
JOIN
    order_details od ON o.orderid = od.orderid
JOIN
    products p ON od.productid = p.productid
    
--8
select
	c.contactname,
	SUM(od.quantity) as total_quantity
from
	customers c
join
    orders o on
	c.customerid = o.customerid
join
    order_details od on
	o.orderid = od.orderid
group by
	c.contactname
order by
	total_quantity desc
limit 1;

select * from customers c 

--9
SELECT
    firstname,
    lastname,
    SUBSTRING(hiredate, 1, 4)::integer - SUBSTRING(birthdate, 1, 4)::integer AS alter_eingestellt
FROM
    employees;

   --10
SELECT
    p.productname,
    o.orderid,
    o.orderdate,
    p.unitsinstock,
    od.quantity
FROM
    orders o
INNER JOIN
    order_details od ON o.orderid = od.orderid
INNER JOIN
    products p ON od.productid = p.productid
WHERE
    o.orderdate = (
        SELECT
            MAX(orderdate)
        FROM
            orders
    )
    AND od.quantity > p.unitsinstock;

--11

select * from customers c; 

SELECT
    e.firstname || ' ' || e.lastname AS verkauefer,
    s.companyname AS transportschiff,
    c.contactname AS kunde,
    p.productname AS produkte
FROM
    employees e
INNER JOIN
    orders o ON e.employeeid = o.employeeid
INNER JOIN
    customers c ON o.customerid = c.customerid
INNER JOIN
    order_details od ON o.orderid = od.orderid
INNER JOIN
    products p ON od.productid = p.productid
INNER JOIN
    shippers s ON o.shipvia = s.shipperid
INNER JOIN
    suppliers ON o.shipvia = suppliers.supplierid
INNER JOIN
    (
        SELECT
            employeeid,
            SUM(od.quantity * od.unitprice) AS total_sales
        FROM
            order_details od
        INNER JOIN
            orders o ON od.orderid = o.orderid
        GROUP BY
            employeeid
        ORDER BY
            total_sales DESC
        LIMIT
            1
    ) AS top_seller ON e.employeeid = top_seller.employeeid
ORDER BY
    verkauefer, transportschiff, kunde, produkte;
   
--12   
select
	c.contactname as customer,
	p.productname as product,
	MAX(od.quantity) as max_quantity
from
	customers c
inner join
    orders o on
	c.customerid = o.customerid
inner join
    order_details od on
	o.orderid = od.orderid
inner join
    products p on
	od.productid = p.productid
group by
	c.contactname,
	p.productname
having
	MAX(od.quantity) = (
	select
		MAX(quantity)
	from
		order_details
    );

--13
SELECT
    c.customerid,
    c.companyname,
    DATE_PART('YEAR', CAST(o.orderdate AS DATE)) AS order_year,
    COUNT(*) AS total_orders
FROM
    customers c
INNER JOIN
    orders o ON c.customerid = o.customerid
WHERE
    DATE_PART('YEAR', CAST(o.orderdate AS DATE)) IN (1996, 1997, 1998)
GROUP BY
    c.customerid,
    c.companyname,
    order_year
ORDER BY
    order_year,
    total_orders DESC;

SELECT
    e.employeeid,
    e.firstname || ' ' || e.lastname AS employee_name,
    DATE_PART('YEAR', CAST(e.hiredate AS DATE)) AS hire_year,
    COUNT(*) AS total_changes
FROM
    employees e
INNER JOIN
    employee_territories et ON e.employeeid = et.employeeid
INNER JOIN
    orders o ON et.employeeid = o.employeeid
WHERE
    DATE_PART('YEAR', CAST(o.orderdate AS DATE)) IN (1996, 1997, 1998)
GROUP BY
    e.employeeid,
    employee_name,
    hire_year
ORDER BY
    hire_year,
    total_changes DESC;
   
SELECT
    p.productid,
    p.productname,
    DATE_PART('YEAR', CAST(o.orderdate AS DATE)) AS order_year,
    SUM(od.quantity) AS total_quantity
FROM
    products p
INNER JOIN
    order_details od ON p.productid = od.productid
INNER JOIN
    orders o ON od.orderid = o.orderid
WHERE
    DATE_PART('YEAR', CAST(o.orderdate AS DATE)) IN (1996, 1997, 1998)
GROUP BY
    p.productid,
    p.productname,
    order_year
ORDER BY
    order_year,
    total_quantity DESC;
   
 select * from categories;

   



   



