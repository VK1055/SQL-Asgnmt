use assignment;
##### Q1 . Write a stored procedure that accepts the month and year as inputs and prints the ordernumber 
### orderdate and status of the orders placed in that month. 

SELECT * FROM ORDERS;
DELIMITER $$
CREATE PROCEDURE order_status( od_month int, od_year int)
BEGIN
SELECT ORDERNUMBER, ORDERDATE, STATUS FROM ORDERS 
WHERE MONTH(ORDERDATE)= od_month and year(orderdate) = od_year;
end $$

DELIMITER ;
call order_status(4,2005) ;
select * from payments;
use assignment;

######. Q2 a. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]
#### if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
#### if amount > 50000 Platinum

#### b. Write a query that displays customerNumber, customername and purchase_status from customers table.


select* from payments;
DELIMITER $$
CREATE FUNCTION customer_status(cust_No INT) RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE status VARCHAR(10);
    
    SELECT CASE
        WHEN SUM(amount) < 25000 THEN 'Silver'
        WHEN SUM(amount) BETWEEN 25000 AND 50000 THEN 'Gold'
        ELSE 'Platinum'
    END INTO status
    FROM payments
    WHERE customerNumber = cust_No;

    RETURN status;
END $$
DELIMITER ;

SELECT CUSTOMER_STATUS(103);

SELECT*FROM ORDERS;
SELECT*FROM CUSTOMERS;

SELECT cu.customernumber,cu.customername,od.status from customers cu 
join orders od on cu.customernumber=od.customernumber;

select*from movies;
select*from rentals;

#### Q3 Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables. 
## Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above

delimiter $$
create trigger delete_cascade
after delete on movies for each row
begin
DELETE FROM rentals WHERE movieid = OLD.id;
end $$
delimiter $$

DELIMITER $$
CREATE TRIGGER update_cascade
AFTER UPDATE on movies FOR EACH ROW 
BEGIN
UPDATE rentals
SET movieid = new.id
WHERE movieid = old.id;
END $$
DELIMITER ;

show triggers;

### Q4 Select the first name of the employee who gets the third highest salary

SELECT * FROM EMPLOYEE;
SELECT FNAME, SALARY FROM EMPLOYEE ORDER BY SALARY desc
LIMIT 2,1;

#### Q5 Assign a rank to each employee  based on their salary. 
### The person having the highest salary has rank 1. 

SELECT EMPID, FNAME,LNAME,DEPTNO,SALARY, 
DENSE_RANK()OVER(ORDER BY SALARY DESC) EMP_RANK
FROM EMPLOYEE
ORDER BY EMP_RANK;



 


