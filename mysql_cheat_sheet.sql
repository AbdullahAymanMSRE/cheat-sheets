--* DATABASES
-- to create a database:
CREATE DATABASE IF NOT EXISTS dbName;

-- to delete a database:
DROP DATABASE IF EXISTS dbName;

-- to select specific database:
USE dbName;

-- to list extisting databases:
SHOW DATABASES;

-- to search for a database with specific name:
SHOW DATABASES LIKE 'dbname';

------------------------------------------
--* DATATYPES:

--=============
-- 1. Numeric Data Types:
---INT => max characters: 11
---TINYINT => max characters: 4
---SMALLINT => max characters: 6
---MEDIUMINT => max characters: 9
---BIGINT => max characters: 20

---DECIAML
---FLOAT
---DOUBLE

--BOOLEAN

--=============
-- 2. Date & Time:
---DATE => YYYY-MM-DD
---DATETIME => YYYY-MM-DD HH:MI:SS
---TIMESTAMP => YYYY-MM-DD HH:MI:SS
---TIME => HH:MI:SS
---YEAR => YYYY | YY

--=============
-- 3. String:
---CHAR => Have fixed size, faster than VARCHAR
---VARCHAR => variable

---TEXT
---TINYTEXT
---MEDIUMTEXT
---LONGTEXT

---BLOB => Binary Large Object, used for storing images and files

---ENUM => Select only one from some values
---SET => Select one or more value from some values
------------------------------------------
--* TABLES

--> Create Table:
CREATE TABLE IF NOT EXISTS tableName(
	/*
	in this form: <fieldName> <dataType>(<size>),
	...
	 */
	test INT(11),
	test2 VARCHAR(255)
);

--> To show table structure there are three ways:
DESCRIBE tableName; -- 1
SHOW COLUMNS FROM tableName; -- 2
SHOW FIELDS FROM tableName -- 3

--> To show tables in the database:
SHOW TABLE STATUS;

--> To get the code of creating a table:
SHOW CREATE TABLE tableName;

--> To Delete a table:
DROP TABLE IF EXISTS tableName;

--> To rename a table (2 ways):
RENAME TABLE oldName TO newName /*, ... */; -- 1
ALTER TABLE oldName RENAME newName; -- 2


--> Change table storage engin:
ALTER TABLE tableName ENGIN = InnoDB;

--* ALTER COMMAND
-- add column:
ALTER TABLE tableName ADD /* <columnName> <dataType>(<size>)*/ testColumn VARCHAR(255) /* AFTER otherColumnName | FIRST */;

-- delete column:
ALTER TABLE tableName DROP columnName;

-- change column:
ALTER TABLE tableName CHANGE oldColumnName newColumnName /*<dataType>(<size>)*/ VARCHAR(255) /*... Other properties or change order*/

-- modify table
ALTER TABLE tableName MODIFY columnName /*<newDataType>(<size>)*/ VARCHAR(255);

-- NOTE: MODIFY and CHANGE can be used together separated by commas

-- change char-set of all columns in a table:
ALTER TABLE tableName CONVERT TO CHARACTER SET /*<new-char-set>*/ utf8;

------------------------------------------
--* Constraints
-- constraints could be added either during the creation of the table or after creating it

-- 1. NOT NULL
ALTER TABLE tableName ADD newColumnName NOT NULL;
ALTER TABLE tableName MODIFY newColumnName INT NOT NULL;

-- 2. Unique
ALTER TABLE tableName ADD UNIQUE(columnName);
ALTER TABLE tableName ADD newColumnName VARCHAR(255) NOT NULL UNIQUE;
ALTER TABLE tableName ADD CONSTRAINT constraintName UNIQUE(columnName);
--> to delete the unique constraint:
ALTER TABLE tableName DROP INDEX columnName;

-- 3. Primary Key: not null, unique and only one primary key is allowed in a table
CREATE TABLE IF NOT EXISTS tableName(id INT PRIMARY KEY);
CREATE TABLE IF NOT EXISTS tableName(
	id INT, 
	PRIMARY KEY(id)
);
ALTER TABLE tableName ADD PRIMARY KEY(columnName);
ALTER TABLE tableName ADD CONSTRAINT constraintName PRIMARY KEY(columnName);
--> to delete the primary key constraint:
ALTER TABLE tableName DROP PRIMARY KEY;

-- 4. Foreign Key: relationship between two tables
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
--> tags that can be used with ON UPDATE and ON DELETE:
--- 1. CASCADE
--- 2. SET NULL
--- 3. NO ACTION
--- 4. RESTRICT: prevent
--> to delete the primary key constraint:
ALTER TABLE tableName DROP FOREIGN KEY columnName;

------------------------------------------
--* String Functions

-- 01. LEFT(string, n): gets first left n characters
SELECT LEFT(columnName, 3) FROM tableName;

-- 02. RIGHT(string, n): same as LEFT but from right.
-- 03. MID(string, p, n): gets some characters from middle of text where p is the start position and n is the length
-- 04. LENGTH(string): gets number of bytes used by a string
-- 05. CHAR_LENGTH(string) = CHARACTER_LENGTH(columnName): gets number of characters in a string
SELECT columnName FROM tableName ORDER BY CHAR_LENGTH(columnName);

-- 06. LCASE(string) = LOWER(columnName): lower all characters.
-- 07. UCASE(string) = UPPER(columnName): upper all characters.
-- 08. REPEATE(string, n): repeats a string n times.
-- 09. REPLACE(string, from, to): replaces all occurences of 'from' to 'to'
-- 10. REVERSE(string)
-- 11. CONCAT(string, string, ...): concatenation
-- 12. CONCAT_WS(separator, string, string, ...): concatenation with separator
-- 13. INSERT(string, position, length, string_to_be_inserted)
-- 14. TRIM(LEADING/TRAILING/BOTH remove_string FROM string): first two parameters is optional and defaults are both ' '
-- 15. LTRIM(string): left trim
-- 16. RTRIM(string): right trim
-- 17. LPAD(string, length, padding_text): left padding, if padding_text is empty, strings whose length is less than the required length will return null 
-- 18. RPAD(string, length, padding_text): right padding, same as LPAD

------------------------------------------
--* Math Functions

-- 1. CEIL(number)
-- 2. FLOOR(number)
-- 3. ROUND(number, num_of_decimals)
-- 4. MOD(dividend, divisor): modulus
-- 5. TRUNCATE(number, num_of_decimals): does not round but deletes decimals after num_of_decimals count
SELECT TRUNCATE(2.4599, 2); -- returns 2.45

-- 6. POW(number, power)

------------------------------------------
--* Date & Time Functions

-- 01. CURTIME()/CURRENT_TIME()/CURRENT_TIME: time in format HH:MM:SS
-- 02. CURDATE()/CURRENT_DATE()/CURRENT_DATE: date in format YYYY-MM-DD
-- 03. NOW()/CURRENT_TIMESTAMP()/CURRENT_TIMESTAMP: date & time in format YYYY-MM-DD HH:MM:SS
-- 04. DAYNAME(date)
-- 05. DAYOFMONTH(date)/DAY(date) 
-- 06. DAYOFWEEK(date)
-- 07. MONTH(date)  
-- 08. MONTHNAME(date)
-- 09. HOUR(datetime)
-- 10. MINUTE(date)
-- 11. DATEDIFF(date1, date2): date difference
-- 12. LAST_DAY(date): date of the last day in a month
-- 13. DATE_ADD(date, INTERVAL expression time_unit): add interval to specific date
SELECT DATE_ADD('2017-2-12', INTERVAL 10 DAY);

-- 14. DATE_SUB(date, INTERVAL expression time_unit): subtract interval to specific date

------------------------------------------
--* Comparison Functions

-- 1. BETWEEN AND, NOT BETWEEN AND
SELECT * FROM tableName WHERE columnName BETWEEN 1 AND 10;
SELECT * FROM tableName WHERE columnName BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE();

-- 2. IN, NOT IN
SELECT * FROM tableName WHERE columnName NOT IN (1, 3, 5);

-- 3. LIKE, NOT LIKE
---> the % wildcard represents any number of characters, while _ represents a single character.
SELECT * FROM tableName WHERE columnName LIKE 'abd%'; --> matches 'abdullah' , 'abdelrahman', ..

------------------------------------------
--* Comparison Operators

-- 1. =
-- 2. >, >=, <, <=
-- 3. !=, <>: both means not equal

------------------------------------------
--* Logical Operators

-- 1. AND / &&
-- 2. OR / ||
-- 3. NOT / !
-- 4. XOR 

------------------------------------------
--* Flow Control Functions

-- 1. IF(condition, true, false)
SELECT name, IF(grade > 50, 'Congratulations', 'Nice try!') AS result FROM students;

-- 2. 
-->CASE
---> WHEN expression THEN result
---> WHEN expression2 THEN result2
---> ELSE result3
---> END
SELECT name,
CASE
	WHEN grade >= 97 THEN 'A+'
	WHEN grade >= 93 AND grade < 97 THEN 'A'
	ELSE 'F'
END
AS result
FROM students;

-->CASE variable
---> WHEN value THEN result
---> WHEN value2 THEN result2
---> ELSE result3
---> END
SELECT name,
CASE grade
	WHEN 97 THEN 'A+'
	WHEN 93 THEN 'A'
	ELSE 'Unknown'
END
AS result
FROM students;

------------------------------------------
--* Joins
SELECT * FROM users, langs WHERE users.lang_id = langs.id;

-- 1. INNER JOIN: selects only data that matches from both tables.
SELECT 
	u.name user_name,
	l.name language_name
FROM users u
INNER JOIN languages l
ON u.language_id = l.id;

-- 2. LEFT JOIN: selects all data from left table and only data that matches from right table
-- 3. RIGHT JOIN: selects all data from right table and only data that matches from left table

------------------------------------------

--> ORDER BY
SELECT * FROM tableName ORDER BY columnName, column2Name;

--> GROUP BY: groups data with same value
SELECT * FROM tableName GROUP BY columnName;

















