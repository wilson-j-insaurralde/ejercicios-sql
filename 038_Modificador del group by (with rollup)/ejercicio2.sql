/*
Un instituto de enseñanza guarda las notas de sus alumnos en una tabla llamada "notas".
1- Elimine la tabla si existe:
 if object_id('notas') is not null
  drop table notas;

2- Cree la tabla con la siguiente estructura:
 create table notas(
  documento char(8) not null,
  materia varchar(30),
  nota decimal(4,2)
 );

3-Ingrese algunos registros:
 insert into notas values ('22333444','Programacion',8);
 insert into notas values ('22333444','Programacion',9);
 insert into notas values ('22333444','Ingles',8);
 insert into notas values ('22333444','Ingles',7);
 insert into notas values ('22333444','Ingles',6);
 insert into notas values ('22333444','Sistemas de datos',10);
 insert into notas values ('22333444','Sistemas de datos',9);

 insert into notas values ('23444555','Programacion',5);
 insert into notas values ('23444555','Programacion',4);
 insert into notas values ('23444555','Programacion',3);
 insert into notas values ('23444555','Ingles',9);
 insert into notas values ('23444555','Ingles',7);
 insert into notas values ('23444555','Sistemas de datos',9);

 insert into notas values ('24555666','Programacion',1);
 insert into notas values ('24555666','Programacion',3.5);
 insert into notas values ('24555666','Ingles',4.5);
 insert into notas values ('24555666','Sistemas de datos',6);

4- Se necesita el promedio por alumno por materia y el promedio de cada alumno en todas las materias 
cursadas hasta el momento (13 registros):
 select documento,materia,
  avg(nota) as promedio
  from notas
  group by documento,materia with rollup;
Note que  hay 4 filas extras, 3 con el promedio de cada alumno y 1 con el promedio de todos los 
alumnos de todas las materias.

5- Compruebe los resultados parciales de la consulta anterior realizando otra consulta mostrando el 
promedio de todas las carreras de cada alumno (4 filas)

6- Muestre la cantidad de notas de cada alumno, por materia (9 filas)

7- Realice la misma consulta anterior con resultados parciales incluidos (13 filas)

8- Muestre la nota menor y la mayor de cada alumno y la menor y mayor nota de todos (use "rollup") 
(4 filas)
*/

if OBJECT_ID('notas') is not null 
	drop table notas ;

create table notas(
	 documento char(8) not null,
  materia varchar(30),
  nota decimal(4,2)

);
exec sp_columns notas;

 insert into notas
 values ('22333444','Programacion',8);
 insert into notas
 values ('22333444','Programacion',9);
 insert into notas
 values ('22333444','Ingles',8);
 insert into notas
 values ('22333444','Ingles',7);
 insert into notas 
 values ('22333444','Ingles',6);
 insert into notas
 values ('22333444','Sistemas de datos',10);
 insert into notas
 values ('22333444','Sistemas de datos',9);

 insert into notas
 values ('23444555','Programacion',5);
 insert into notas
 values ('23444555','Programacion',4);
 insert into notas
 values ('23444555','Programacion',3);
 insert into notas
 values ('23444555','Ingles',9);
 insert into notas
 values ('23444555','Ingles',7);
 insert into notas
 values ('23444555','Sistemas de datos',9);

 insert into notas
 values ('24555666','Programacion',1);
 insert into notas
 values ('24555666','Programacion',3.5);
 insert into notas
 values ('24555666','Ingles',4.5);
 insert into notas
 values ('24555666','Sistemas de datos',6);

 select * from notas;

 select documento,materia ,avg(nota) as 'promedio'
	from notas 
	group by documento, materia with rollup;

select documento, avg(nota) as 'promedio'
	from notas 
	group by documento with rollup;

select documento, materia , avg(nota) as 'cantidad'
	from notas 
	group by documento, materia;

select documento,materia, avg(nota) as 'cantidad'
	from notas 
	group by documento , materia with rollup;

select documento, max(nota) as'mayor' , min (nota) as'minmima'
	from notas 
group by documento with rollup;