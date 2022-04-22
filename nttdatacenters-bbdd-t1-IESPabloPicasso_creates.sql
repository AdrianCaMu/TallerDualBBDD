CREATE DATABASE IF NOT EXISTS Education;

use Education;

CREATE TABLE Company (
    company_id int primary key auto_increment,
    name varchar(30) not null,
    headquarter varchar(20),
    field varchar(40)
);

CREATE TABLE Trainer (
    nif char(9) primary key,
    name varchar(30) not null,
    email varchar(60) not null,
    phone_number char(9),
    company int,
    foreign key (company) references Company(company_id)
);

CREATE TABLE Grade (
    grade_id char(10) primary key,
    name varchar(30) not null check (name in ('first', 'second'))
);

create table Teach (
	trainer char(9),
    grade char(10),
    constraint pk_teach primary key (trainer, grade),
    constraint fk_trainer foreign key (trainer) references Trainer(nif),
    constraint fk_grade foreign key (grade) references Grade(grade_id)
);

CREATE TABLE Subject (
    subject_id char(10) primary key,
    name varchar(80) not null,
    grade char(10),
    foreign key (grade) references Grade(grade_id)
);

CREATE TABLE High_School (
    high_school_id char(10) primary key,
    name varchar(30) not null,
    province varchar(30),
    address varchar(30),
    type varchar(20) check (type in ('public', 'private'))
);

CREATE TABLE Students (
    nif char(9) primary key,
    name varchar(30) not null,
    email varchar(60) not null,
    phone_number char(9),
    high_school char(10),
    foreign key (high_school) references High_School(high_school_id)
);

CREATE TABLE Courses (
	student_nif char(9),
    subject_id char(10),
    final_mark int check (final_mark >= 0 AND final_mark <= 10),
    constraint pk_courses primary key (student_nif, subject_id),
	constraint fk_student foreign key (student_nif) references Students(nif),
    constraint fk_module foreign key (subject_id) references Subject(subject_id)
);

CREATE TABLE Schedules (
	high_school_id char(10),
    grade_id char(10),
    start_date date,
    end_date date,
    start_hour varchar(10),
    end_hour varchar(10),
    days varchar(40),
    constraint pk_schedules primary key (high_school_id, grade_id),
    constraint fk_high_school foreign key (high_school_id) references High_School(high_school_id),
    constraint fk_grade_schedules foreign key (grade_id) references Grade(grade_id)
);