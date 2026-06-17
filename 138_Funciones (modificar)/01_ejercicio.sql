--Trabajamos con la tabla "libros" de una librería.

--Eliminamos la tabla si existe y la creamos con la siguiente estructura:
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20)
 );
--Ingresamos algunos registros:

 insert into libros values('Uno','Richard Bach','Planeta');
 insert into libros values('El aleph','Borges','Emece');
 insert into libros values('Ilusiones','Richard Bach','Planeta');
 insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo');
 insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo');
--Eliminamos, si existe la función "f_libros":

 if object_id('f_libros') is not null
  drop function f_libros;
--Creamos una función que retorna una tabla en línea:

 create function f_libros
 (@autor varchar(30)='Borges')
 returns table
 as
 return (
  select titulo,editorial
  from libros
  where autor like '%'+@autor+'%'
 );
--Llamamos a la función creada anteriormente enviando un autor:

 select *from f_libros('Bach');
--La modificamos agregando otro campo en el "select":

 alter function f_libros
 (@autor varchar(30)='Borges')
 returns table
 as
 return (
  select codigo,titulo,editorial
  from libros
  where autor like '%'+@autor+'%'
 );
--Probamos la función para ver si se ha modificado:

 select *from f_libros('Bach');
