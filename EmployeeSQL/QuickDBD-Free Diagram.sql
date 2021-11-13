-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/5Y7Fdi
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Titles" (
    "title_ID" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_ID"
     )
);

CREATE TABLE "Employees" (
    "emp_no" int,   NOT NULL,
    "emp_title_id" varchar,   NOT NULL,
    "birth_date" date,   NOT NULL,
    "first_name" varchar,   NOT NULL,
    "last_name" varchar,   NOT NULL,
    "sex" varchar,   NOT NULL,
    "hire_date" date,   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Departments" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "Dept_Manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" int   NOT NULL
);

CREATE TABLE "Dept_Emp" (
    "emp_no" int   NOT NULL,
    "dept_no" varchar   NOT NULL
);

CREATE TABLE "Salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

ALTER TABLE "Titles" ADD CONSTRAINT "fk_Titles_title_ID" FOREIGN KEY("title_ID")
REFERENCES "Employees" ("emp_title_id");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Dept_Manager" ("emp_no");

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Dept_Manager" ("dept_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Dept_Emp" ("emp_no");

ALTER TABLE "Dept_Emp" ADD CONSTRAINT "fk_Dept_Emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Salaries" ("emp_no");

