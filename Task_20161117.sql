--create SCHEMA Test538
go
CREATE SCHEMA Test538;
go
--create table actor
create table Test538.actor
(act_id int PRIMARY KEY,
act_fname char(20),
act_lname char(20),
act_gender char(1)
);
go
--create table director
create table Test538.director
(dir_id int PRIMARY KEY,
dir_fname char(20),
dir_lname char(20));
go
--create table movie
create table Test538.movie
(mov_id int PRIMARY KEY,
mov_title char(50),
mov_year int,
mov_time int,
mov_lang char(50),
mov_dt_rel date,
mov_rel_country char(5)
);
go
--create table genres
create table Test538.genres
(gen_id int PRIMARY KEY,
gen_title char(20));
go
--create table reviewer
create table Test538.reviewer
(rev_id int PRIMARY KEY,
rev_name char(30));
go
--create table movie_direction
create table Test538.movie_direction
(dir_id int ,
mov_id int,
FOREIGN KEY (dir_id) REFERENCES Test538.director (dir_id),
FOREIGN KEY (mov_id) REFERENCES Test538.movie (mov_id)
);
go
--create table movie_cast
create table Test538.movie_cast
(act_id int ,
mov_id int,
role char(30),
FOREIGN KEY (act_id) REFERENCES Test538.actor (act_id),
FOREIGN KEY (mov_id) REFERENCES Test538.movie (mov_id));
go
--create table movie_genres
create table Test538.movie_genres
(mov_id int ,gen_id int,
FOREIGN KEY (mov_id) REFERENCES Test538.movie (mov_id),
FOREIGN KEY (gen_id) REFERENCES Test538.genres (gen_id));
go
--create table rating
create table Test538.rating
(mov_id int ,rev_id int,rev_stars int,num_o_ratings int,
FOREIGN KEY (mov_id) REFERENCES Test538.movie (mov_id),
FOREIGN KEY (rev_id) REFERENCES Test538.reviewer (rev_id));
go
------------------------------------------------------------------
--1-create table employees
create table Test538.employees
(id int ,
name varchar(900),
salary DECIMAL
);
go

--2-add department column
alter table Test538.employees add department varchar(50);
go

--3-remove salary
alter table Test538.employees drop column salary;
go

--4-Rename the department to Dept_Name
EXEC sp_rename 'Test538.employees.department', 'Dept_Name', 'COLUMN';   

--5-create table projects
create table Test538.projects
(projectid int ,
projectname varchar(900)
);

--6-add primary key employees (id)
alter table Test538.employees alter column id int not null;
alter table Test538.employees add constraint pk_emp primary key (id);

--7-create foreign key between employees ans projects
alter table Test538.projects add constraint fk_projects
FOREIGN KEY (projectid) REFERENCES Test538.employees (id);

--8-remove foreign key between employees and projects
alter table Test538.projects drop constraint fk_projects;

--9-add unique to employees.name
alter table Test538.employees
add constraint uq_employees_name unique (name); 

--10-create table customers
create table Test538.customers
(customers_id int ,
firstname varchar(900),
lastname varchar(900),
email varchar(900),
status varchar(900));

--11-unique firstname,lastname table customers
alter table Test538.customers
add constraint uq_customers_name unique (firstname,lastname);

--12-set default value to status
alter table Test538.customers 
add constraint DF_customers_status default 'Active' FOR status;

