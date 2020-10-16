#Basic Queries
1. select Name from students;
2. select * from students where Age>30;
3. select * from students where Age=30 and gender = "F";
4. select Points from students where Name="Alex";
5. insert into students (Name, Age, Gender, Points) values("Maher", "33", "M", "200");
6. update students set Points="400" where Name="Basma";
7. update students set Points="100" where Name="Alex";

################################################################################

#Creating Table

#Copying Layal's info from students sto graduates
UPDATE Graduates
   SET
	Age =    (select students.Age from students where Graduates.Name=students.Name),
	Gender = (select students.Gender from students where Graduates.Name=students.Name),
	Points = (select students.Points from students where Graduates.Name=students.Name)
   where EXISTS  (select * from students where students.Name = Graduates.Name);

#updating Layals graduation date
update Graudates set Graduation="21/07/1987" where Name="Layal";

#Deleting Layal's old record from students
3. Delete from students where Name="Layal";

################################################################################
#Joins
#creating table
create table Newtable as 
select employees.name, companies.name, companies.date
from employees
join companies
on employees.company=companies.name;

#Employees working in companies made before 2000
select employees.name
from employees
join companies
on employees.company=companies.name
where companies.date<2000;

#company with graphic designer
select distinct Company
from employees
where role="Graphic Designer";

################################################################################

#Count and Filter
#person with highest number of points
select Name, Max(Points) from students;
#Average points of students
select avg(points) from students
#number of students with 500 points
select count(name) from students where Points ="500";
#name of students that have S
select Name from students where Name like "%s%";
#name of students descending order of points
select Name, Points from students order by Points;
