CREATE DATABASE IF NOT EXISTS jokesdb;
USE jokesdb;

CREATE TABLE IF NOT EXISTS jokes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  text VARCHAR(255) NOT NULL
);

INSERT INTO jokes (text) VALUES
('Why don’t scientists trust atoms? Because they make up everything!'),
('Why did the scarecrow win an award? Because he was outstanding in his field.'),
('What do you call fake spaghetti? An impasta.'),
('I would tell you a joke about construction, but I’m still working on it.');

