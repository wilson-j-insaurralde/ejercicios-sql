/*
Problema:
Trabajamos con la tabla "libros" que almacena los datos de los libros de una librer�a.
Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
Creamos la tabla:

 create table libros(
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15)
 );
Agregamos un registro:

 insert into libros (titulo,autor,editorial)
  values ('El aleph','Borges','Emece');
Mostramos todos los libros y agregamos un comentario de linea:

 select * from libros --mostramos los registros de libros; 
vamos a mostrar el t�tulo y autor de todos los libros y agregamos un bloque de comentarios:

 select titulo, autor 
 /*mostramos t�tulos y
 nombres de los autores*/
 from libros;
Note que lo que est� entre los s�mbolos no se ejecuta.
*/

 if object_id('libros') is not null
  drop table libros;

 create table libros(
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15)
 );

 insert into libros (titulo,autor,editorial)
  values ('El aleph','Borges','Emece');

 select * from libros --mostramos los registros de libros; 

 select titulo, autor 
 /*mostramos t�tulos y
 nombres de los autores*/
 from libros;
