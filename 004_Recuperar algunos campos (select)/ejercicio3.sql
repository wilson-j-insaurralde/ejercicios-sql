/*
Trabajamos con la tabla "libros" que almacena los datos de los libros de una librería.
Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
Creamos la tabla:

 create table libros(
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio float,
  cantidad integer
 );
Veamos la estructura de la tabla:

 exec sp_columns libros;
Ingresamos algunos registros:

 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('El aleph','Borges','Emece',25.50,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Alicia en el pais de las maravillas','Lewis Carroll','Atlantida',10,200);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Matematica estas ahi','Paenza','Siglo XXI',18.8,200);
Veamos todos los campos la tabla:

 select * from libros;
Veamos solamente el título, autor y editorial de todos los libros especificando los nombres de los campos separados por comas:

 select titulo,autor,editorial from libros; 
Con la siguiente sentencia seleccionamos los títulos y precios de todos los libros:

 select titulo,precio from libros;
Veamos solamente la editorial y la cantidad de libros tipeamos:

 select editorial,cantidad from libros; 

*/
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio float,
  cantidad integer
 );

 exec sp_columns libros;

 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('El aleph','Borges','Emece',25.50,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Alicia en el pais de las maravillas','Lewis Carroll','Atlantida',10,200);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values ('Matematica estas ahi','Paenza','Siglo XXI',18.8,200);

 select * from libros;

 select titulo,autor,editorial from libros; 

 select titulo,precio from libros;

 select editorial,cantidad from libros; 
