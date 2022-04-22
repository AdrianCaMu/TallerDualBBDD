CREATE DATABASE IF NOT EXISTS Education;
CREATE TABLE Company (
    company_id char(10) primary key,
    name varchar(30) not null,
    campus varchar(20),
    professionally varchar(40),
    former_nif char(9)
);

CREATE TABLE Former (
    nif char(9) primary key,
    name varchar(30) not null,
    mail varchar(30) not null,
    phone_number char(9),
    foreign key (nif) references Company(company_id)
);

CREATE TABLE Course (
    course_id char(10) primary key,
    name varchar(30) not null,
    former_id char(9),
    foreign key (former_id) references Former(nif)
);

CREATE TABLE Module (
    module_id char(10) primary key,
    name varchar(30) not null,
    course_id char(10),
    foreign key (course_id) references Course(course_id)
);

CREATE TABLE Institute (
    institute_id char(10) primary key,
    name varchar(30) not null,
    province varchar(30),
    address varchar(30),
    private_public varchar(20) check (private_public in ('public', 'private'))
);

CREATE TABLE Students (
    nif char(9) primary key,
    name varchar(30) not null,
    mail varchar(30) not null,
    phone_number char(9),
    institute_id char(10),
    foreign key (institute_id) references Institute(institute_id)
);

CREATE TABLE Courses (
	student_nif char(9),
    module_id char(10),
    final_mark int check (final_mark >= 0 AND final_mark <= 10),
    constraint pk_courses primary key (student_nif, module_id),
	constraint fk_student foreign key (student_nif) references Students(nif),
    constraint fk_module foreign key (module_id) references Module(module_id)
);

CREATE TABLE Schedules (
	institute_id char(10),
    course_id char(10),
    star_date date,
    end_date date,
    star_hour varchar(10),
    end_hour varchar(10),
    days varchar(40),
    constraint pk_schedules primary key (institute_id, course_id),
    constraint fk_institute foreign key (id_instituto) references Institute(institute_id),
    constraint fk_course foreign key (course_id) references Course(course_id)
);