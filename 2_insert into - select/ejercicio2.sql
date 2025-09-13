/*
Segundo problema:
Trabaje con la tabla "libros" que almacena los datos de los libros de su propia biblioteca.
1- Elimine la tabla "libros", si existe:
 if object_id('libros') is not null
  drop table libros;

2- Cree una tabla llamada "libros". Debe definirse con los siguientes campos: titulo (cadena de 20), 
autor (cadena de 30) y editorial (cadena de 15).

3- Visualice las tablas existentes (exec sp_tables @table_owner='dbo').

4- Visualice la estructura de la tabla "libros" (sp_columns).

5- Ingrese los siguientes registros:
 insert into libros (titulo,autor,editorial)
  values ('El aleph','Borges','Planeta');
 insert into libros (titulo,autor,editorial) 
  values ('Martin Fierro','Jose Hernandez','Emece');
 insert into libros (titulo,autor,editorial)
  values ('Aprenda PHP','Mario Molina','Emece');

6- Muestre todos los registros (select).
*/

 if object_id('libros') is not null
  drop table libros;

 create table libros (
  titulo varchar(20),
  autor varchar(30),
  editorial varchar(15)
 );

 exec sp_tables @table_owner='dbo';

 exec sp_columns libros;

 insert into libros (titulo,autor,editorial)
  values ('El aleph','Borges','Planeta');
 insert into libros (titulo,autor,editorial) 
  values ('Martin Fierro','Jose Hernandez','Emece');
 insert into libros (titulo,autor,editorial)
  values ('Aprenda PHP','Mario Molina','Emece');

 select * from libros;