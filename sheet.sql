-- DATABASES
-- to create a database:
CREATE DATABASE IF NOT EXISTS dbName;

-- to delete a database:
DROP DATABASE IF EXISTS dbName;

-- to select specific database:
USE dbName;

------------------------------------------
-- DATATYPES:

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
