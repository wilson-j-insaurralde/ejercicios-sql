/*
Trabajamos con la tabla "libros" que almacena los datos de los libros de una librer�a.
Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
Creamos la tabla:

 create table libros(
  codigo int identity,
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15),
  precio float
 );
Agregamos algunos registros:

 insert into libros (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
 insert into libros (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);
Seleccionamos todos los registros:

 select * from libros;
Truncamos la tabla:

 truncate table libros;
Ingresamos nuevamente algunos registros:

 insert into libros (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
 insert into libros (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);
Si seleccionamos todos los registros vemos que la secuencia se reinici� en 1:

 select * from libros;
Eliminemos todos los registros con "delete":

 delete from libros;
Ingresamos nuevamente algunos registros:

 insert into libros (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
 insert into libros (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);
Seleccionamos todos los registros y vemos que la secuencia continu�:

 select * from libros;
*/

 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15),
  precio float
 );

 insert into libros (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
 insert into libros (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);

 select * from libros;

 truncate table libros;

 insert into libros (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
 insert into libros (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);

 select * from libros;

 delete from libros;

 insert into libros (titulo,autor,editorial,precio)
  values ('El aleph','Borges','Emece',25.60);
 insert into libros (titulo,autor,editorial,precio)
  values ('Uno','Richard Bach','Planeta',18);

 select * from libros;
