-- Create a new table named "cities"
CREATE TABLE cities (
    name VARCHAR(50),     -- City name: text, max 50 characters
    country VARCHAR(50),  -- Country name: text, max 50 characters
    population INTEGER,   -- Number of people: whole number
    area INTEGER          -- Size of the city: whole number
);


-- Add new rows to the "cities" table
INSERT INTO cities (
    name,          -- City name
    country,       -- Country name
    population,    -- Number of people
    area           -- Size of the city
)
VALUES
    ('Tokyo', 'Japan', 37785000, 8231),       -- Tokyo city data
    ('Delhi', 'India', 32226000, 2344),       -- Delhi city data
    ('Shanghai', 'China', 24073000, 4333),    -- Shanghai city data
    ('Sao Paulo', 'Brazil', 23086000, 3649);  -- Sao Paulo city data


-- Show all data from the "cities" table
SELECT * FROM cities;


-- Show the name and country of all cities
SELECT name, country FROM cities;


-- Show each city name and its population density
SELECT name, population / area FROM cities;


-- Show each city name and the sum of population and area
SELECT name, population + area FROM cities;


-- Show each city name and the result of population multiplied by area
SELECT name, population * area FROM cities;


-- Calculate and show the population density of each city
SELECT name, population / area AS population_density
FROM cities;


-- Combine the city name and country into one text
SELECT name || country FROM cities;


-- Combine the city name and country and show it as "location"
SELECT name || ', ' || country AS location FROM cities;


-- Combine the city name and country using the CONCAT function
SELECT CONCAT(name, ', ', country) AS location FROM cities;



-- Combine the city name and country in uppercase and show it as "location"
SELECT
    CONCAT(UPPER(name), ', ', UPPER(country)) AS location
FROM
    cities;




-- Show the name and area of cities with an area greater than 4000
SELECT
    name, area
FROM cities
WHERE area > 4000;



-- Show the name and area of cities with an area equal to 8231
SELECT
    name, area
FROM cities
WHERE area = 8231;



-- Show the name and area of cities with an area not equal to 8231
SELECT
    name, area
FROM cities
WHERE area != 8231;




-- Show the name and area of cities with an area between 2000 and 4000
SELECT
    name, area
FROM
    cities
WHERE
    area BETWEEN 2000 AND 4000;




-- Show the name and area of cities named Delhi or Sao Paulo
SELECT
    name, area
FROM
    cities
WHERE
    name IN ('Delhi', 'Sao Paulo');





-- Show the name and area of cities except Delhi and Sao Paulo
SELECT
    name, area
FROM
    cities
WHERE
    name NOT IN ('Delhi', 'Sao Paulo');




-- Show Tokyo only if it is not Delhi or Sao Paulo
SELECT
    name, area
FROM
    cities
WHERE
    name NOT IN ('Delhi', 'Sao Paulo') AND
    name = 'Tokyo';



-- Show cities that are not Delhi or Sao Paulo, or cities named Tokyo
SELECT
    name, area
FROM
    cities
WHERE
    name NOT IN ('Delhi', 'Sao Paulo') OR
    name = 'Tokyo';




-- Show cities with a population density greater than 6000
SELECT
    name,
    population / area AS population_density
FROM
    cities
WHERE
    population / area > 6000;


-- Change the population of Tokyo to 39505000
UPDATE cities
SET population = 39505000
WHERE name = 'Tokyo';  -- only update the row where the name is Tokyo



-- Delete rows from the "cities" table
DELETE FROM cities
-- Only delete the row where the city name is 'Tokyo'
WHERE name = 'Tokyo';

-- Insert the record back.
INSERT INTO cities (name, country, population, area)
VALUES 
	('Tokyo', 'Japan', 39505000, 8231);


----------------------------------------------------------------------------------------


-- Create a table to store users
CREATE TABLE users (
	-- SERIAL: Postgres makes the ID by itself (1, 2, 3, ...)
	-- PRIMARY KEY: each ID is unique and finding rows by ID is fast
	id SERIAL PRIMARY KEY,
	-- VARCHAR(50): text up to 50 characters; longer text gives an error
	username VARCHAR(50)
);

-- Add 4 new users to the users table
-- We only give the username; Postgres makes the id by itself (SERIAL)
INSERT INTO users (username)
VALUES 
	('monohan93'),   -- gets id 1
	('pferrer'),     -- gets id 2
	('si93onis'),    -- gets id 3
	('99stroman');   -- gets id 4 (last row ends with ; not ,)


-- SELECT * FROM users;


-- Create a table to store photos
CREATE TABLE photos (
	id SERIAL PRIMARY KEY,
	-- VARCHAR(200): link to where the photo is stored (up to 200 characters)
	url VARCHAR(200),
	-- INTEGER, not SERIAL: we give this value ourselves
	-- REFERENCES users(id): the value must match an id in the users table(Foreign Key)
	user_id INTEGER REFERENCES users(id)
);


-- Add 1 new photo to the photos table
-- We do not give the id; Postgres makes it by itself (SERIAL)
INSERT INTO photos (url, user_id)
VALUES 
	-- url: a fake link to the photo
	-- 4: this photo belongs to the user with id 4 (foreign key)
	('http://one.jpg', 4);


-- SELECT * FROM photos;


-- Add 6 more photos to the photos table
-- We do not give the id; Postgres makes it by itself (SERIAL)
-- user_id (foreign key) shows which user each photo belongs to
INSERT INTO photos (url, user_id)
VALUES 
	('http://two.jpg', 1),   -- user 1
	('http://25.jpg', 1),    -- user 1
	('http://36.jpg', 1),    -- user 1 (now has 3 photos)
	('http://754.jpg', 2),   -- user 2 (has 1 photo)
	('http://35.jpg', 3),    -- user 3 (has 1 photo)
	('http://256.jpg', 4);   -- user 4 (now has 2 photos, with one.jpg)
	                         -- last row ends with ; not ,



-- Get all photos that belong to the user with id 4
-- (like a profile page that shows one user's photos)
SELECT * FROM photos   
WHERE user_id = 4;     


-- Get every photo together with the user who added it
-- (like a main feed page)
SELECT * FROM photos      -- * = get all columns from both tables
JOIN users                -- join the users table to photos
ON users.id = photos.user_id;  -- match each photo's user_id with the
                               -- id of the user it belongs to



-- Get every photo's link together with the name of the user who added it
-- (like a main feed page)
SELECT url, username      -- url comes from photos, username comes from users
FROM photos               -- start from the photos table
JOIN users                -- join the users table to photos
ON users.id = photos.user_id;  -- match each photo's user_id with the
                               -- id of the user it belongs to


---------------------------------------------------------------------------------------------

-- Delete (drop) the whole photos table and all the data in it
-- After this, "SELECT * FROM photos" gives an error: the table does not exist
DROP TABLE photos;


-- Get all rows and all columns from the photos table
-- Right after DROP TABLE photos, this gives an error:
-- "relation photos does not exist" (the table was deleted)
SELECT * FROM photos;


-- Create the photos table again (after dropping it)
CREATE TABLE photos (
	id SERIAL PRIMARY KEY,
	url VARCHAR(200),
	-- ON DELETE CASCADE: when a user is deleted,
	-- all photos of that user are deleted too
	user_id INTEGER REFERENCES users(id) ON DELETE CASCADE
);

-- Add 7 photos to the new photos table
INSERT INTO photos (url, user_id)
VALUES
	('http:/one.jpg', 4),   -- id 1, user 4
	('http:/two.jpg', 1),   -- id 2, user 1
	('http:/25.jpg', 1),    -- id 3, user 1
	('http:/36.jpg', 1),    -- id 4, user 1 (user 1 has 3 photos)
	('http:/754.jpg', 2),   -- id 5, user 2
	('http:/35.jpg', 3),    -- id 6, user 3
	('http:/256.jpg', 4);   -- id 7, user 4 (user 4 has 2 photos)



-- Delete the user with id 1 from the users table
-- Because of ON DELETE CASCADE, Postgres also deletes
-- all photos of this user (photos with id 2, 3 and 4)
DELETE FROM users
WHERE id = 1;   -- only the row where id is 1


-- SELECT * FROM users;

-- SELECT * FROM photos;



-- Delete (drop) the whole photos table and all the data in it
-- We do this so we can create it again with a different ON DELETE option
DROP TABLE photos;


-- Create the photos table again (after dropping it)
CREATE TABLE photos (
	id SERIAL PRIMARY KEY,
	url VARCHAR(200),
	-- ON DELETE SET NULL: when a user is deleted,
	-- the photos of that user stay, but their user_id becomes NULL
	user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
);

-- Add 7 photos to the photos table
INSERT INTO photos (url, user_id)
VALUES
	('http:/one.jpg', 4),   -- id 1, user 4
	('http:/754.jpg', 2),   -- id 5, user 2
	('http:/35.jpg', 3),    -- id 6, user 3
	('http:/256.jpg', 4);   -- id 7, user 4 (user 4 has 2 photos)


-- Delete the user with id 4 from the users table
-- Because of ON DELETE SET NULL, the photos of this user are not deleted;
-- their user_id becomes NULL (no user)
DELETE FROM users
WHERE id = 4;   -- only the row where id is 4


-- SELECT * FROM users;

-- SELECT * FROM photos;










