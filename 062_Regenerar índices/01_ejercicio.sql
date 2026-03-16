--Problema:
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
--Creamos un índice no agrupado para el campo "titulo":

 create nonclustered index I_libros_titulo
 on libros(titulo);
--Veamos la información:

 exec sp_helpindex libros;
--Vamos a agregar el campo "autor" al índice "I_libros_titulo" y vemos si se modificó:

 create index I_libros_titulo
  on libros(titulo,autor)
  with drop_existing;

 exec sp_helpindex libros;
--Lo convertimos en agrupado y ejecutamos "sp_helpindex":

 create clustered index I_libros_titulo
  on libros(titulo,autor)
  with drop_existing;

 exec sp_helpindex libros;
--Quitamos un campo "autor" y verificamos la modificación:

 create clustered index I_libros_titulo
 on libros(titulo)
 with drop_existing;

 exec sp_helpindex libros;