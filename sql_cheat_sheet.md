## DATABASES
### to create a database:
```sql
CREATE DATABASE IF NOT EXISTS dbName;
```

### to delete a database:
```sql
DROP DATABASE IF EXISTS dbName;
```

### to select specific database:
```sql
USE dbName;
```
### to list extisting databases:
```sql
SHOW DATABASES;
```

### to search for a database with specific name:
```sql
SHOW DATABASES LIKE 'dbname';
```

------------------------------------------
## DATATYPES:

### Numeric Data Types:
* INT => max characters: 11
* TINYINT => max characters: 4
* SMALLINT => max characters: 6
* MEDIUMINT => max characters: 9
* BIGINT => max characters: 20

* DECIAML
* FLOAT
* DOUBLE

* BOOLEAN

### Date & Time:
* DATE => YYYY-MM-DD
* DATETIME => YYYY-MM-DD HH:MI:SS
* TIMESTAMP => YYYY-MM-DD HH:MI:SS
* TIME => HH:MI:SS
* YEAR => YYYY | YY

### String:
* CHAR => Have fixed size, faster than VARCHAR
* VARCHAR => variable

* TEXT
* TINYTEXT
* MEDIUMTEXT
* LONGTEXT

* BLOB => Binary Large Object, used for storing images and files

* ENUM => Select only one from some values
* SET => Select one or more value from some values

## TABLES

### Create Table:
```sql
CREATE TABLE IF NOT EXISTS tableName(
	/*
	in this form: <fieldName> <dataType>(<size>),
	...
	 */
	test INT(11),
	test2 VARCHAR(255)
);
```

### To show table structure there are three ways:
```sql
DESCRIBE tableName; -- 1
SHOW COLUMNS FROM tableName; -- 2
SHOW FIELDS FROM tableName -- 3
```

### To show tables in the database:
```sql
SHOW TABLE STATUS;
```

### To get the code of creating a table:
```sql
SHOW CREATE TABLE tableName;
```

### To Delete a table:
```sql
DROP TABLE IF EXISTS tableName;
```

### To rename a table (2 ways):
```sql
RENAME TABLE oldName TO newName /*, ... */; -- 1
ALTER TABLE oldName RENAME newName; -- 2
```


### Change table storage engin:
```sql
ALTER TABLE tableName ENGIN = InnoDB;
```

## ALTER COMMAND
### add column:
```sql
ALTER TABLE tableName ADD /* <columnName> <dataType>(<size>)*/ testColumn VARCHAR(255) /* AFTER otherColumnName | FIRST */;
```

### delete column:
```sql
ALTER TABLE tableName DROP columnName;
```

### change column:
```sql
ALTER TABLE tableName CHANGE oldColumnName newColumnName /*<dataType>(<size>)*/ VARCHAR(255) /*... Other properties or change order*/
```

### modify table
```sql
ALTER TABLE tableName MODIFY columnName /*<newDataType>(<size>)*/ VARCHAR(255);
```

NOTE: MODIFY and CHANGE can be used together separated by commas

### change char-set of all columns in a table:
```sql
ALTER TABLE tableName CONVERT TO CHARACTER SET /*<new-char-set>*/ utf8;
```

## Constraints
constraints could be added either during the creation of the table or after creating it

1. NOT NULL
```sql
ALTER TABLE tableName ADD newColumnName NOT NULL;
ALTER TABLE tableName MODIFY newColumnName INT NOT NULL;
```

2. Unique
```sql
ALTER TABLE tableName ADD UNIQUE(columnName);
ALTER TABLE tableName ADD newColumnName VARCHAR(255) NOT NULL UNIQUE;
ALTER TABLE tableName ADD CONSTRAINT constraintName UNIQUE(columnName);
```
to delete the unique constraint:
```sql
ALTER TABLE tableName DROP INDEX columnName;
```

3. Primary Key: not null, unique and only one primary key is allowed in a table
```sql
CREATE TABLE IF NOT EXISTS tableName(id INT PRIMARY KEY);
CREATE TABLE IF NOT EXISTS tableName(
	id INT, 
	PRIMARY KEY(id)
);
ALTER TABLE tableName ADD PRIMARY KEY(columnName);
ALTER TABLE tableName ADD CONSTRAINT constraintName PRIMARY KEY(columnName);
```
to delete the primary key constraint:
```sql
ALTER TABLE tableName DROP PRIMARY KEY;
```

4. Foreign Key: relationship between two tables
```sql
CREATE TABLE clients(id INT PRIMARY KEY);
CREATE TABLE orders(
	id INT PRIMARY KEY,
	client_id INT NOT NULL,
	FOREIGN KEY(client_id) REFERENCES clients(id)
);
ALTER TABLE tableName 
ADD CONSTRAINT constraintName 
FOREIGN KEY(columnName) REFERENCES parentTableName(columnName)
ON DELETE CASCADE
ON UPDATE CASCADE;
```
tags that can be used with ON UPDATE and ON DELETE:
1. CASCADE
2. SET NULL
3. SET DEFAULT
4. NO ACTION
5. RESTRICT: prevent
to delete the primary key constraint:
```sql
ALTER TABLE tableName DROP FOREIGN KEY columnName;
```

## String Functions

1. LEFT(string, n): gets first left n characters
```sql
SELECT LEFT(columnName, 3) FROM tableName;
```

2. RIGHT(string, n): same as LEFT but from right.
3. MID(string, p, n): gets some characters from middle of text where p is the start position and n is the length
4. LENGTH(string): gets number of bytes used by a string
5. CHAR_LENGTH(string) = CHARACTER_LENGTH(columnName): gets number of characters in a string
```sql
SELECT columnName FROM tableName ORDER BY CHAR_LENGTH(columnName);
```

7. LCASE(string) = LOWER(columnName): lower all characters.
8. UCASE(string) = UPPER(columnName): upper all characters.
9. REPEATE(string, n): repeats a string n times.
10. REPLACE(string, from, to): replaces all occurences of 'from' to 'to'
11. REVERSE(string)
12. CONCAT(string, string, ...): concatenation
13. CONCAT_WS(separator, string, string, ...): concatenation with separator
14. INSERT(string, position, length, string_to_be_inserted)
15. TRIM(LEADING/TRAILING/BOTH remove_string FROM string): first two parameters is optional and defaults are both ' '
16. LTRIM(string): left trim
17. RTRIM(string): right trim
18. LPAD(string, length, padding_text): left padding, if padding_text is empty, strings whose length is less than the required length will return null 
19. RPAD(string, length, padding_text): right padding, same as LPAD.

## Math Functions

1. CEIL(number)
2. FLOOR(number)
3. ROUND(number, num_of_decimals)
4. MOD(dividend, divisor): modulus
5. TRUNCATE(number, num_of_decimals): does not round but deletes decimals after num_of_decimals count
```sql
SELECT TRUNCATE(2.4599, 2); -- returns 2.45
```

6. POW(number, power)

## Date & Time Functions

1. CURTIME()/CURRENT_TIME()/CURRENT_TIME: time in format HH:MM:SS
2. CURDATE()/CURRENT_DATE()/CURRENT_DATE: date in format YYYY-MM-DD
3. NOW()/CURRENT_TIMESTAMP()/CURRENT_TIMESTAMP: date & time in format YYYY-MM-DD HH:MM:SS
4. DAYNAME(date)
5. DAYOFMONTH(date)/DAY(date) 
6. DAYOFWEEK(date)
7. MONTH(date)  
8. MONTHNAME(date)
9. HOUR(datetime)
10. MINUTE(date)
11. DATEDIFF(date1, date2): date difference
12. LAST_DAY(date): date of the last day in a month
13. DATE_ADD(date, INTERVAL expression time_unit): add interval to specific date
```sql
SELECT DATE_ADD('2017-2-12', INTERVAL 10 DAY);
```

14. DATE_SUB(date, INTERVAL expression time_unit): subtract interval to specific date

## Comparison Functions

1. BETWEEN AND, NOT BETWEEN AND
```sql
SELECT * FROM tableName WHERE columnName BETWEEN 1 AND 10;
SELECT * FROM tableName WHERE columnName BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE();
```

2. IN, NOT IN
```sql
SELECT * FROM tableName WHERE columnName NOT IN (1, 3, 5);
```

3. LIKE, NOT LIKE
the % wildcard represents any number of characters, while _ represents a single character.
```sql
SELECT * FROM tableName WHERE columnName LIKE 'abd%'; --> matches 'abdullah' , 'abdelrahman', ..
```

## Comparison Operators

1. =
2. >, >=, <, <=
3. !=, <>: both means not equal

## Logical Operators

1. AND / &&
2. OR / ||
3. NOT / !
4. XOR 
## Distinct
When querying data from a table, you may get duplicate rows. To remove these duplicate rows, you use the DISTINCT clause in the SELECT statement.
```sql
SELECT DISTINCT state FROM customers;
```
### DISTINCT with multiple columns
the DISTINCT clause will use the combination of values in these columns to determine the uniqueness of the row in the result set.
```sql
SELECT DISTINCT
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state, 
    city;
```
## Flow Control Functions

1. IF(condition, true, false)
```sql
SELECT name, IF(grade > 50, 'Congratulations', 'Nice try!') AS result FROM students;
```

2. 
-->CASE
---> WHEN expression THEN result
---> WHEN expression2 THEN result2
---> ELSE result3
---> END
```sql
SELECT name,
CASE
	WHEN grade >= 97 THEN 'A+'
	WHEN grade >= 93 AND grade < 97 THEN 'A'
	ELSE 'F'
END
AS result
FROM students;
```

-->CASE variable
---> WHEN value THEN result
---> WHEN value2 THEN result2
---> ELSE result3
---> END
```sql
SELECT name,
CASE grade
	WHEN 97 THEN 'A+'
	WHEN 93 THEN 'A'
	ELSE 'Unknown'
END
AS result
FROM students;
```

# Joins
```sql
SELECT * FROM users, langs WHERE users.lang_id = langs.id;
```

1. INNER JOIN: selects only data that matches from both tables.
```sql
SELECT 
	u.name user_name,
	l.name language_name
FROM users u
INNER JOIN languages l
ON u.language_id = l.id;
```

2. LEFT JOIN: selects all data from left table and only data that matches from right table.
3. RIGHT JOIN: selects all data from right table and only data that matches from left table

## ORDER BY
```sql
SELECT * FROM tableName ORDER BY columnName, column2Name;
```

## GROUP BY:
 groups data with same value, it returns one row for each group. In other words, it reduces the number of rows in the result set.you often use the GROUP BY clause with aggregate functions such as SUM, AVG, MAX, MIN, and COUNT. The aggregate function that appears in the SELECT clause provides the information of each group.
```sql
SELECT * FROM tableName GROUP BY columnName;
```
If you use the GROUP BY clause in the SELECT statement without using aggregate functions, the GROUP BY clause behaves like the DISTINCT clause.

![alt text](https://www.mysqltutorial.org/wp-content/uploads/2021/07/MySQL-Group-By.svg "order of select clauses")
### Having
it is used in the SELECT statement to specify filter conditions for a group of rows or aggregates.
Notice that the HAVING clause applies a filter condition to each group of rows, while the WHERE clause applies the filter condition to each individual row.
## Stored Procedures
### create a stored procedure
```sql
DELIMITER //

CREATE PROCEDURE GetAllProducts()
BEGIN
	SELECT *  FROM products;
	-- code inside procedure
END //

DELIMITER ;
```

### to call a procedure
```sql
call GetAllProducts();
```

### create procedure with parameter called var of type integer
```sql
DELIMITER //
CREATE PROCEDURE GetAllProducts2(IN var INT)
BEGIN
	SELECT *  FROM products LIMIT var;
END //

DELIMITER ;
```














