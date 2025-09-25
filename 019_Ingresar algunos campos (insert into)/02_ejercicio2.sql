/*
Trabajamos con la tabla "libros" que almacena los datos de los libros de una librería.
Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
Creamos la tabla:

 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15)
 );
Si ingresamos valores para todos los campos, podemos omitir la lista de campos:

 insert into libros
  values ('Uno','Richard Bach','Planeta');
Podemos ingresar valores para algunos de los campos:

 insert into libros (titulo, autor)
  values ('El aleph','Borges');
No podemos omitir el valor para un campo declarado "not null", como el campo "titulo":

 insert into libros (autor,editorial)
  values ('Lewis Carroll','Planeta');
aparece un mensaje y la inserción no se realiza.

Veamos cómo SQL Server almacenó los registros:

 select * from libros;

*/

if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15)
 );

 insert into libros
  values ('Uno','Richard Bach','Planeta');

 insert into libros (titulo, autor)
  values ('El aleph','Borges');

 insert into libros (autor,editorial)
  values ('Lewis Carroll','Planeta');

 select * from libros;
