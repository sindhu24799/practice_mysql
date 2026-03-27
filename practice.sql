mysql> CREATE DATABASE practice;
Query OK, 1 row affected (0.054 sec)

mysql> USE practice;
Database changed
mysql> CREATE TABLE students (student_id INT PRIMARY KEY,student_name 
VARCHAR(50) ,department VARCHAR(30));
Query OK, 0 rows affected (0.018 sec)

mysql> CREATE TABLE courses ( course_id INT PRIMARY KEY,course_name INT 
VARCHAR(100) ,credits INT);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual 
that corresponds to your MySQL server version for the right syntax to use 
near 'VARCHAR(100) ,credits INT)' at line 1
mysql> CREATE TABLE courses ( course_id INT PRIMARY KEY, course_name 
VARCHAR(50),credits INT );
Query OK, 0 rows affected (0.006 sec)

mysql> CREATE TABLE enrollments ( enrollment_id INT PRIMARY KEY, 
student_id INT ,course_id INT,FOREIGN KEY (student_id) REFERENCES 
students(student_id),FOREIGN KEY (course_id) REFERENCES 
courses(course_id));
Query OK, 0 rows affected (0.008 sec)

mysql> INSERT INTO students VALUES 
(1,'sindhu','CSE'),(2,'Madhu','ECE'),(3,'Kavi 
Shree','CSE'),(4,'Nikshitha','ECE'),(5,'Bhargavi','IT'),(6,'teja','CSE');
Query OK, 6 rows affected (0.010 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> INSERT INTO courses 
(1,'Python',4),(2,'Java',4),(3,'SQL',3),(4,'HTML&CSS',2),(5,'Dbms',3),(6,'dataStructures',4);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual 
that corresponds to your MySQL server version for the right syntax to use 
near 
'1,'Python',4),(2,'Java',4),(3,'SQL',3),(4,'HTML&CSS',2),(5,'Dbms',3),(6,'dataStr' 
at line 1
mysql> INSERT INTO courses VALUES 
(101,'Python',4),(102,'Java',4),(103,'SQL',3),(104,'HTML&CSS',2)((105,'Dbms',3),(106,'dataStructures',4);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual 
that corresponds to your MySQL server version for the right syntax to use 
near '((105,'Dbms',3),(106,'dataStructures',4)' at line 1
mysql> INSERT INTO courses VALUES 
(101,'Python',4),(102,'Java',4),(103,'SQL',3),(104,'HTML&CSS',2),(105,'Dbms',3),(106,'dataStructures',4);
Query OK, 6 rows affected (0.002 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> INSERT INTO enrollments VALUES 
(1,1,101),(2,2,102),(3,3,103),(4,4,104),(5,5,105),(6,6,106);
Query OK, 6 rows affected (0.002 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT * students;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual 
that corresponds to your MySQL server version for the right syntax to use 
near 'students' at line 1
mysql> SELECT * FROM students;
+------------+--------------+------------+
| student_id | student_name | department |
+------------+--------------+------------+
|          1 | sindhu       | CSE        |
|          2 | Madhu        | ECE        |
|          3 | Kavi Shree   | CSE        |
|          4 | Nikshitha    | ECE        |
|          5 | Bhargavi     | IT         |
|          6 | teja         | CSE        |
+------------+--------------+------------+
6 rows in set (0.000 sec)

mysql> SELECT * FROM courses;
+-----------+----------------+---------+
| course_id | course_name    | credits |
+-----------+----------------+---------+
|       101 | Python         |       4 |
|       102 | Java           |       4 |
|       103 | SQL            |       3 |
|       104 | HTML&CSS       |       2 |
|       105 | Dbms           |       3 |
|       106 | dataStructures |       4 |
+-----------+----------------+---------+
6 rows in set (0.000 sec)

mysql> SELECT * FROM enrollments;;
+---------------+------------+-----------+
| enrollment_id | student_id | course_id |
+---------------+------------+-----------+
|             1 |          1 |       101 |
|             2 |          2 |       102 |
|             3 |          3 |       103 |
|             4 |          4 |       104 |
|             5 |          5 |       105 |
|             6 |          6 |       106 |
+---------------+------------+-----------+
6 rows in set (0.000 sec)

ERROR: 
No query specified

mysql> SELECCT s.student_name,c.course_name FROM students s INNER JOIN 
Enrollments e ON s.student_id = e.student_id INNER JOIN courses c ON 
e.course
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual 
that corresponds to your MySQL server version for the right syntax to use 
near 'SELECCT s.student_name,c.course_name FROM students s INNER JOIN 
Enrollments e ON' at line 1
mysql> SELECT s.student_name , c.course_name FROM enrollments e JOIN s ON 
e.student_id = s.student_id JOIN c ON e.course_id = c.course_id;
ERROR 1146 (42S02): Table 'practice.s' doesn't exist
mysql> SELECT students.student_name,courses.course_name FROM enrollments 
JOIN students ON enrollments.student_id=students.student_id JOIN courses 
ON enrollments.course_id = courses.course_id;
+--------------+----------------+
| student_name | course_name    |
+--------------+----------------+
| sindhu       | Python         |
| Madhu        | Java           |
| Kavi Shree   | SQL            |
| Nikshitha    | HTML&CSS       |
| Bhargavi     | Dbms           |
| teja         | dataStructures |
+--------------+----------------+
6 rows in set (0.000 sec)

mysql> SELECT courses.course_name,students.student_name FROM students LEFT 
JOIN enrollments ON students.student_id = enrollments.student_id LEFT JOIN 
courses ON enrollments.course_id=courses.course_id;
+----------------+--------------+
| course_name    | student_name |
+----------------+--------------+
| Python         | sindhu       |
| Java           | Madhu        |
| SQL            | Kavi Shree   |
| HTML&CSS       | Nikshitha    |
| Dbms           | Bhargavi     |
| dataStructures | teja         |
+----------------+--------------+
6 rows in set (0.000 sec)

mysql> ALTER TABLE students ADD email VARCHAR(50);
Query OK, 0 rows affected (0.009 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE students MODIFY email VARCHAR(100);
Query OK, 6 rows affected (0.017 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE students RENAME COLUMN email TO student_email;
Query OK, 0 rows affected (0.008 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE students DROP COLUMN student_email;
Query OK, 0 rows affected (0.009 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT COUNT(*) AS total_students FROM students;
+----------------+
| total_students |
+----------------+
|              6 |
+----------------+
1 row in set (0.003 sec)

mysql> SELECTCOUNT(*) FROM students WHERE department='CSE';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual 
that corresponds to your MySQL server version for the right syntax to use 
near 'SELECTCOUNT(*) FROM students WHERE department='CSE'' at line 1
mysql> SELECT COUNT(*) FROM students WHERE department='CSE';
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+
1 row in set (0.000 sec)

mysql> SELECT CCOUNT(*) FROM students WHERE department = 'IT';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual 
that corresponds to your MySQL server version for the right syntax to use 
near '*) FROM students WHERE department = 'IT'' at line 1
mysql> SELECT CCOUNT(*) FROM students WHERE department = 'ECE';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual 
that corresponds to your MySQL server version for the right syntax to use 
near '*) FROM students WHERE department = 'ECE'' at line 1
mysql> SELECT COUNT(*) FROM students WHERE department = 'ECE';
+----------+
| COUNT(*) |
+----------+
|        2 |
+----------+
1 row in set (0.000 sec)

mysql> SELECT SUM(marks) AS total_marks FROM students;
ERROR 1054 (42S22): Unknown column 'marks' in 'field list'
mysql> ALTER TABLE students ADD marks INT;
Query OK, 0 rows affected (0.007 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESCRIBE students;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| student_id   | int         | NO   | PRI | NULL    |       |
| student_name | varchar(50) | YES  |     | NULL    |       |
| department   | varchar(30) | YES  |     | NULL    |       |
| marks        | int         | YES  |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
4 rows in set (0.004 sec)

mysql> UPDATE students SET marks = 100 WHERE student_id = 1;
Query OK, 1 row affected (0.002 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE students SET marks = 90 WHERE student_id = 2
    -> ;
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE students SET marks = 90 WHERE student_id=3;
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE students SET marks = 80 WHERE student_id = 4;
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE students SET marks = 100 WHERE student_id = 5;
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE students SET marks = 90 WHERE student_id = 6;
Query OK, 1 row affected (0.001 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT SUM(marks) AS total_marks FROM students;
+-------------+
| total_marks |
+-------------+
|         550 |
+-------------+
1 row in set (0.001 sec)

mysql> SELECT AVG(marks) AS average_marks FROM students;
+---------------+
| average_marks |
+---------------+
|       91.6667 |
+---------------+
1 row in set (0.000 sec)

mysql> SELECT MIN(marks) AS lowest_marks FROM students;
+--------------+
| lowest_marks |
+--------------+
|           80 |
+--------------+
1 row in set (0.001 sec)

mysql> SELECT department , AVG(marks) AS average_marks FROM students GRUOP 
BY department;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual 
that corresponds to your MySQL server version for the right syntax to use 
near 'BY department' at line 1
mysql> SELECT department , AVG(marks) AS average_marks FROM students GROUP 
BY department;
+------------+---------------+
| department | average_marks |
+------------+---------------+
| CSE        |       93.3333 |
| ECE        |       85.0000 |
| IT         |      100.0000 |
+------------+---------------+
3 rows in set (0.000 sec)

mysql> SELECT department,AVG(marks) AS avg_marks FROM students GROUP BY 
department HAVING AVG(marks) > 80;
+------------+-----------+
| department | avg_marks |
+------------+-----------+
| CSE        |   93.3333 |
| ECE        |   85.0000 |
| IT         |  100.0000 |
+------------+-----------+
3 rows in set (0.001 sec)

mysql> touch practice.sql
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual 
that corresponds to your MySQL server version for the right syntax to use 
near 'touch practice.sql' at line 1
mysql> touch practice.sql;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual 
that corresponds to your MySQL server version for the right syntax
mysql> exit;
