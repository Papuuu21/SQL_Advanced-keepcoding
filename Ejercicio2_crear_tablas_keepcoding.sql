
CREATE TABLE Alumnos (
    alumnos_id INT NOT NULL PRIMARY KEY,
    name CHAR(50) NOT NULL,
    apellido CHAR(50) NOT NULL,
    matricula_id INT NOT NULL
);


CREATE TABLE Cursos (
    curso_id INT NOT NULL PRIMARY KEY,
    alumno_id INT NOT NULL,
    start_date DATE NOT NULL,
    last_date DATE NOT NULL,
    FOREIGN KEY (alumno_id) REFERENCES Alumnos(alumnos_id)
);

CREATE TABLE Profesores (
    profesor_id INT NOT NULL PRIMARY KEY,
    name CHAR(50) NOT NULL,
    last_name CHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE Módulos (
    modulos_id INT NOT NULL PRIMARY KEY,
    curso_id INT NOT NULL,
    start_date DATE NOT NULL,
    last_date DATE NOT NULL,
    profesor_id INT NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES Cursos(curso_id),
    FOREIGN KEY (profesor_id) REFERENCES Profesores(profesor_id)
);
