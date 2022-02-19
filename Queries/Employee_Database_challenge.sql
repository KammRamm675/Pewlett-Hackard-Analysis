--D-1 Create a table for emp, first, last, title, fromdate and todate  (parts 1-7?)
SELECT e.emp_no, 
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
select * from retirement_titles

-- Use "select DISTINCT" for emp_no, first and last names, and titles IMPORT THE STARTER CODE Parts 8-15)
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no ASC, rt.to_date DESC;
select * from unique_titles

--- Query for a "ritiring titles table" parts 16-21
SELECT COUNT(ut.title) as count, ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
Order by count DESC;
select * from retiring_titles

-- D-2 Mentorship (retrieve empno, fname, lname, bdate from empcsv / retrieve fdate, tdate from dempcsv / retrieve title from titlescsv USE DISTINCT ON)
SELECT DISTINCT ON (e.emp_no) e.emp_no, 
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01') --current emp = '9999-01-01'
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
select * from mentorship_eligibility

