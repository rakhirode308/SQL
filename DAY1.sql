show databases;

/* ---------------------------------------INTRODUCTION----------------------------------
DSDSVVD
CVDVC
 */
 
 /* DDL COMMANDS :
 
 CREATE
 ALTER
 DROP
 TRUNCATE
 
 */
 
 
 /* 
 CREATING DATABASE :
 SYNTAX :
 CREATE DATABASE DATABASE_NAME;
 */
 
 create database ds_batch23;
 show databases;
 
 /*
 DROPPING DATABASE
 SYNTAX:
 DROP DATABASE DATABASE_NAME;
 */
 
 drop database ds_batch23;
 show databases;
 
 create database ds_batch23;
 show databases;
 
 
 /*
 CREATING TABLES
 SYNTAX:
 CREATE TABLE TABLE_NAME(COLUMN1 DATATYPE,
						COLUMN2 DATATYPE,
                        ----------------,
                        -
                        -
						);
*/

use ds_batch23;
 create table student(id int,
					  name varchar(50),
                      age int,
                      city varchar(50));
                      
show tables;
desc student;

drop table student;
show tables;

create table student(id int,
					  name varchar(50),
                      age int,
                      city varchar(50));
                      
show tables;
desc student;

