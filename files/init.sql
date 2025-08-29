CREATE DATABASE IF NOT EXISTS applications;
USE applications;
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);
INSERT INTO users (name) VALUES ('Alice'), ('Bob'), ('Charlie');