drop database Mini_Store;
create database Mini_Store;
  use Mini_Store;

create table `customers` (
  `customer_id` int not null , 
  `name` varchar(25) not null, 
  `address` varchar(30) not null
); 
alter table 
  `customers` 
add 
  primary key `customers_customer_id_primary`(`customer_id`); 

create table `contacts` (
    `customer_id` int not null, 
    `phone_num` varchar(25) not null, 
    `email` varchar(25) not null
  ); 

create table `items` (
    `item_id` int not null, 
    `customer_id` int not null, 
    `name` varchar(25) not null, 
    `description` varchar(50) not null, 
    `price` decimal(8, 2) not null, 
    `item_type_id` int not null,
    constraint `customers_customer_id_foreign` foreign key (`customer_id`) references `customers` (`customer_id`)
  ); 
alter table 
  `items` 
add 
  primary key `items_item_id_primary`(`item_id`); 

create table `item_type` (
    `item_type_id` int not null, 
    `item_type_name` varchar(25) not null
  ); 
alter table 
  `item_type` 
add 
  primary key `item_type_item_type_id_primary`(`item_type_id`); 

create table `comments` (
    `item_id` int not null, 
    `customer_id` int not null, 
    `comment` varchar(50) not null,
    constraint `comments_customer_id_foreign` foreign key (`customer_id`) references `customers` (`customer_id`)
  ); 
alter table 
  `contacts` 
add 
  constraint `contacts_customer_id_foreign` foreign key (`customer_id`) references `customers` (`customer_id`); 
alter table 
  `items` 
add 
  constraint `items_item_type_id_foreign` foreign key (`item_type_id`) references `item_type` (`item_type_id`); 
alter table 
  `comments` 
add 
  constraint `comments_item_id_foreign` foreign key (`item_id`) references `items` (`item_id`);




INSERT INTO customers (customer_id, name, address)
VALUES ('1', 'ahmed', '305 - 14th Ave. S. Suite 3B');

INSERT INTO customers (customer_id, name, address)
VALUES ('2', 'khaled', 'Keskuskatu 45');

INSERT INTO customers (customer_id, name, address)
VALUES ('3', 'khoudier', 'ul. Filtrowa 68');

INSERT INTO customers (customer_id, name, address)
VALUES ('4', 'ali', 'Keskuskatu 30');

INSERT INTO customers (customer_id, name, address)
VALUES ('5', 'ziad', 'Skagen 21');

SELECT * FROM customers;


INSERT INTO contacts (customer_id, phone_num, email)
VALUES ('1', '01155887744', 'ahmed5445@yahoo.com');

INSERT INTO contacts (customer_id, phone_num, email)
VALUES ('1', '01098877445', 'ahmed8787@gmail.com');

INSERT INTO contacts (customer_id, phone_num, email)
VALUES ('2', '01166332214', 'khaled544@yahoo.com');

INSERT INTO contacts (customer_id, phone_num, email)
VALUES ('3', '01155447788', 'khoudier2249@yahoo.com');

INSERT INTO contacts (customer_id, phone_num, email)
VALUES ('4', '01195859797', 'ali8888@yahoo.ccom');

SELECT * FROM contacts;


INSERT INTO item_type (item_type_id, item_type_name)
VALUES ('1', 'phones');

INSERT INTO item_type (item_type_id, item_type_name)
VALUES ('2', 'Chargers');

INSERT INTO item_type (item_type_id, item_type_name)
VALUES ('3', 'Accessories');

INSERT INTO item_type (item_type_id, item_type_name)
VALUES ('4', 'Headphones');

INSERT INTO item_type (item_type_id, item_type_name)
VALUES ('5', 'Charge cards');

SELECT * FROM item_type;

INSERT INTO items (item_id, customer_id, name, description, price, item_type_id)                
VALUES ('1', '1', 'iphone8+', 'black 128g', '8000', '1' );

INSERT INTO items (item_id, customer_id, name, description, price, item_type_id)
VALUES ('2', '2', 'charger', '5W for iphone7+', '100', '2');

INSERT INTO items (item_id, customer_id, name, description, price, item_type_id)
VALUES ('3', '3', 'cover', 'black for note9', '50', '3');

INSERT INTO items (item_id, customer_id, name, description, price, item_type_id)
VALUES ('4', '4', 'headphone', 'black for iphone6s+', '60', '4');

INSERT INTO items (item_id, customer_id, name, description, price, item_type_id)
VALUES ('5', '5', 'Charge card', 'vodafone', '20', '5');

SELECT * FROM items;


INSERT INTO comments (item_id, customer_id, comment)
VALUES ('1', '1', 'great!');

INSERT INTO comments (item_id, customer_id, comment)
VALUES ('2', '2', 'bad and charge slowly');

INSERT INTO comments (item_id, customer_id, comment)
VALUES ('3', '3', 'good');

INSERT INTO comments (item_id, customer_id, comment)
VALUES ('4', '4', 'it has a clear sound');

SELECT * FROM comments;



SELECT COUNT(*) FROM customers;

SELECT MAX(price) FROM items;

SELECT MIN(price) FROM items;

SELECT AVG(price) FROM items;

SELECT SUM(price) FROM items;

SELECT name, SQRT(price) FROM items;

SELECT * FROM items ORDER BY RAND();

SELECT CONCAT(item_type_id, item_type_name) FROM item_type;

SELECT SPACE(6);

SELECT STRCMP('ahmed', 'ziad');

SELECT UPPER('ahmed');

SELECT LOWER('AHMED');

SELECT REVERSE('ahmed');

SELECT LEFT('khaled', 4);

SELECT RTRIM('ali   ');

SELECT LTRIM('  barbar');

SELECT FIND_IN_SET('b','a,b,c,d');

SELECT MOD(29,3);

SELECT COT(1);

SELECT CEILING(4.46);


 


 SELECT * 
   FROM items 
   WHERE item_id IN (SELECT item_id 
         FROM items 
         WHERE price > 40);



 UPDATE items
   SET price = price * 0.25
   WHERE item_type_id IN (SELECT item_type_id FROM item_type
      WHERE item_type_id >= 2 );  


 DELETE FROM items
   WHERE item_type_id IN (SELECT item_type_id FROM item_type
      WHERE item_type_id > 4 );






 SELECT COUNT(item_id)
  FROM items;



  SELECT name, SUM(price)
   FROM items
    GROUP BY name;






SELECT item_type_name ,price 
FROM item_type
INNER JOIN items ON item_type.item_type_id = items.item_id;


SELECT name ,item_type_name
FROM items
LEFT JOIN item_type ON items.item_id = item_type.item_type_id;



SELECT name ,item_type_name
FROM items
RIGHT JOIN item_type ON items.item_id = item_type.item_type_id;


SELECT * FROM items 
LEFT JOIN item_type ON items.item_id = item_type.item_type_id
UNION
SELECT * FROM items
RIGHT JOIN item_type ON items.item_id = item_type.item_type_id;



SELECT  name, address, phone_num, email
   FROM customers, contacts;





   UPDATE customers
SET name = 'adham'
WHERE customer_id = 5;


UPDATE customers
SET address = 'Pune'
WHERE customer_id = 2;

UPDATE item_type
SET item_type_name = 'cards'
WHERE item_type_id= 5;

UPDATE items
SET price = '50'
WHERE item_id = 4;

UPDATE items
SET price = '9000'
WHERE item_id = 1;






DELETE FROM contacts
WHERE phone_num = '01155887744';

DELETE FROM contacts
WHERE phone_num = '01098877445';

DELETE FROM contacts
WHERE phone_num = '01166332214';

DELETE FROM contacts
WHERE phone_num = '01155447788';

DELETE FROM contacts
WHERE email = 'ali8888@yahoo.ccom';
