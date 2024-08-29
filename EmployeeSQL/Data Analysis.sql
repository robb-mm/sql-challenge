-- 1.
SELECT e.empno, lastname, firstname, sex, salary
FROM	employee e --limit 10
INNER JOIN	salary s
on		e.empno=s.empno;

-- 2.
SELECT	firstname, lastname, hiredate
FROM	employee
WHERE	extract(year from hiredate) = 1986;

-- 3.
SELECT	e.empno, e.firstname||' '||e.lastname as "Manager",
		d.deptno, d.deptname "Department Name"
FROM	employee e, deptmanager dm, department d
WHERE	e.empno = dm.empno
AND		dm.deptno = d.deptno;

-- 4.
SELECT	e.empno, e.firstname||' '||e.lastname as "Employee",
		d.deptname "Department Name", d.deptno
FROM	employee e, deptemp de, department d
WHERE	e.empno = de.empno
AND		de.deptno = d.deptno;

-- 5.
SELECT	firstname||' '||lastname as "Employee", sex
FROM	employee
WHERE	firstname = 'Hercules'
AND		lastname like 'B%';

-- 6.
SELECT	e.empno, e.firstname||' '||e.lastname as "Employee"
FROM	employee e, deptemp de, department d
WHERE	e.empno = de.empno
AND		de.deptno = d.deptno
AND		d.deptname = 'Sales';

-- 7.
SELECT	e.empno, e.firstname||' '||e.lastname as "Employee",
		d.deptname "Department Name"
FROM	employee e, deptemp de, department d
WHERE	e.empno = de.empno
AND		de.deptno = d.deptno
AND		d.deptname IN ('Sales', 'Development');

-- 8.
SELECT	lastname, count(*)
FROM	employee
GROUP BY lastname
order by count(*) DESC;
