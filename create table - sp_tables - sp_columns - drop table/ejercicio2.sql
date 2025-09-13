/*
Necesita almacenar información referente a los libros de su biblioteca personal. Los datos que 
guardará serán: título del libro, nombre del autor y nombre de la editorial.
1- Elimine la tabla "libros", si existe:
 if object_id('libros') is not null
  drop table libros;

2- Verifique que la tabla "libros" no existe en la base de datos activa (exec sp_tables @table_owner='dbo').

3- Cree una tabla llamada "libros". Debe definirse con los siguientes campos: titulo, varchar(20); 
autor, varchar(30) y editorial, varchar(15).

4- Intente crearla nuevamente. Aparece mensaje de error.

5- Visualice las tablas existentes.

6- Visualice la estructura de la tabla "libros".

7- Elimine la tabla.

8- Intente eliminar la tabla nuevamente.
*/
 if object_id('libros') is not null
  drop table libros;

 exec sp_tables @table_owner='dbo';

 create table libros(
  titulo varchar(20),
  autor varchar(30),
  editorial varchar(15)
 );

 exec sp_tables @table_owner='dbo';

 exec sp_columns libros;

 drop table libros;

 