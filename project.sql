create database mydb;
use mydb;
create table students(reg_no int primary key, SNAME char(50), SUID int unique, phone_no varchar(10), DOB date, EMAILID char (50))
insert into students values(0001, 'Pallavi Abhale', 2019220066, '9970705435', DATE '2000-10-15', 'pallavi.abhale@spit.ac.in')
insert into students values(0002, 'Priya Agarwal', 2018120001, '9970701135', DATE '2000-05-15', 'priya.agarwal@spit.ac.in')
insert into students values(0003, 'Varun Agnihotri', 2018120002, '9970385435', DATE '2001-10-15', 'varun.agnihotri@spit.ac.in')
insert into students values(0004, 'Ramanansri Aiyar', 2018120003, '9971505435', DATE '2000-10-11', 'ramanansri.aiyar@spit.ac.in')
insert into students values(0005, 'ANUBHAV ANAND', 2018120004, '9972705435', DATE '2000-02-10', 'anubhav.anand@spit.ac.in')
insert into students values(0006, 'Nirmal Attarde', 2019220067, '9950705435', DATE '2000-08-05', 'nirmal.attarde@spit.ac.in')
insert into students values(0007, 'Aayush Raj', 2018120005, '9970775435', DATE '2000-09-11', 'aayush.raj@spit.ac.in')
insert into students values(0008, 'Aayush Bagrecha', 2018120006, '9970702435', DATE '2000-02-02', 'aayush.bagrecha@spit.ac.in')
insert into students values(0009, 'Priyanka Berad', 2015220065, '9970705135', DATE '2000-05-19', 'priyanka.berad@spit.ac.in')
insert into students values(0010, 'Yash Bhadane', 2018120007, '9970705430', DATE '2000-07-29', 'yash.bhadane@spit.ac.in')
select*from students
drop table students



create table Academics(SUID int unique, Skills char(255), CGPA int, Extra_Curricular_Activity char(255), Courses char(255))  
insert into Academics values(2019220066,'java,python,Communication',8.64,'Beach Cleaning','Python')
insert into Academics values(2018120001,'DSA,python,Leadership',9.12,'Head of WIE_WDC_SPIT','DSA')
insert into Academics values(2018120002,'SQL,PHP,Ability to work under pressure',10,'Head of OCULUS','SQL')
insert into Academics values(2018120003,'DBMS,python,Communication',8.9,'Beach Cleaning','DBMS')
insert into Academics values(2018120004,'C++,python,Teamwork',9.5,'Beach Cleaning','C++')
insert into Academics values(2019220067,'Wordpress,python,Communication',10,'Finance Head','Wordpress')
insert into Academics values(2018120005,'Problem Solving,python,Communication',8.04,'Cultural GS','Python')
insert into Academics values(2018120006,'Networking,python,Communication',7.12,'Beach Cleaning','Networking')
insert into Academics values(2015220065,'java,Cyber Security,Communication',10,'General Secretary','Cyber Security')
insert into Academics values(2018120007,'java,python,Leadership',9.23,'YouTuber','Python')
select*from Academics

SELECT Academics.skills, Academics.CGPA, Academics.Extra_Curricular_Activity, Academics.Courses, Students.SNAME 
FROM Academics, Students
WHERE Academics.SUID=Students.SUID;

create table companies  (RegNo int primary key, CName char(20) not null, Category char(10), JobProfile Char(25), LPA int not null , Address char(20) , Website char(30) unique);
insert into companies values(121001, 'Deutsche Bank','ABC', 'Software Developer',  9, 'Goregaon, Mumbai', 'www.deutschebank.co.in');
insert into companies values(121002, 'GEP','ABC', 'Business Analyst',  8, 'Airoli, Navi Mumbai', 'www.gep.com');
insert into companies values(121003, 'JP Morgan','ABC', 'Investment Banking',  20 , 'Santacruz, Mumbai', 'www.jpmorgan.com');
insert into companies values(121004, 'Deloitte','ABC', 'Business consultancy', 11, 'Elphinstone, Mumbai', 'www2.deloitte.com');
insert into companies values(121005, 'L&T','ABC', 'Embedded Enginner',  13, 'Powai, Mumbai', 'www.larsentoubro.com');
insert into companies values(121006, 'Amazon Web Services','ABC', 'Cloud Support Associate',  17 , 'Powai, Mumbai', 'aws.amazon.com');

select * from companies;
drop table companies
delimiter //
CREATE TRIGGER tg_cs_before_insert BEFORE INSERT ON companies
       FOR EACH ROW
       BEGIN
           IF NEW.LPA <=10 THEN SET NEW.Category = 'Normal';
           ELSEIF NEW.LPA >10 AND NEW.LPA <=15 THEN SET NEW.Category = 'Dream';
           ELSEIF NEW.LPA >15 THEN SET NEW.Category = 'Elite';
           END IF;
       END;//
 delimiter ;


create table interview (SName char(20) unique, CName char(20) not null, InterviewDate date not null , Round char(10), TPO_Incharge char(20))
insert into interview values ('Pallavi Abhale', 'Deutsche Bank', date '2021-06-12',  'Round 1', 'Mriyunjay Joshi')
insert into interview values ('Priya Agarwal', 'L&T', date '2021-08-21',  'Round 2', 'Alvan Dmello')
insert into interview values ('Varun Agnihotri', 'JP Morgan', date '2021-06-12',  'Round 2', 'Dipankar Sen')
insert into interview values ('Ramanansri Aiyar', 'GEP', date '2021-06-12',  'Round 1', 'Dipankar Sen')
insert into interview values ('Anubhav Anand', 'Deloitte', date '2021-07-12',  'Round 3', 'Dipankar Sen')
insert into interview values ('Nirmal Attarde', 'Deloitte', date '2021-06-30',  'Round 1', 'Dipankar Sen')
insert into interview values ('Ayush Raj', 'JP Morgan', date '2021-06-12',  'Round 2', 'Dipankar Sen')
insert into interview values ('Aayush Bagrecha', 'Amazon Web Services', date '2021-06-24',  'Round 1', 'Mrityunjay Joshi')
insert into interview values ('Priyanka Berad', 'GEP', date '2021-06-15',  'Round 2', 'Dipankar Sen')
insert into interview values ('Yash Bhadane', 'L&T', date '2021-06-20',  'Round 1', 'Alvan Dmello')

select * from interview
drop table interview
drop table TPO
create table TPO (RegNumber int primary key, SNAME char (50), CName char (50), Manager_Name char(50) default ('Sikka Sir'));
insert into TPO(RegNumber, SNAME) values(0001, 'Pallavi Abhale');
insert into TPO (RegNumber, SNAME) values(0002, 'Priya Agarwal');
insert into TPO (RegNumber, SNAME) values(0003, 'Varun Agnihotri');
insert into TPO (RegNumber, SNAME) values(0004, 'Ramanansri Aiyar');
insert into TPO (RegNumber, SNAME) values(0005, 'ANUBHAV ANAND');
insert into TPO (RegNumber, SNAME) values(0006, 'Nirmal Attarde');
insert into TPO (RegNumber, SNAME) values(0007, 'Aayush Raj');
insert into TPO (RegNumber, SNAME) values(0008, 'Aayush Bagrecha');
insert into TPO (RegNumber, SNAME) values(0009, 'Priyanka Berad');
insert into TPO (RegNumber, SNAME) values(0010, 'Yash Bhadane');
select*from TPO;
insert into TPO (RegNumber, CNAME) values(121001, 'Deutsche Bank')
insert into TPO (RegNumber, CNAME) values(121002, 'GEP');
insert into TPO (RegNumber, CNAME) values(121003, 'JP Morgan');
insert into TPO (RegNumber, CNAME) values(121004, 'Deloitte');
insert into TPO (RegNumber, CNAME) values(121005, 'L&T');
insert into TPO (RegNumber, CNAME) values(121006, 'Amazon Web Services');

delimiter //
CREATE TRIGGER tg_ps_before_insert BEFORE INSERT ON placement_statistics
       FOR EACH ROW
       BEGIN
           IF NEW.Package <=10 THEN SET NEW.Category_Company = 'Normal';
           ELSEIF NEW.Package >10 AND NEW.Package <=15 THEN SET NEW.Category_Company = 'Dream';
           ELSEIF NEW.Package >15 THEN SET NEW.Category_Company = 'Elite';
           END IF;
       END;//
 delimiter ;

create table placement_statistics( SUID int primary key, Placed_Students char (50), Package int, Category_Company char (50));
insert into placement_statistics values(2019220066, 'Pallavi Abhale', 13, 'sd');
insert into placement_statistics values(2018120002, 'Varun Agnihotri', 20, 'abcd');
insert into placement_statistics values(2019220067, 'Nirmal Attarde', 11, 'sd');
insert into placement_statistics values(2018120004, 'Anubhav Anand', 19, 'sd');
insert into placement_statistics values(2018120001, 'Priya Agrwal', 10, 'sd');
select*from placement_statistics
drop table placement_statistics

SELECT Academics.skills, Academics.CGPA, Academics.Extra_Curricular_Activity, Academics.Courses
FROM Academics
Inner Join Students ON Academics.SUID=Students.SUID;

SELECT Students.reg_no, Students.SNAME, Students.SUID, Students.PHONE_no, Students.DOB, Students.EMAILID
FROM Students
Inner Join TPO ON Students.SNAME=TPO.SNAME;

SELECT companies.RegNo, companies.CName, companies.Category, companies.JobProfile, companies.LPA, companies.Address, companies.Website
FROM Companies
Inner Join TPO ON companies.CName = TPO.CName;

SELECT Interview.SName, Interview.CName, Interview.InterviewDate, Interview.Round, Interview.TPO_Incharge
FROM Interview
Inner Join TPO ON Interview.SName = TPO.SNAME;

SELECT placement_statistics.SUID, placement_statistics.Placed_Students, placement_statistics.Package, placement_statistics.Category_Company 
FROM placement_statistics
Inner Join students ON placement_statistics.Placed_Students = students.SNAME;


CREATE VIEW S_Academics
AS SELECT a.SNAME, a.phone_no, a.DOB, a.EMAILID, b.Skills, b.CGPA, b.Extra_Curricular_Activity, b.Courses
FROM students a, Academics b
WHERE a.SUID=b.SUID;
select * from  students order by SUID;
select*from S_Academics


CREATE VIEW S_interview
AS SELECT a.SNAME, a.phone_no, a.DOB, a.EMAILID, b.CName, b.InterviewDate, b.Round, b.TPO_Incharge
FROM students a, interview b
WHERE a.SNAME=b.SNAME;
select * from  students order by SNAME;
select*from S_interview 

select count(Placed_Students) as No_Of_Placed_Students from placement_statistics;
select count(RegNo) as Total_Companies from companies;
select avg(package) as Average_Package from placement_statistics;
select max(package) as Max_Package from placement_statistics;
select min(package) as Min_Package from placement_statistics;

