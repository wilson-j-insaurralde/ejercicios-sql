/*
Trabajamos con la tabla "libros" de una librería.
Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
Creamos la tabla:

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(20),
  editorial varchar(20)
 );
Ingresamos algunos registros:

 insert into libros values ('Uno','Richard Bach','Planeta');
 insert into libros values ('El aleph','Borges','Emece');
 insert into libros values ('Alicia en el pais...','Carroll','Planeta');
 insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI');
 insert into libros values ('Java en 10 minutos','Mario Molina','Siglo XXI');
 insert into libros values ('Java desde cero','Mario Molina','Emece');
 insert into libros values ('Ilusiones','Richard Bach','Planeta');
Obtenemos todos los datos de los primeros 2 libros de la tabla:

 select top 2 * from libros;
Mostramos los títulos y autores de los 3 primeros libros ordenados por autor:

 select top 3 titulo,autor 
  from libros
  order by autor;
Realizamos la misma consulta anterior pero empleamos la cláusula "with ties", con lo cual incluiremos en la selección, todos los registros que tengan el mismo autor que el último registro retornado, aunque pasemos de 3:

 select top 3 with ties titulo,autor 
  from libros
  order by autor;
Note que retorna los 5 primeros registros porque incluye los dos siguientes que tienen el mismo valor que el último en el campo "autor" (por el cual se ordena).

Recuperar la mitad de registros de la tabla 'libros':

 select top 50 percent
  * from libros
  order by autor;
*/

if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(20),
  editorial varchar(20)
 );

 insert into libros values ('Uno','Richard Bach','Planeta');
 insert into libros values ('El aleph','Borges','Emece');
 insert into libros values ('Alicia en el pais...','Carroll','Planeta');
 insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI');
 insert into libros values ('Java en 10 minutos','Mario Molina','Siglo XXI');
 insert into libros values ('Java desde cero','Mario Molina','Emece');
 insert into libros values ('Ilusiones','Richard Bach','Planeta');

 select top 2 * from libros;

 select top 3 titulo,autor 
  from libros
  order by autor;

 select top 3 with ties titulo,autor 
  from libros
  order by autor;

 select top 50 percent
  * from libros
  order by autor;