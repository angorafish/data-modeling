DROP DATABASE IF EXISTS craigslist;
CREATE DATABASE craigslist;
\c craigslist

CREATE TABLE Regions (
    region_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    region_id INT REFERENCES Regions(region_id)
);

CREATE TABLE Posts (
    post_id SERIAL PRIMARY KEY,
    title VARCHAR(100),
    text TEXT,
    user_id INT REFERENCES Users(user_id),
    region_id INT REFERENCES Regions(region_id)
);

CREATE TABLE Categories (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE PostCategories (
    post_id INT REFERENCES Posts(post_id),
    category_id INT REFERENCES Categories(category_id),
    PRIMARY KEY (post_id, category_id)
);

INSERT INTO Regions (name) VALUES
('San Francisco'),
('Atlanta'),
('Seattle'),
('New York');

INSERT INTO Users (name, email, region_id) VALUES
('John Doe', 'john.doe@example.com', 1),
('Jane Smith', 'jane.smith@example.com', 2),
('Alice Johnson', 'alice.johnson@example.com', 3),
('Bob Brown', 'bob.brown@example.com' 4);

INSERT INTO Posts (title, text, user_id, region_id) VALUES
('Vintage Couch', 'Great condition, barely used.', 1, 1),
('Mountain Bike', 'Ready for any trail.', 2, 2),
('Concert Tickets', 'Selling four tickets to the show.', 3, 3),
('Coffee Table', 'Modern aesthetic, glass top.', 4, 4);

INSERT INTO Categories (name) VALUES
('Furniture'),
('Sports'),
('Tickets'),
('Household');

INSERT INTO PostCategories (post_id, category_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);