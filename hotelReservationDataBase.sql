CREATE SCHEMA bookingSchema;
USE bookingSchema;
CREATE TABLE hotels (
hotel_name_id VARCHAR (30) PRIMARY KEY,
foundation_year YEAR NOT NULL,
adress VARCHAR (80) NOT NULL,
is_active BOOLEAN NOT NULL
);

CREATE TABLE rooms (
room_id INTEGER PRIMARY KEY AUTO_INCREMENT,
hotel_name_id VARCHAR (30) NOT NULL,
room_numb INTEGER NOT NULL,
price INTEGER CHECK (price>0) NOT NULL,
comfort_level INTEGER CHECK (0<comfort_level<4) NOT NULL,
capacity INTEGER NOT NULL,
FOREIGN KEY (hotel_name_id) REFERENCES hotels (hotel_name_id)
);

CREATE TABLE users (
user_name_id VARCHAR(40) PRIMARY KEY,
user_email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE bookings (
room_id INTEGER ,
booker VARCHAR(40) NOT NULL,
start_reservation DATE NOT NULL,
end_reservation DATE NOT NULL,
FOREIGN KEY (room_id) REFERENCES rooms (room_id),
FOREIGN KEY(booker) REFERENCES users (user_name_id)
);

INSERT INTO hotels VALUES 
('Edelweiss', 1965, 'Lviv', TRUE),
('Atlas', 1938, 'Kyiv', FALSE),
('Jango', 1972, 'Zhovkva', TRUE);
UPDATE hotels SET foundation_year=1937 WHERE hotel_name_id='Edelweiss';
DELETE FROM hotels WHERE hotel_name_id='Jango';
INSERT INTO users VALUES ('John', 'rockstar@gmail.com'),
('Robert', 'robertDoms@gmail.com'),
('William', 'william@gmail.com'),
('Charlie', 'chaplin@gmail.com'),
('David', 'beckham@gmail.com'),
('James', 'bond@ukr.net'),
('Richard', 'gere@babla.ru'),
('Anna', 'taylor@yahoo.com'),
('Donald', 'trump@yahoo.com'),
('Anton', 'yarosh@yahoo.com');
SELECT * FROM users WHERE user_name_id LIKE 'A%';
INSERT INTO rooms(hotel_name_id, room_numb, price, comfort_level, capacity) VALUES  
('Edelweiss', 101, 2000, 2, 2),
('Edelweiss', 100, 1007, 1, 4),
('Edelweiss', 135, 1500, 2, 1),
('Edelweiss', 301, 1050, 2, 3),
('Edelweiss', 2667, 1040, 1, 4),
('Edelweiss', 5664, 1030, 1, 5),
('Edelweiss', 288, 1020, 2, 6),
('Atlas', 14, 1020, 3, 6),
('Atlas', 2898, 1020, 2, 6),
('Atlas', 287, 1020, 3, 6);
SELECT * FROM rooms ORDER BY price;
SELECT * FROM rooms WHERE hotel_name_id='Edelweiss' ORDER BY price;
SELECT DISTINCT hotel_name_id FROM rooms WHERE comfort_level=3;
SELECT room_numb, hotel_name_id FROM rooms WHERE comfort_level=1;
SELECT COUNT(room_id) AS 'Number', hotel_name_id FROM rooms GROUP BY hotel_name_id;
INSERT INTO bookings VALUES (1, 'John', '2020-11-14', '2020-11-17'),
(3, 'Anna', '2020-12-14', '2020-12-17'),
(4, 'Donald', '2020-11-14', '2020-11-17'),
(5, 'William', '2020-8-14', '2020-8-17'),
(5, 'David', '2020-11-14', '2020-11-17'),
(6, 'Anton', '2020-7-14', '2020-7-17'),
(6, 'John', '2020-11-14', '2020-11-17'),
(7, 'William', '2020-11-14', '2020-11-17'),
(8, 'Robert', '2020-1-14', '2020-1-17'),
(9, 'John', '2020-2-14', '2020-2-17');
SELECT booker, room_numb, CONCAT(start_reservation,'---',end_reservation) AS 'reservation period' 
FROM rooms JOIN bookings ON rooms.room_id=bookings.room_id;