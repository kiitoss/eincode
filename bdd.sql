-- Create BDD if doesn't exist
CREATE DATABASE IF NOT EXISTS eincode;
SELECT 'Changement de BDD : eincode' as Message;

-- Open BDD
USE eincode;

-- Disable foreign keys
SET FOREIGN_KEY_CHECKS=0;

-- Drop tables
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Language;
DROP TABLE IF EXISTS Doc;
DROP TABLE IF EXISTS Permission;
DROP TABLE IF EXISTS Message;

-- Enable foreign keys
SET FOREIGN_KEY_CHECKS=1;

-- 
CREATE TABLE User (
    id_user INT NOT NULL AUTO_INCREMENT,
    lastname VARCHAR(30),
    firstname VARCHAR(30),
    email VARCHAR(30) UNIQUE,
    salt VARCHAR(50),
    hash_password VARCHAR(70),
    folder_path VARCHAR(100),
    PRIMARY KEY (id_user)
);

-- 
CREATE TABLE Language (
    id_language INT NOT NULL,
    language VARCHAR(30),
    PRIMARY KEY (id_language)
);

-- 
CREATE TABLE Doc (
    id_doc INT NOT NULL AUTO_INCREMENT,
    id_creator INT,
    id_language INT,
    is_free_read BIT(1),
    is_free_write BIT(1),
    name VARCHAR(20),
    relative_path VARCHAR(150),
    PRIMARY KEY (id_doc),
    FOREIGN KEY (id_creator) REFERENCES User(id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_language) REFERENCES Language(id_language) ON DELETE CASCADE
    
);

-- 
CREATE TABLE Permission (
    id_user INT NOT NULL,
    id_doc INT NOT NULL,
    can_read BIT(1),
    can_write BIT(1),
    PRIMARY KEY (id_user, id_doc),
    FOREIGN KEY (id_user) REFERENCES User(id_user) ON DELETE CASCADE,
    FOREIGN KEY (id_doc) REFERENCES Doc(id_doc) ON DELETE CASCADE
);

-- 
CREATE TABLE Message (
    id_message INT NOT NULL AUTO_INCREMENT,
    id_doc INT,
    id_creator INT,
    date BIGINT,
    content VARCHAR(250),
    PRIMARY KEY (id_message),
    FOREIGN KEY (id_doc) REFERENCES Doc(id_doc) ON DELETE CASCADE,
    FOREIGN KEY (id_creator) REFERENCES User(id_user) ON DELETE CASCADE
);

-- Populate User

-- Populate Language
INSERT INTO Language (id_language, language)
VALUES
    (1, "txt"),
    (2, "css"),
    (3, "javascript"),
    (4, "bash"),
    (5, "c"),
    (6, "csharp"),
    (7, "cpp"),
    (9, "html"),
    (10, "idris"),
    (11, "java"),
    (12, "json"),
    (13, "latex"),
    (14, "less"),
    (17, "ocaml"),
    (18, "php"),
    (19, "prolog"),
    (20, "python"),
    (23, "sql");


-- Populate Doc


-- Populate Permission

-- Populate Message

-- Show tables
SELECT * FROM User;
SELECT * FROM Language;
SELECT * FROM Doc;
SELECT * FROM Permission;
SELECT * FROM Message;