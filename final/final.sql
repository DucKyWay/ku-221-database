/*
1. Which supplier lives in Sumrong and supplies red color part? List Sname and Pname
2. Which part is supplied by all suppliers? List Pname
3. Which supplier has the second maximum status? List Sname and status
4. List Sname for the supplier who supplies the third maximum quantities
*/

/*
SELECT SNAME, CITY 
FROM SUPPLIER 
WHERE S_NO IN (SELECT S_NO 
               FROM SUPPLY
               GROUP BY S_NO
               HAVING SUM(QTY) = (SELECT MIN(A) FROM (SELECT SUM(QTY) A FROM SUPPLY GROUP BY S_NO) A));
               */

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- SET AUTOCOMMIT = 0;
-- START TRANSACTION;
-- SET time_zone = "+00:00";

CREATE TABLE `SUPPLIER` (
    `S_NO` varchar(40) NOT NULL,
    `SNAME` varchar(40),
    `CITY` varchar(40),
    `STATUS` INT(11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `SUPPLIER` (`S_NO`, `SNAME`, `CITY`, `STATUS`) VALUES 
('S1', 'David H', 'London', 100),
('S2', 'Wimut W', 'Rayong', 200),
('S3', 'Somchai S', 'Sumrong', 200),
('S4', 'Clinton B', 'Newyork', 100),
('S5', 'Chuan L', 'Bangkok', 10),
('S6', 'Chumlong S', 'Bangkok', 10),
('S7', 'Chavalit Y', 'Nakornpanom', 10),
('S8', 'Suchinda K', 'Helicity', 1);

CREATE TABLE `PART` (
    `P_NO` varchar(40) NOT NULL,
    `PNAME` VARCHAR(40),
    `COLOR` VARCHAR(40)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `PART` (`P_NO`, `PNAME`, `COLOR`) VALUES
('P1', 'NUT', 'RED'),
('P2', 'CASE', 'AMBER'),
('P3', 'SCREW', 'YELLOW'),
('P4', 'SPEEKER', 'BLACK'),
('P5', 'Gun', 'Gray'),
('P6', 'Meetball', 'Gray'),
('P7', 'Book', 'Blue'),
('P8', 'Deli', 'Buffy'),
('P9', 'Rubber', 'White'),
('P10', 'Outlet', 'Cream'),
('P11', 'Harddisk', 'Black');

CREATE TABLE `SUPPLY` (
    `S_NO` varchar(40) NOT NULL,
    `P_NO` varchar(40) NOT NULL,
    `QTY` INT(11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `SUPPLY` (`S_NO`, `P_NO`, `QTY`) VALUES
('S1', 'P3', 100),
('S1', 'P1', 900),
('S2', 'P7', 100),
('S2', 'P9', 200),
('S2', 'P1', 300),
('S3', 'P1', 300),
('S3', 'P4', 400),
('S3', 'P2', 500),
('S3', 'P10', 300),
('S4', 'P6', 800),
('S5', 'P6', 900),
('S6', 'P8', 400),
('S7', 'P3', 800),
('S8', 'P5', 100);