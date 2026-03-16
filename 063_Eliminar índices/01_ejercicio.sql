--Trabajamos con la tabla "libros" de una librería.
--Eliminamos la tabla si existe y la creamos:

 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15)
 );
--Creamos un índice para el campo "titulo":

 create index I_libros_titulo
 on libros(titulo);
--Verifiquemos que se creó:

 exec sp_helpindex libros;
--Eliminamos el índice "I_libros_titulo":

 drop index libros.I_libros_titulo;
--Corroboremos que se eliminó:

 exec sp_helpindex libros;
--Solicitamos que se elimine el índice "I_libros_titulo" si existe:

 if exists (select name from sysindexes
  where name = 'I_libros_titulo')
   drop index libros.I_libros_titulo;
