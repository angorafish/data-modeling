DROP DATABASE IF EXISTS soccer_league;
CREATE DATABASE soccer_league;
\c soccer_league

CREATE TABLE Teams (
    team_id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Players (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    team_id INT REFERENCES Teams(team_id)
);

CREATE TABLE Referees (
referee_id SERIAL PRIMARY KEY,
name VARCHAR(100)
);

CREATE TABLE Matches (
    match_id SERIAL PRIMARY KEY,
    team1_id INT REFERENCES Teams(team_id),
    team2_id INT REFERENCES Teams(team_id),
    referee_id INT REFERENCES Referees(referee_id),
    match_date DATE
);

CREATE TABLE Goals (
    goal_id SERIAL PRIMARY KEY,
    match_id INT REFERENCES Matches(match_id),
    player_id INT REFERENCES Players(player_id),
    time TIMESTAMP
);

INSERT INTO Teams (name) VALUES
('FC Barcelona'),
('Real Madrid'),
('Manchester United'),
('Chelsea FC');

INSERT INTO Players (name, team_id) VALUES
('Lionel Messi', 1),
('Gerard Pique', 1),
('Karim Benzema', 2),
('Sergio Ramos', 2),
('Bruno Fernandes', 3),
('Marcus Rashford', 3),
('Mason Mount', 4),
('Golo Kante', 4);

INSERT INTO Referees (name) VALUES
('Pierluigi Collina'),
('Howard Webb'),
('Mark Clattenburg');

INSERT INTO Matches (team1_id, team2_id, referee_id, match_date) VALUES
(1, 2, 1, '2023-12-01'),
(3, 4, 2, '2023-12-02');

INSERT INTO Goals (match_id, player_id, time) VALUES
(1, 1, '2023-12-01 14:35:00'),
(1, 3, '2023-12-01 14:50:00'),
(2, 5, '2023-12-02 15:20:00');