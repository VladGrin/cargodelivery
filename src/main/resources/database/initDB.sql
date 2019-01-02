CREATE DATABASE cargodelivery;
SET NAMES UTF8;
CREATE TABLE IF NOT EXISTS cities(
  id         INTEGER AUTO_INCREMENT PRIMARY KEY ,
  name       VARCHAR(30)   NOT NULL
);
INSERT INTO cities (id, name)
VALUES (DEFAULT, 'Винница'),
       (DEFAULT, 'Киев'),
       (DEFAULT, 'Львов'),
       (DEFAULT, 'Харьков'),
       (DEFAULT, 'Одесса');

CREATE TABLE IF NOT EXISTS users(
  id         INTEGER AUTO_INCREMENT PRIMARY KEY ,
  name       VARCHAR(40)   NOT NULL ,
  surname    VARCHAR(40)   NOT NULL ,
  city       VARCHAR(40)   NOT NULL ,
  phone      VARCHAR(40)   NOT NULL ,
  mail       VARCHAR(40)   NOT NULL ,
  password   VARCHAR(200)  NOT NULL ,
  role       INTEGER  NOT NULL
);

INSERT INTO users (id, name , surname, city, phone, mail, password, role)
VALUES (DEFAULT, 'Максим', 'Барко', 'Винница', '+380672121212', 'bar@gmail.com', '1111', 1),
       (DEFAULT, 'Борис', 'Марлечук', 'Киев', '+380675151515', 'mar@gmail.com', '2222', 1);

SELECT u.name, u.surname, u.city, u.phone, u.mail, u.password, u.role
FROM users AS u
WHERE u.id = (?);

SELECT u.id, u.name, u.surname, u.city, u.phone, u.password, u.role
FROM users AS u
WHERE u.mail = (?);
