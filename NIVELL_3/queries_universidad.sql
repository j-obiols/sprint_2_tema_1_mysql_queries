SELECT apellido1, apellido2, nombre FROM universidad.persona WHERE tipo = "alumno" ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = "alumno" AND telefono IS NULL;
SELECT * from persona WHERE tipo = "alumno" AND fecha_nacimiento LIKE "%1999%";
SELECT * from persona WHERE tipo = "profesor" AND telefono IS NULL AND nif LIKE "%K";
SELECT * from asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT apellido1, apellido2, p.nombre, dep.nombre AS departamento FROM persona p JOIN profesor prof ON p.id = prof.id_profesor JOIN departamento dep ON prof.id_departamento = dep.id ORDER BY apellido1, apellido2, p.nombre;
SELECT asig.nombre, ce.anyo_inicio, ce.anyo_fin FROM persona p JOIN alumno_se_matricula_asignatura ama ON p.id = ama.id_alumno JOIN asignatura asig ON ama.id_asignatura = asig.id JOIN curso_escolar ce ON ama.id_curso_escolar = ce.id WHERE p.nif = "26902806M";
SELECT DISTINCT dep.nombre FROM departamento dep JOIN profesor prof ON dep.id = prof.id_departamento JOIN asignatura asig ON prof.id_profesor = asig.id_profesor JOIN grado gr ON asig.id_grado = gr.id WHERE gr.nombre LIKE "%Grado en Ingeniería Informática (Plan 2015)%";
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p JOIN alumno_se_matricula_asignatura ama ON p.id = ama.id_alumno JOIN curso_escolar ce ON ama.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019 GROUP BY p.id;
-- A PARTIR D'AQUÍ CONSULTES LEFT JOIN / RIGHT JOIN: 
SELECT dep.nombre, p.apellido2, p.apellido1, p.nombre FROM profesor prof LEFT JOIN departamento dep ON dep.id = prof.id_departamento LEFT JOIN persona p ON prof.id_profesor = p.id ORDER BY dep.nombre, p.apellido2, p.apellido1, p.nombre;
-- Aquesta consulta no la entrego perquè la base de dades no permet inscriure a un professor a la taula "profesores" sense assignar-li un departament;
SELECT dep.nombre, id_profesor FROM departamento dep LEFT JOIN profesor prof ON dep.id = prof.id_departamento WHERE id_profesor IS NULL;
SELECT p.apellido2, p.apellido1, p.nombre, asig.id AS id_asignatura FROM profesor prof LEFT JOIN asignatura asig ON prof.id_profesor = asig.id_profesor LEFT JOIN persona p ON prof.id_profesor = p.id WHERE asig.id IS NULL ORDER BY apellido2, apellido1, nombre; 
SELECT asig.nombre, prof.id_profesor FROM asignatura asig LEFT JOIN profesor prof ON asig.id_profesor = prof.id_profesor WHERE asig.id_profesor IS NULL;
SELECT DISTINCT dep.nombre, ama.id_curso_escolar FROM asignatura asig LEFT JOIN profesor prof ON asig.id_profesor = prof.id_profesor LEFT JOIN departamento dep ON prof.id_departamento = dep.id LEFT JOIN alumno_se_matricula_asignatura ama ON asig.id = ama.id_asignatura WHERE ama.id_curso_escolar IS NULL AND dep.nombre IS NOT NULL;
-- Fent proves amb la consulta de la fila superior he vist que apareixien assignatures sense departament, per això he afegit la última condició...
-- CONSULTES RESUM:
SELECT COUNT(*) FROM persona WHERE tipo = "alumno";
SELECT COUNT(*) FROM persona WHERE tipo = "alumno" AND fecha_nacimiento LIKE "%1999%";
SELECT dep.nombre, COUNT(*) AS numero_profesores FROM profesor prof JOIN departamento dep ON prof.id_departamento = dep.id GROUP BY prof.id_departamento ORDER BY numero_profesores DESC;
SELECT dep.nombre, COUNT(prof.id_profesor) AS numero_profesores FROM departamento dep LEFT JOIN profesor prof ON dep.id  = prof.id_departamento GROUP BY dep.nombre;
-- 
--
SELECT gr.nombre, asig.tipo, sum(creditos) FROM grado gr JOIN asignatura asig ON gr.id = asig.id_grado GROUP BY gr.id, asig.tipo; 
SELECT DISTINCT ce.anyo_inicio, COUNT(id_alumno) FROM curso_escolar ce JOIN alumno_se_matricula_asignatura ama ON ce.id = ama.id_curso_escolar GROUP BY ama.id_curso_escolar, ama.id_asignatura;
SELECT prof.id_profesor, p.nombre, p.apellido1, p.apellido2, COUNT(asig.nombre) FROM profesor prof LEFT JOIN persona p ON p.id = prof.id_profesor LEFT JOIN asignatura asig ON prof.id_profesor = asig.id_profesor GROUP BY prof.id_profesor;
SELECT * FROM persona WHERE  tipo = "alumno" ORDER BY fecha_nacimiento DESC LIMIT 1;
--