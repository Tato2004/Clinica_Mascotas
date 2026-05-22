DROP DATABASE IF EXISTS clinica;

CREATE DATABASE clinica
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE clinica;

-- =========================
-- TIPOS DE MASCOTA
-- =========================

CREATE TABLE TipoMascota (

    idTipoMascota INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(100)

);

-- =========================
-- PROPIETARIOS
-- =========================

CREATE TABLE Propietario (

    idPropietario INT AUTO_INCREMENT PRIMARY KEY,

    cedula VARCHAR(20),

    nombre VARCHAR(150),

    apellidos VARCHAR(150),

    telefono VARCHAR(25),

    direccion VARCHAR(250),

    correo VARCHAR(100)

);

-- =========================
-- USUARIOS
-- =========================

CREATE TABLE Usuario (

    idUsuario INT AUTO_INCREMENT PRIMARY KEY,

    usuario VARCHAR(50) UNIQUE,

    clave VARCHAR(100),

    rol ENUM(
        'propietario',
        'medico',
        'estetico',
        'admin'
    ) NOT NULL,

    idPropietario INT,

    FOREIGN KEY (idPropietario)
    REFERENCES Propietario(idPropietario)
    ON DELETE CASCADE
    ON UPDATE CASCADE

);

-- =========================
-- MASCOTAS
-- =========================

CREATE TABLE Mascota (

    idMascota INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(50),

    raza VARCHAR(50),

    edad INT,

    idTipoMascota INT,

    idPropietario INT,

    genero VARCHAR(10),

    foto TEXT,

    FOREIGN KEY (idTipoMascota)
    REFERENCES TipoMascota(idTipoMascota),

    FOREIGN KEY (idPropietario)
    REFERENCES Propietario(idPropietario)

);

-- =========================
-- TIPOS INICIALES
-- =========================

INSERT INTO TipoMascota (nombre)
VALUES
('Perro'),
('Gato'),
('Hamster'),
('Caballo'),
('Hipopotamo');

-- =========================
-- PROFESIONALES
-- =========================

CREATE TABLE Profesionales (

    idProfesional INT PRIMARY KEY AUTO_INCREMENT,

    nombreProfesional VARCHAR(250),

    apellidoProfesional VARCHAR(250),

    telefonoProfesional VARCHAR(50),

    correoProfesional VARCHAR(50),

    cedulaProfesional VARCHAR(20),

    tipoProfesional ENUM('medico','estetico'),

    usuario VARCHAR(50),

    clave VARCHAR(100)

);

-- =========================
-- TRATAMIENTOS
-- =========================

CREATE TABLE Tratamiento (

    idTx INT PRIMARY KEY AUTO_INCREMENT,

    nombreTx VARCHAR(250),

    fechaTx DATETIME,

    precio DECIMAL(10,2),

    descripcionTx TEXT,

    idProfesional INT,

    FOREIGN KEY(idProfesional)
    REFERENCES Profesionales(idProfesional)
    ON UPDATE CASCADE
    ON DELETE CASCADE

);

-- =========================
-- RELACIÓN MASCOTA/TRATAMIENTO
-- =========================

CREATE TABLE MascotaTratamientos (

    idMascota INT,

    idTx INT,

    PRIMARY KEY (idMascota, idTx),

    FOREIGN KEY (idMascota)
    REFERENCES Mascota(idMascota)
    ON DELETE CASCADE
    ON UPDATE CASCADE,

    FOREIGN KEY (idTx)
    REFERENCES Tratamiento(idTx)
    ON DELETE CASCADE
    ON UPDATE CASCADE

);

-- =========================
-- ADMIN
-- =========================

INSERT INTO Usuario (
    usuario,
    clave,
    rol,
    idPropietario
)
VALUES (
    'admin',
    '1234',
    'admin',
    NULL
);

-- Propietario de prueba
INSERT INTO Propietario (cedula, nombre, apellidos, telefono, direccion, correo)
VALUES ('9999999999', 'Carlos', 'Pérez', '3001234567', 'Calle 1', 'carlos@email.com');

-- Usuario propietario vinculado
INSERT INTO Usuario (usuario, clave, rol, idPropietario)
VALUES ('carlos', '1234', 'propietario', 1);

-- Profesional médico
INSERT INTO Profesionales (nombreProfesional, apellidoProfesional, telefonoProfesional, correoProfesional, cedulaProfesional, tipoProfesional)
VALUES ('Laura', 'Martínez', '3201234567', 'laura@clinica.com', '111222333', 'medico');

-- Usuario médico
INSERT INTO Usuario (usuario, clave, rol, idPropietario)
VALUES ('laura', '1234', 'medico', NULL);

-- Usuario estético
INSERT INTO Usuario (usuario, clave, rol, idPropietario)
VALUES ('pedro', '1234', 'estetico', NULL);