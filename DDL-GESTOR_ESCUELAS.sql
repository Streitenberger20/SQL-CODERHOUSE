CREATE SCHEMA GESTOR_ESCUELAS;

USE GESTOR_ESCUELAS;

CREATE TABLE SUPERVISOR(
ID_SUPERVISOR INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
NOMBRE_SUPERVISOR VARCHAR(10),
APELLIDO_SUPERVISOR VARCHAR(20),
INICIO_ACTIVIDAD DATE NOT NULL,
ID_REGIONAL INT NOT NULL UNIQUE
);

CREATE TABLE ESCUELA(
ID_ESCUELA INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
NOMBRE_ESCUELA VARCHAR(50) NOT NULL,
CUE INT NOT NULL UNIQUE,
ID_SUPERVISOR INT NOT NULL ,
ID_REGIONAL INT NOT NULL,
FOREIGN KEY(ID_SUPERVISOR) REFERENCES SUPERVISOR(ID_SUPERVISOR)
);

CREATE TABLE PROFESOR(
CUIT_PROFESOR INT NOT NULL UNIQUE PRIMARY KEY,
ID_ESCUELA INT NOT NULL,
NOMBRE_PROFESOR VARCHAR(10),
APELLIDO_PROFESOR VARCHAR(10),
EDAD TINYINT,
ESCUELAS_ASOCIADAS INT,
INICIO_ACTIVIDAD DATE NOT NULL,
FOREIGN KEY(ID_ESCUELA) REFERENCES ESCUELA(ID_ESCUELA)
);

CREATE TABLE CURSO(
ID_CURSO INT NOT NULL UNIQUE PRIMARY KEY,
ID_ESCUELA INT NOT NULL,
PROFESOR INT NOT NULL,
COMISION VARCHAR(2) NOT NULL UNIQUE,
CANTIDAD_ALUMNOS TINYINT,
FOREIGN KEY(ID_ESCUELA) REFERENCES ESCUELA(ID_ESCUELA),
FOREIGN KEY(PROFESOR) REFERENCES PROFESOR(CUIT_PROFESOR)
);

CREATE TABLE MATERIA(
ID_MATERIA INT NOT NULL UNIQUE PRIMARY KEY,
ID_CURSO INT NOT NULL UNIQUE,
ID_PROFESOR INT NOT NULL,
CALIFICACION FLOAT(2),
FOREIGN KEY(ID_CURSO) REFERENCES CURSO(ID_CURSO),
FOREIGN KEY(ID_PROFESOR) REFERENCES CURSO(PROFESOR)
);
CREATE TABLE ALUMNO(
ID_ALUMNO INT NOT NULL UNIQUE PRIMARY KEY,
ID_CURSO INT NOT NULL UNIQUE,
NOMBRE_ALUMNO VARCHAR(10) NOT NULL,
APELLIDO_ALUMNO VARCHAR(20) NOT NULL,
EDAD INT,
FECHA_INGRESO DATE,
FOREIGN KEY(ID_CURSO) REFERENCES CURSO(ID_CURSO)
);

CREATE TABLE CURSADA(
ID_MATERIA INT NOT NULL UNIQUE,
ID_ALUMNO INT NOT NULL,
CALIFICACION INT,
NRO_CURSADA INT,
FOREIGN KEY(ID_MATERIA) REFERENCES MATERIA(ID_MATERIA),
FOREIGN KEY(ID_ALUMNO) REFERENCES ALUMNO(ID_ALUMNO)
);
