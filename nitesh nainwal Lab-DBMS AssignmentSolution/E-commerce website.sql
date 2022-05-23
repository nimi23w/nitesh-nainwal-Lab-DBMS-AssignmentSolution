create database if not exists E_commerce;
use E_commerce;
/*/ Question-1 Create table /*/
CREATE TABLE IF NOT EXISTS Supplier (
    `SUPP_ID` INT PRIMARY KEY,
    `SUPP_NAME` VARCHAR(50) NOT NULL,
    `SUPP_CITY` VARCHAR(50) NOT NULL,
    `SUPP_PHONE` VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS Customer (
    `CUS_ID` INT PRIMARY KEY AUTO_INCREMENT,
    `CUS_NAME` VARCHAR(20) NOT NULL,
    `CUS_PHONE` VARCHAR(100) NOT NULL,
    `CUS_CITY` VARCHAR(30) NOT NULL,
    `CUS_GENDER` CHAR NOT NULL
);
CREATE TABLE IF NOT EXISTS Category (
    `CAT_ID` INT PRIMARY KEY,
    `CAT_NAME` VARCHAR(20) NOT NULL
);
CREATE TABLE IF NOT EXISTS Product (
    `PRO_ID` INT PRIMARY KEY,
    `PRO_NAME` VARCHAR(20) NOT NULL,
    `PRO_DESC` VARCHAR(60) NOT NULL,
    `CAT_ID` INT,
    FOREIGN KEY (`CAT_ID`)
        REFERENCES Category (`CAT_ID`)
);
CREATE TABLE IF NOT EXISTS Supplier_Pricing (
    `PRICING_ID` INT PRIMARY KEY,
    `PRO_ID` INT,
    `SUPP_ID` INT NOT NULL,
    `SUPP_PRICE` INT NOT NULL DEFAULT 0,
    FOREIGN KEY (`PRO_ID`)
        REFERENCES Product (`PRO_ID`),
    FOREIGN KEY (`SUPP_ID`)
        REFERENCES Supplier (`SUPP_ID`)
);
CREATE TABLE IF NOT EXISTS `Order` (
    `ORD_ID` INT PRIMARY KEY,
    `ORD_AMOUNT` INT,
    `ORD_DATE` DATE NOT NULL,
    `CUS_ID` INT,
    `PRICING_ID` INT,
    FOREIGN KEY (`PRICING_ID`)
        REFERENCES Supplier_Pricing (`PRICING_ID`),
    FOREIGN KEY (`CUS_ID`)
        REFERENCES Customer (`CUS_ID`)
);
CREATE TABLE IF NOT EXISTS `Rating` (
    `RAT_ID` INT PRIMARY KEY,
    `ORD_ID` INT,
    `RAT_RATSTARS` INT,
    FOREIGN KEY (`ORD_ID`)
        REFERENCES `Order` (`ORD_ID`)
);
/*/ Question-2 Insert values into Table /*/
insert into supplier values(1,'Rajesh Retails','Delhi','1234567890');
insert into supplier values(2,'Appario Ltd.','Mumbai','2589631470');
insert into supplier values(3,'Knome products','Banglore','9785462315');
insert into supplier values(4,'Bansal Retails','Kochi','8975463285');
insert into supplier values(5,'Mittal Ltd.'	,'Lucknow','7898456532');
SELECT 
    *
FROM
    supplier;
insert into customer values(1,'AAKASH','9999999999','DELHI','M');
insert into customer values(2,'AMAN','9785463215','NOIDA','M');
insert into customer values(3,'NEHA','9999999999','	MUMBAI','F');
insert into customer values(4,'MEGHA','9994562399','KOLKATA','F');
insert into customer values(5,'PULKIT','7895999999','LUCKNOW','M');
SELECT 
    *
FROM
    customer;
insert into category values(1,'BOOKS');
insert into category values(2,'GAMES');
insert into category values(3,'GROCERIES');
insert into category values(4,'ELECTRONICS');
insert into category values(5,'CLOTHES');
SELECT 
    *
FROM
    category;
insert into product values(1,'GTA V','Windows 7 and above with i5 processor and 8GB RAM',2);
insert into product values(2,'TSHIRT','SIZE-L with Black, Blue and White variations',5);
insert into product values(3,'ROG LAPTOP','Windows 10 with 15inch screen, i7 processor, 1TB SSD',4);
insert into product values(4,'OATS','Highly Nutritious from Nestle',3);
insert into product values(5,'HARRY POTTER','Best Collection of all time by J.K Rowling',1);
insert into product values(6,'MILK','1L Toned MIlk',3);
insert into product values(7,'Boat Earphones','1.5Meter long Dolby Atmos',4);
insert into product values(8,'Jeans','Stretchable Denim Jeans with various sizes and color',5);
insert into product values(9,'Project IGI','compatible with windows 7 and above',2);
insert into product values(10,'Hoodie','Black GUCCI for 13 yrs and above',5);
insert into product values(11,'Rich Dad Poor Dad','Written by RObert Kiyosaki',1);
insert into product values(12,'Train Your Brain','By Shireen Stephen',1);
SELECT 
    *
FROM
    product;
insert into supplier_pricing values(1,1,2,1500);
insert into supplier_pricing values(2,3,5,30000);
insert into supplier_pricing values(3,5,1,3000);
insert into supplier_pricing values(4,2,3,2500);
insert into supplier_pricing values(5,4,1,1000);
INSERT INTO supplier_pricing VALUES(6,12,2,780);
INSERT INTO supplier_pricing VALUES(7,12,4,789);
INSERT INTO supplier_pricing VALUES(8,3,1,31000);
INSERT INTO supplier_pricing VALUES(9,1,5,1450);
INSERT INTO supplier_pricing VALUES(10,4,2,999);
INSERT INTO supplier_pricing VALUES(11,7,3,549);
INSERT INTO supplier_pricing VALUES(12,7,4,529);
INSERT INTO supplier_pricing VALUES(13,6,2,105);
INSERT INTO supplier_pricing VALUES(14,6,1,99);
INSERT INTO supplier_pricing VALUES(15,2,5,2999);
INSERT INTO supplier_pricing VALUES(16,5,2,2999);
SELECT 
    *
FROM
    supplier_pricing;
insert into `order` values(101,1500,'2021-10-06',2,1);
insert into `order` values(102,1000,'2021-10-12',3,5);
insert into `order` values(103,30000,'2021-09-16',5,2);
insert into `order` values(104,1500,'2021-10-05',1,1);
insert into `order` values(105,3000,'2021-08-16',4,3);
insert into `order` values(106,1450,'2021-08-18',1,9);
insert into `order` values(107,789,'2021-09-01',3,7);
insert into `order` values(108,780,'2021-09-07',5,6);
insert into `order` values(109,3000,'2021-00-10',5,3);
insert into `order` values(110,2500,'2021-09-10',2,4);
insert into `order` values(111,1000,'2021-09-15',4,5);
insert into `order` values(112,789,'2021-09-16',4,7);
insert into `order` values(113,31000,'2021-09-16',1,8);
insert into `order` values(114,1000,'2021-09-16',3,5);
insert into `order` values(115,3000,'2021-09-16',5,3);
insert into `order` values(116,99,'2021-09-17',2,14);
SELECT 
    *
FROM
    `order`;
insert into rating values(1,101,4);
insert into rating values(2,102,3);
insert into rating values(3,103,1);
insert into rating values(4,104,2);
insert into rating values(5,105,4);
insert into rating values(6,106,3);
insert into rating values(7,107,4);
insert into rating values(8,108,4);
insert into rating values(9,109,3);
insert into rating values(10,110,5);
insert into rating values(11,111,3);
insert into rating values(12,112,4);
insert into rating values(13,113,2);
insert into rating values(14,114,1);
insert into rating values(15,115,1);
insert into rating values(16,116,0);
SELECT 
    *
FROM
    rating;
/*/ Question-3 Display the total number of customers based on gender who have placed orders of worth at least Rs.3000./*/
SELECT 
    CUS_GENDER, COUNT(CUS_GENDER)
FROM
    customer
WHERE
    CUS_ID IN (SELECT 
            CUS_ID
        FROM
            `order`
        GROUP BY CUS_ID
        HAVING SUM(ORD_AMOUNT) >= 3000)
GROUP BY CUS_GENDER
ORDER BY CUS_GENDER;
/*/ Question-4 /*/
SELECT 
    ORD_ID,
    ORD_AMOUNT,
    ORD_DATE,
    O.CUS_ID,
    O.PRICING_ID,
    PRO_NAME
FROM
    `order` O,
    customer C,
    SUPPLIER_PRICING SP,
    product P
WHERE
    O.CUS_ID = C.CUS_ID
        AND O.PRICING_ID = SP.PRICING_ID
        AND SP.PRO_ID = P.PRO_ID
        AND C.CUS_ID = 2;
/*/ Question-5 /*/
SELECT 
    *
FROM
    supplier
WHERE
    SUPP_ID IN (SELECT 
            SUPP_ID
        FROM
            supplier_pricing
        GROUP BY SUPP_ID
        HAVING COUNT(SUPP_ID) > 1);
/*/ Question-6 /*/
SELECT @@SESSION .sql_mode INTO @session_sql_mode;
set session sql_mode='';
SELECT 
    c.CAT_ID, CAT_NAME, PRO_NAME, MIN_PRICE
FROM
    (SELECT 
        CAT_ID, p.PRO_ID, MIN(SUPP_PRICE) AS MIN_PRICE
    FROM
        supplier_pricing sp, product p
    WHERE
        sp.PRO_ID = p.PRO_ID
    GROUP BY p.CAT_ID) AS CAT_MIN_PRICE,
    category c,
    product p
WHERE
    c.CAT_ID = p.CAT_ID
        AND p.PRO_ID = CAT_MIN_PRICE.PRO_ID;
set session sql_mode=@session_sql_mode;
/*/ Question-7 /*/
SELECT 
    p.PRO_ID, PRO_NAME
FROM
    product p,
    supplier_pricing sp,
    `order` o
WHERE
    p.PRO_ID = sp.PRO_ID
        AND sp.PRICING_ID = o.PRICING_ID
        AND o.ORD_DATE > '2021-10-05';
/*/ Question-8 /*/
SELECT 
    CUS_NAME, CUS_GENDER
FROM
    customer
WHERE
    CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';
/*/ Question-9 /*/
DELIMITER &&
CREATE PROCEDURE display_supplier_ratings()
BEGIN

select s.SUPP_ID, s.SUPP_NAME, avg(rat_ratstars),
case when avg(rat_ratstars) = 5 then 'EXCELLENT SERVICE'
	when avg(rat_ratstars) > 4 then 'GOOD SERVICE'
	when avg(rat_ratstars) > 2 then 'AVERAGE SERVICE'
else 'POOR SERVICE'
end as type_of_service
from supplier s, `order` o, supplier_pricing sp, rating r
where s.SUPP_ID = sp.SUPP_ID
and sp.PRICING_ID = o.PRICING_ID
and o.ORD_ID = r.ORD_ID
group by s.SUPP_ID order by s.SUPP_ID;
END &&
DELIMITER ;
call display_supplier_ratings();