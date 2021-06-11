--Part 1. Beginning of CHallenge
Select e.emp_no,
	e.first_name,
e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retirement_titles
From employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

--Part 1: Filter retirement_table to only include most recent title of employees
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no ASC, to_date DESC;

select * from unique_titles;


--Part 1: Create a query to give us a count of titles retiring

Select count(title),
	title
INTO retiring_titles
FROM unique_titles
Group BY title
Order by count DESC;

--Part 2: Mentorship Eligibility

SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_employee as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (de.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY emp_no;