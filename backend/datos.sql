CREATE DATABASE proyecto_planetario;

USE proyecto_planetario;

CREATE TABLE sistemas (
    id_sistema INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

INSERT INTO sistemas (nombre)
VALUES
('Sistema Solar'),
('Kepler-90');

CREATE TABLE planetas (
    id_planeta INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    temperature DECIMAL(10,2),
    mass DECIMAL(15,6),
    radius DECIMAL(15,6),
    period DECIMAL(15,2),
    id_sistema INT NOT NULL,
    FOREIGN KEY (id_sistema) REFERENCES sistemas(id_sistema)
);

SHOW TABLES;

INSERT INTO planetas
(name, temperature, mass, radius, period, id_sistema)
VALUES
('Mercury', 440, 0.000170, 0.034100, 88, 1),
('Venus', 737, 0.002560, 0.084700, 224.7, 1),
('Earth', 288, 0.003150, 0.089200, 365.2, 1),
('Mars', 210, 0.000340, 0.047500, 687, 1),
('Jupiter', 165, 1.000000, 1.000000, 4331, 1),
('Saturn', 134, 0.299000, 0.843000, 10747, 1),
('Uranus', 76, 0.045700, 0.358000, 30589, 1),
('Neptune', 72, 0.053900, 0.346000, 59800, 1);

INSERT INTO planetas
(name, temperature, mass, radius, period, id_sistema)
VALUES
('Kepler-90b', 950, 0.010000, 0.120000, 7.01, 2),
('Kepler-90c', 850, 0.015000, 0.140000, 8.72, 2),
('Kepler-90d', 650, 0.020000, 0.180000, 59.74, 2),
('Kepler-90e', 550, 0.025000, 0.200000, 91.94, 2),
('Kepler-90f', 450, 0.030000, 0.250000, 124.91, 2),
('Kepler-90g', 350, 0.040000, 0.300000, 210.61, 2),
('Kepler-90h', 250, 0.050000, 0.350000, 331.60, 2),
('Kepler-90i', 750, 0.012000, 0.130000, 14.45, 2);

SELECT * FROM planetas;
