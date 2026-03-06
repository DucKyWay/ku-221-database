/*
1. Which supplier lives in Sumrong and supplies red color part? List sname and pname
2. Which part is supplied by all suppliers? List pname
3. Which supplier has the second maximum status? List sname and status
4. List sname for the supplier who supplies the third maximum quantities
5. แสดงรายการ sname และ city ของ supplier ที่อาศัยอยู่ใน rayong และจำหน่าย red part
6. แสดงรายการ sname ของ supplier ที่มี qty มากสุดเป็นอันดับสอง
7. แสดงรายการ pname ของ part ที่ถูกจำหน่ายโดยมากกว่าหนึ่ง supplier
8. แสดงรายการ color ของ part ที่มีจำนวน supplier สูงสุด
9. แสดงรายการ s_no และ sname ของ supplier ที่อยู่ใน bangkok และจำหน่าย gray part
*/

/*
1.)
SELECT * FROM supplier
	JOIN supply USING (s_no)
	JOIN part USING (p_no)
	WHERE city = 'Sumrong' AND color = 'RED';

2.)
SELECT pname FROM part WHERE p_no IN (
	SELECT p_no
	FROM supply
	GROUP BY p_no
	HAVING COUNT(DISTINCT s_no) = (SELECT COUNT(*) FROM supplier)
)

3.)
SELECT sname, status
FROM supplier
WHERE status = (
	SELECT MAX(status)
	FROM supplier
	WHERE status < (
		SELECT MAX(status) FROM supplier
	)
)

4.)
SELECT sname FROM supplier
JOIN supply on supplier.s_no = supply.s_no
GROUP BY sname
ORDER BY SUM(qty) DESC
LIMIT 1 OFFSET 2
*/

/*
SELECT sname, city
FROM supplier
WHERE s_no IN (SELECT s_no
               FROM supply
               GROUP BY s_no
               HAVING SUM(qty) = (SELECT MIN(A) FROM (SELECT SUM(qty) A FROM supply GROUP BY s_no) A));
               */

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- SET AUTOCOMMIT = 0;
-- START TRANSACTION;
-- SET time_zone = "+00:00";

CREATE TABLE `supplier` (
    `s_no` varchar(40) NOT NULL,
    `sname` varchar(40),
    `city` varchar(40),
    `status` INT(11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `supplier` (`s_no`, `sname`, `city`, `status`) VALUES
('S1', 'David H', 'London', 100),
('S2', 'Wimut W', 'Rayong', 200),
('S3', 'Somchai S', 'Sumrong', 200),
('S4', 'Clinton B', 'Newyork', 100),
('S5', 'Chuan L', 'Bangkok', 10),
('S6', 'Chumlong S', 'Bangkok', 10),
('S7', 'Chavalit Y', 'Nakornpanom', 10),
('S8', 'Suchinda K', 'Helicity', 1);

CREATE TABLE `part` (
    `p_no` varchar(40) NOT NULL,
    `pname` VARCHAR(40),
    `color` VARCHAR(40)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `part` (`p_no`, `pname`, `color`) VALUES
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

CREATE TABLE `supply` (
    `s_no` varchar(40) NOT NULL,
    `p_no` varchar(40) NOT NULL,
    `qty` INT(11)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `supply` (`s_no`, `p_no`, `qty`) VALUES
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

ALTER TABLE `supplier`
    ADD PRIMARY KEY (`s_no`);
ALTER TABLE `part`
    ADD PRIMARY KEY (`p_no`);
ALTER TABLE `supply`
    ADD FOREIGN KEY (`s_no`) REFERENCES supplier (`s_no`),
    ADD FOREIGN KEY (`p_no`) REFERENCES part (`p_no`);
