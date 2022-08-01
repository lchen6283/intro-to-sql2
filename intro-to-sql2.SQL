-- Which resource did you choose to use?
Challenge #4

-- What are three things you learned during this lab? Joining 2 tables, updating tables, navigating information between 2 tables.

-- What is the average price of a hotel room that can be booked at Boutique Travel Travel Boutique ?  1366.6666666666666667
SELECT
    AVG(price)
FROM
    rooms
INNER JOIN
    hotels
ON
    hotels.id = rooms.hotel_id;

-- Which hotels have vacancies?  Hotelicopter, Hotel California, The Great Northern
SELECT DISTINCT
    hotels.name
FROM
    hotels
JOIN
    rooms
ON
    hotels.id = rooms.hotel_id
WHERE
    rooms.vacant IS TRUE;

--
\echo Query for hotels that allow pets

SELECT * FROM hotels FULL OUTER JOIN rooms ON hotels.id = rooms.hotel_id WHERE hotels.pets IS TRUE;
-- 

--
\echo Query for hotels that allow pets AND have vacancies

SELECT * FROM hotels INNER JOIN rooms ON hotels.id = rooms.hotel_id WHERE hotels.pets IS TRUE AND rooms.vacant IS TRUE;
-- 

--
\echo Query for the average room price for a hotel that allows pets

SELECT
    AVG(price)
FROM
    rooms
INNER JOIN
    hotels
ON
    hotels.id = rooms.hotel_id
WHERE
    hotels.pets IS TRUE;
-- 

--
\echo Query for the most expensive room

SELECT
    MAX(price)
FROM
    rooms
INNER JOIN
    hotels
ON
    hotels.id = rooms.hotel_id;
-- 

--
\echo Query for the average price of a room that has a name that includes queen in it (case insensitive)

SELECT
    AVG(price)
FROM
    rooms
INNER JOIN
    hotels
ON
    hotels.id = rooms.hotel_id;
WHERE
    rooms.name ILIKE '%queen%';
-- 

--
\echo Query for the most expensive room

SELECT
    MAX(price)
FROM
    rooms
INNER JOIN
    hotels
ON
    hotels.id = rooms.hotel_id;
-- 
--
\echo Update a room at Hotel California with a room number of 202 to go from vacant-true to vacant false. 

UPDATE rooms
SET rooms.vacant = FALSE 
FROM rooms INNER JOIN hotels ON  hotels.id = rooms.hotel_id
WHERE hotels.name = 'Hotel California' AND rooms.room_num = 202;  

-- 
--
\echo Update all the rooms with the hotel_id of 7 to now have a hotel_id that matches the Grand Budapest Hotel

UPDATE rooms
SET rooms.hotel_id = hotels.id
FROM rooms INNER JOIN hotels ON  hotels.id = rooms.hotel_id
WHERE rooms.hotel_id = 7 AND hotels.name = 'Grand Budapest Hotel'; 
-- 

--Show which hotels are associated with these rooms as well and update the three fields name to be guest_name, hotel_name and room_name.



ALTER TABLE guests RENAME name TO guest_name;
ALTER TABLE rooms RENAME name TO room_name;
ALTER TABLE hotels RENAME name TO hotel_name;



--Additionally, show stay dates, price, and state and order by guest name.


SELECT
    *
FROM
    rooms_guests
JOIN
    guests
ON
    guests.id = rooms_guests.guest_id
JOIN
    rooms
ON
    rooms.id = rooms_guests.room_id
JOIN
    hotels
ON
    hotels.id = rooms_guests.hotel_id
ORDER BY 
guest_name ASC;
