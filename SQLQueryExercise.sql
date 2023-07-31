---create database ExerciseDb(drop if exists)
if exists(select name from sys.databases where name = 'ExerciseDb')
drop database ExerciseDb

create database ExerciseDb
use ExerciseDb
----create table student
create table Student(
Sid int primary key,
SName nvarchar(50),
SEmail nvarchar(100),
SContact nvarchar(20)
);
------insert records into student table
insert into Student(Sid,SName,SEmail,SContact)
values
(1,'Jay shah','jay.shah@gmail.com','2342354363'),
(2,'Raj Roy','raj.rou@gmail.com','4546663567'),
(3,'Manoj pandey','manoj.pandey@gmail.com','9765446778');

----create table Fee
create table Fee(
Sid int,
SFee nvarchar(50),
SMonth nvarchar(20),
SYear int,
primary key (Sid,SMonth,SYear),
foreign key (Sid) references Student(Sid)
);
---insert records into fee table
insert into Fee(Sid,SFee,SMonth,SYear)
values
(1,'Monthly','January',2023),
(2,'Quarterly','March',2023),
(3,'Annualy','May',2023);
----create table payconfirmation
create table PayConfirmation(
Sid int,
Name nvarchar(50),
Email nvarchar(100),
Fee nvarchar(50),
PaidOnDate DATE);
----create trigger trgFeePayConfirmation
create trigger trgFeePayConfirmation
on Fee
after insert
as
begin
insert into PayConfirmation(Sid,Name,Email,Fee,PaidOnDate)
select s.Sid,s.SName,s.SEmail,i.SFee,GETDATE()
from Student s
join inserted i on s.Sid = i.Sid;
end;
---fetch all records from payconfirmation
select * from PayConfirmation;

 
