DROP DATABASE IF EXISTS air_traffic;
CREATE DATABASE air_traffic;
\c air_traffic

CREATE TYPE airline AS ENUM ('United', 'British Airways', 'Delta', 'TUI Fly Belgium', 'Air China', 'American Airlines', 'Avianca Brasil');

CREATE TABLE Countries (
  country_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE Cities (
  city_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INT REFERENCES Countries(country_id)
);

CREATE TABLE Airlines (
  airline_id SERIAL PRIMARY KEY,
  name airline
);

CREATE TABLE Tickets (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL,
  departure TIMESTAMP WITH TIME ZONE NOT NULL,
  arrival TIMESTAMP WITH TIME ZONE NOT NULL,
  airline_id INT REFERENCES Airlines(airline_id),
  from_city_id INT REFERENCES Cities(city_id),
  to_city_id INT REFERENCES Cities(city_id)
);

INSERT INTO Countries (name) VALUES 
('United States'), 
('Japan'), 
('United Kingdom'), 
('Mexico'), 
('France'), 
('Morocco'), 
('UAE'), 
('China'), 
('Brazil'), 
('Chile');

INSERT INTO Cities (name, country_id) VALUES
('Washington DC', 1),
('Tokyo', 2),
('London', 3),
('Seattle', 1),
('Los Angeles', 1),
('Las Vegas', 1),
('Mexico City', 4),
('Paris', 5),
('Casablanca', 6),
('Dubai', 7),
('Bejing', 8),
('New York', 1),
('Charlotte', 1),
('Cedar Rapids', 1),
('Chicago', 1),
('New Orleans', 1),
('Sao Paolo', 9),
('Santiago', 10);

INSERT INTO Airlines (name) VALUES 
('United'), 
('British Airways'), 
('Delta'), 
('TUI Fly Belgium'), 
('Air China'), 
('American Airlines'), 
('Avianca Brasil');


INSERT INTO tickets
  (first_name, last_name, seat, departure, arrival, airline_id, from_city_id, to_city_id)
VALUES
  ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00'::timestamp with time zone, '2018-04-08 12:00:00'::timestamp with time zone, 1, 1, 4),
  ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00'::timestamp with time zone, '2018-12-19 16:15:00'::timestamp with time zone, 2, 2, 3),
  ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00'::timestamp with time zone, '2018-01-02 08:03:00'::timestamp with time zone, 3, 5, 6),
  ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00'::timestamp with time zone, '2018-04-15 21:00:00'::timestamp with time zone, 3, 4, 7),
  ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00'::timestamp with time zone, '2018-08-01 21:50:00'::timestamp with time zone, 4, 8, 9),
  ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00'::timestamp with time zone, '2018-10-31 12:55:00'::timestamp with time zone, 5, 10, 11),
  ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00'::timestamp with time zone, '2019-02-06 07:47:00'::timestamp with time zone, 1, 12, 13),
  ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00'::timestamp with time zone, '2018-12-22 15:56:00'::timestamp with time zone, 6, 14, 15),
  ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00'::timestamp with time zone, '2019-02-06 19:18:00'::timestamp with time zone, 6, 13, 16),
  ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00'::timestamp with time zone, '2019-01-20 22:45:00'::timestamp with time zone, 7, 17, 18);