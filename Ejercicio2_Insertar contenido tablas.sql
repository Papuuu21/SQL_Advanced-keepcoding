INSERT INTO modulos (modulos_id, curso_id, start_date, last_date, profesor_id) VALUES
(1, 1, '2023-01-15', '2023-06-15', 1),
(2, 2, '2023-02-01', '2023-07-01', 2),
(3, 3, '2023-03-05', '2023-08-05', 3),
(4, 4, '2023-04-10', '2023-09-10', 4);

INSERT INTO profesores (profesor_id, name, last_name, email) VALUES
(1, 'Ana', 'López', 'ana.lopez@example.com'),
(2, 'Javier', 'Sánchez', 'javier.sanchez@example.com'),
(3, 'Laura', 'González', 'laura.gonzalez@example.com'),
(4, 'Miguel', 'Rodríguez', 'miguel.rodriguez@example.com');


INSERT INTO cursos (curso_id, alumno_id, start_date, last_date) VALUES
(1, 1, '2023-01-15', '2023-06-15'),
(2, 2, '2023-02-01', '2023-07-01'),
(3, 3, '2023-03-05', '2023-08-05'),
(4, 4, '2023-04-10', '2023-09-10');


INSERT INTO alumnos (alumnos_id, name, apellido, matricula_id) VALUES
(1, 'Carlos', 'García', 1001),
(2, 'María', 'Fernández', 1002),
(3, 'Juan', 'Martínez', 1003),
(4, 'Lucía', 'Pérez', 1004);
