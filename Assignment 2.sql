use assignment;
### Q1 select all employees in department 10 whose salary is greater than 3000 
select * from employee;
select* from employee where deptno =10 and salary > 3000;

#### Q2 The grading of students based on the marks they have obtained is done as follows:
#40 to 50 -> Second Class
#50 to 60 -> First Class
#60 to 80 -> First Class
#80 to 100 -> Distinctions
## a. How many students have graduated with first class?
## b. How many students have obtained distinction? 

select*from students;
select name,marks,
case
when marks < 40 then "no grades"
when marks >=40 and marks < 50 then "Second Class"
when marks >=50 and marks < 80 then "First Class"
when marks >=80 and marks <= 100 then "Distinction"
end grade
from students;
SELECT 
  COUNT(CASE WHEN marks >= 50 AND marks < 80 THEN 1 END) AS 'First Class',
  COUNT(CASE WHEN marks >= 80 AND marks <= 100 THEN 1 END) AS 'Distinction'
FROM students;

#### Q3 Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer
select * from station;
select distinct city from station where (id % 2)=0;

##### Q4 Find the difference between the total number of city entries in the table and the number of distinct city 
## entries in the table. In other words, if N is the number of city entries in station, and N1 
## is the number of distinct city names in station, write a query to find the value of N-N1 from station.

select count(city) - count(distinct city) from station;

#### Q5 a Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates
select distinct (city) from station 
where (city) like 'a%' or (city) like 'e%' or (city) like 'i%' or (city) like '0%'or (city) like 'u%'; 

#### Q5b Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters 
select distinct (city) from station 
where (city) like 'a%a' or (city) like 'e%e' or (city) like 'i%i' or (city) like 'o%o' or (city) like 'u%u'; 

#### Q5c Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
select distinct (city) from station 
where (city) not like 'a%' or (city) not like 'e%' or (city) not like 'i%' or (city) not like '0%'or (city) not like 'u%';

### Q5d Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels.
select distinct (city) from station 
where (city) not like 'a%a' or (city) not like 'e%e' or (city) not like 'i%i' or (city) not like 'o%o' or (city) not like 'u%u'; 

### Q6 Write a query that prints a list of employee names having a salary greater than $2000 per month who have been employed for less than 36 months. 
 ### Sort your result by descending order of salary. 
 
select* from emp;
select concat(first_name," ", last_name) as name, salary,hire_date from emp where salary > 2000 
and datediff(current_date(),hire_date) < 1080
order by salary desc;

### Q7 How much money does the company spend every month on salaries for each department
select * from employee;

select deptno, sum(salary) from employee group by deptno;

### Q8 How many cities in the CITY table have a Population larger than 100000. 
select * from city;
select count(*) as large_population from city where population > 100000;

##### Q9 What is the total population of California? 
select sum(population) as total_population from city where district = 'california';

#### Q10 What is the average population of the districts in each country
select countrycode,avg(population) from city group by countrycode;

#### Q11 What is the average population of the districts in each country 
select* from orders;
select* from customers;

select od.ordernumber, od.status, od.customernumber,od.comments,cu.customername 
from orders od join customers cu on od.customernumber=cu.customernumber
where od.status = "disputed";





