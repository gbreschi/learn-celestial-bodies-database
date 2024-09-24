## init 
CREATE DATABASE universe;
\c universe



## Create Tables

CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,       -- Auto-incrementing primary key
    name VARCHAR(255) UNIQUE NOT NULL,  -- Unique and non-nullable name
    num_of_stars INT NOT NULL,          -- INT column for number of stars
    distance_from_earth NUMERIC,        -- NUMERIC column for distance from Earth
    is_active BOOLEAN NOT NULL          -- Boolean column for galaxy status (active/inactive)
);

CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,         -- Auto-incrementing primary key
    galaxy_id INT REFERENCES galaxy(galaxy_id) NOT NULL,  -- Foreign key references galaxy
    name VARCHAR(255) UNIQUE NOT NULL,  -- Unique and non-nullable name
    size NUMERIC NOT NULL,              -- NUMERIC column for star size
    is_burning BOOLEAN NOT NULL         -- Boolean column for burning status
);

CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,       -- Auto-incrementing primary key
    star_id INT REFERENCES star(star_id) NOT NULL,  -- Foreign key references star
    name VARCHAR(255) UNIQUE NOT NULL,  -- Unique and non-nullable name
    distance_from_star NUMERIC NOT NULL, -- NUMERIC column for distance from the star
    diameter INT NOT NULL,              -- INT column for planet diameter
    has_life BOOLEAN NOT NULL           -- Boolean column for life presence
);

CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,         -- Auto-incrementing primary key
    planet_id INT REFERENCES planet(planet_id) NOT NULL,  -- Foreign key references planet
    name VARCHAR(255) UNIQUE NOT NULL,  -- Unique and non-nullable name
    orbital_period NUMERIC NOT NULL,    -- NUMERIC column for orbital period
    diameter INT NOT NULL               -- INT column for moon diameter
);

CREATE TABLE satellite (
    satellite_id SERIAL PRIMARY KEY,    -- Auto-incrementing primary key
    name VARCHAR(255) UNIQUE NOT NULL,  -- Unique and non-nullable name
    purpose TEXT NOT NULL,              -- TEXT column for satellite purpose
    launch_date DATE,                   -- Date column for launch date
    is_active BOOLEAN NOT NULL          -- Boolean column for satellite status (active/inactive)
);


## Insert Data into Tables

INSERT INTO galaxy (name, num_of_stars, distance_from_earth, is_active) VALUES
('Milky Way', 10000000, 0, TRUE),
('Andromeda', 100000000, 25000, TRUE),
('Sombrero', 8000000, 300000, TRUE),
('Whirlpool', 1000000, 230000, FALSE),
('Cartwheel', 5000000, 500000, TRUE),
('Pinwheel', 10000000, 210000, FALSE);

INSERT INTO star (galaxy_id, name, size, is_burning) VALUES
(1, 'Sun', 1.0, TRUE),
(1, 'Proxima Centauri', 0.154, TRUE),
(2, 'Sirius', 2.02, TRUE),
(2, 'Betelgeuse', 8.0, TRUE),
(3, 'Rigel', 21.0, FALSE),
(3, 'Vega', 2.3, TRUE);


INSERT INTO planet (star_id, name, distance_from_star, diameter, has_life) VALUES
(7, 'Earth', 1.0, 12742, TRUE),
(7, 'Mars', 1.524, 6779, FALSE),
(7, 'Venus', 0.723, 12104, FALSE),
(8, 'Proxima b', 0.0485, 11445, FALSE),
(8, 'Proxima c', 1.5, 16000, FALSE),
(9, 'Sirius b', 2.5, 12000, FALSE),
(9, 'Betelgeuse b', 0.9, 14000, FALSE),
(10, 'Betelgeuse c', 1.2, 15000, FALSE),
(10, 'Rigel b', 0.8, 13000, FALSE),
(11, 'Rigel c', 1.3, 16000, FALSE),
(12, 'Vega b', 1.1, 14000, FALSE),
(12, 'Vega c', 1.6, 15000, FALSE);


INSERT INTO moon (planet_id, name, orbital_period, diameter) VALUES
(25, 'MoMoon', 29.3, 3474),
(32, 'PhobosCobos', 0.33, 23),
(25, 'Moon', 27.3, 3474),
(32, 'Phobos', 0.3, 22),
(32, 'Deimos', 1.3, 12),
(33, 'Aphrodite Terra', 243, 3500),
(34, 'Proxima b Moon 1', 25, 3000),
(34, 'Proxima b Moon 2', 26, 2900),
(34, 'Proxima c Moon 1', 40, 3100),
(34, 'Sirius b Moon 1', 50, 3400),
(34, 'Betelgeuse b Moon 1', 20, 3200),
(34, 'Betelgeuse b Moon 2', 18, 3300),
(34, 'Betelgeuse c Moon 1', 30, 3600),
(34, 'Rigel b Moon 1', 28, 3700),
(34, 'Rigel b Moon 2', 27, 3800),
(27, 'Rigel c Moon 1', 31, 3900),
(27, 'Vega b Moon 1', 22, 4000),
(27, 'Vega b Moon 2', 24, 4100),
(27, 'Vega c Moon 1', 26, 4200),
(27, 'Vega c Moon 2', 27, 4300),
(27, 'Vega c Moon 3', 28, 4400);


INSERT INTO satellite (name, purpose, launch_date, is_active) VALUES
('Hubble Space Telescope', 'Observation', '1990-04-24', TRUE),
('International Space Station', 'Research', '1998-11-20', TRUE),
('Voyager 1', 'Exploration', '1977-09-05', FALSE);


## Verify Data

Insert Data into Tables

SELECT * FROM galaxy;
SELECT * FROM star;
SELECT * FROM planet;
SELECT * FROM moon;
SELECT * FROM satellite;


## deleting to restart

DROP TABLE IF EXISTS moon;
DROP DATABASE IF EXISTS universe;
