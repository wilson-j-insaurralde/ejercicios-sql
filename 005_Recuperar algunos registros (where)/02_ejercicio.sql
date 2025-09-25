/*
Trabaje con la tabla "libros" de una librería que guarda información referente a sus libros 
disponibles para la venta.

1- Elimine la tabla si existe.

2- Cree la tabla "libros". Debe tener la siguiente estructura:
 create table libros (
  titulo varchar(20),
  autor varchar(30),
  editorial varchar(15));

3- Visualice la estructura de la tabla "libros".

4- Ingrese los siguientes registros:
 El aleph,Borges,Emece;
 Martin Fierro,Jose Hernandez,Emece;
 Martin Fierro,Jose Hernandez,Planeta;
 Aprenda PHP,Mario Molina,Siglo XXI;

5- Seleccione los registros cuyo autor sea "Borges" (1 registro)

6- Seleccione los títulos de los libros cuya editorial sea "Emece" (2 registros)

7- Seleccione los nombres de las editoriales de los libros cuyo titulo sea "Martin Fierro" (2 
registros)
*/
 if object_id('libros') is not null
  drop table libros;

 create table libros (
  titulo varchar(20),
  autor varchar(30),
  editorial varchar(15)
 );

 exec sp_columns libros;

 insert into libros(titulo,autor,editorial) values
  ('El aleph','Borges','Emece');
 insert into libros(titulo,autor,editorial) values
  ('Martin Fierro','Jose Hernandez','Emece');
 insert into libros(titulo,autor,editorial) values
  ('Martin Fierro','Jose Hernandez','Planeta');
 insert into libros(titulo,autor,editorial) values
  ('Aprenda PHP','Mario Molina','Siglo XXI');

 select * from libros
  where autor='Borges';

 select titulo from libros
  where editorial='Emece';

 select editorial from libros
  where titulo='Martin Fierro';