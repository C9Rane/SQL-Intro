use `bestbuy`;
/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name, categories.Name 
FROM products
INNER JOIN categories ON products.CategoryID = categories.CategoryID
WHERE categories.Name = 'Computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
select products.Name, products.Price, reviews.Rating
from products
INNER JOIN reviews ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = '5';
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select sales.EmployeeID, FirstName, LastName, Title, SUM(Quantity)
from sales
inner join employees ON sales.EmployeeID = employees.EmployeeID
GROUP BY sales.EmployeeID
HAVING  SUM(Quantity) = 
(select SUM(Quantity)
from sales
GROUP BY sales.EmployeeID
ORDER BY SUM(Quantity) DESC
LIMIT 1);
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select departments.Name, categories.Name 
from categories
inner join departments ON categories.DepartmentID = departments.DepartmentID
WHERE categories.Name = 'Appliances' or categories.Name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select products.Name, SUM(sales.Quantity), SUM(sales.PricePerUnit * sales.Quantity)
from sales
inner join products on products.ProductID = sales.ProductID
where products.Name = 'Eagles: Hotel California';

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select Name, Reviewer, Rating, Comment
from reviews
inner join products ON products.ProductID = reviews.ProductID
where reviews.Rating = 1 AND Name LIKE '%Visio%TV%';
-- ------------------------------------------ Extra - May be difficult
select sales.EmployeeID, FirstName, LastName, Name, SUM(Quantity)
from employees
INNER JOIN sales ON employees.EmployeeID = sales.EmployeeID
INNER JOIN products ON sales.ProductID = products.ProductID
GROUP BY sales.EmployeeID, sales.ProductID;
/* Your goal is to write a query that serves as an employee sales report.
This query should return the employeeID, the employee's first and last name, the name of each product, how many of that product they sold */select sales.E