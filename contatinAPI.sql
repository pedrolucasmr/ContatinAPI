DROP DATABASE IF EXISTS contatinAPI;
CREATE DATABASE contatinAPI;
CREATE TABLE emails(id INT PRIMARY KEY AUTO_INCREMENT, address VARCHAR(255) UNIQUE, isComercial BOOL DEFAULT(FALSE),heading VARCHAR(255) DEFAULT("EMAIL"), subheading VARCHAR(255) DEFAULT(NULL));
CREATE TABLE telephones(id INT PRIMARY KEY AUTO_INCREMENT,numbers VARCHAR(255) NOT NULL,DDI char(3) NOT NULL, DDD char(3) NOT NULL,heading VARCHAR(255) NOT NULL DEFAULT("TELEFONE"),subheading VARCHAR(255) DEFAULT(NULL));
CREATE TABLE contacts(id INT PRIMARY KEY AUTO_INCREMENT, firstName VARCHAR(255) NOT NULL, lastName VARCHAR(255) DEFAULT(NULL),nickname VARCHAR(255) DEFAULT(NULL), company VARCHAR(255) DEFAULT(NULL), isComercial BOOL DEFAULT(FALSE), createdAT DATETIME DEFAULT(NOW()),userId INT NOT NULL, FOREIGN KEY(userId) REFERENCES users(id));
CREATE TABLE contactLists(id INT PRIMARY KEY AUTO_INCREMENT,createdAt DATETIME DEFAULT(NOW()),userId INT NOT NULL, FOREIGN KEY(userId) REFERENCES users(id));
CREATE TABLE users(id INT PRIMARY KEY AUTO_INCREMENT,createdAT DATETIME DEFAULT(NOW()));
