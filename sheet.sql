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

















