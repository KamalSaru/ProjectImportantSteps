#create database employeedetails;
# create database employee

# Create - table in database with necessary field-----------------------------
create table employee (
ID int not null primary key,
Name varchar(50) not null,
Gender char(1) not null,
Age int not null,
Address varchar(100) not null,
Phone_Number varchar(10) not null,
Email varchar(50) not null
# Constraint name check ( age >=30 and address = 'Texas')
);

# Insert - Used to insert data into table--------------------------------------------
insert into employee(ID, Name, Gender, Age, Address, Phone_Number, Email) values
(13, 'Austin Daniel' , 'F', 25, 'Bostan', '4434233366', 'daniel@gmail.com');

# Select - Used to retrieve data from table---------------------------------
select * from employee;
describe employee;
select * from employee where gender='M';  
Select * from employee where age = 42;  
select * from employee where age > all (select age from employee where age <40);
select * from employee order by id desc;
select * from employee order by age asc;

# select - and or in not in -----------------------------
select * from employee where name in('Kamal Saru'); 

select * from employee where name not in('Kamal Saru');  
select * from employee where gender='M' or age=42;
select * from employee where gender='M' and age=42;
select * from employee where id = 4 and age= 27 or address ='Texas';

# Select - min and nax value, ave, sum, count-------------------------------------
select Min(age) as yougest_Age from employee;
select Max(age) as oldest_Age from employee;
select count(id) from employee;
select ave(age) from employe;

# Select like or begin middle end-----------------------------------
select name from employee where name like'A%';
select email from employee where email like '%yahoo%';
select email from employee where email like'%gmail%';
select name from employee where name like '%l';

# Distinct - provides unique values from a given table,Pass column name as parameter-------
select distinct name from employee;
select distinct (address) from employee;
select distinct age from employee;

# Between - operator is inclusive: begin and end values are included. can be numbers, text or date
select * from employee where age between 25 and 35;
select * from employee where id between 4  and 8;
select * from employee where age between 25 and 35 and id not in (1,2,3);
select * from employee where name between 'Ramon Janel' and 'Adams Vera' order by employee;

# select any or all----------------------------------------------------------------
select name from employee where id = (select id from address where age<40);##

# Rename to existing column-----------------------------------------------------
#alter table myfirstproject.employee rename Firs_Name to First_Name;



# Update - Used to update data into table-------------------------------------
update myfirstproject.employee set name ='Kamal Rana' where id=1;
update employee set remarks ='Thank Yoy!!!' where id =3;
update myfirstproject.employee set dob ='1989-07-23' where id =7;
update employee set salary ='120000' where ID =1;
update employee set salary ='125000' where id =6;
update employee set Firs_Name ='Mahomad', Last_Name = 'Khali' where id = 6;
update myfirstproject.employee set salary='78000' where age < 27;//

# Alter - change table configuration such as updating data type of a column, adding or deleting columns---------------
alter table employee modify column id int not null auto_increment;
alter table employee AUTO_INCREMENT = 101;
alter table employee add Last_Name varchar(25) not null after name;
alter table employee add Firs_Name varchar(25) not null after name;
alter table employee add Remarks varchar(100) not null after salary;
alter table employee add DOB date null after gender;
alter table employee rename employee_Details;
alter table employee Change column name ctype varchar(30) not null;  
alter table myfirstproject.employee add DOB date not null;  
alter table employee drop column DOB;   #drop the column
alter table myfirstproject.employee add salary float null;
alter table employee drop column Firs_Name;
alter table employee drop column last_Name; 

# Delete - used to delete data from table--------------------------------------------------
delete from employee where id=11;  
delete from employee where email like '%gmail%';
delete from employee where age =27 and id = 4;

# truncate - removal all record from the table----------------------------------------------
truncate table employe;  

# Drop - delete the table from database-----------------------------------------------------
drop table employee;
drop table studentlist;
drop database employee;


# Case statements---------------------------------------------------------------------------
select age,
case
when age >40 then 'The age is older.'
when age = 40 then 'The age is exact.'
else 'The age is younger.'
end as age from employee;

select age, gender from employee order by
(case when age then gender
else age
end);

# Inner, Left and Right joining in students and marksheet
Select Id, name, gender, dob, age, address, phone_number, email from students join marksheet on students.id=marksheet.Marksheet_ID;
select Roll_No, students_Name, Math, Science, English, Nepali, Opt_Math, Total_Mark, Percentage, Grade, marksheet_ID from marksheet right join students on marksheet.Marksheet_ID=students.ID;
select Roll_No, students_Name, Math, Science, English, Nepali, Opt_Math, Total_Mark, Percentage, Grade, marksheet_ID from marksheet left join students on marksheet.Marksheet_ID=students.ID;

