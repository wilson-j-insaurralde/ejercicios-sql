--Una librería almacena los datos de sus libros en una tabla llamada "libros".
--Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
--Creamos la tabla con la siguiente estructura:

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  sinopsis text
 );
--Ingresamos algunos registros:

 insert into libros values ('Ilusiones','Richard Bach','Planeta',null);
 insert into libros values ('Aprenda PHP','Mario Molina','Nuevo Siglo',
   'Contiene todos los temas necesarios para el aprendizaje de PHP');
 insert into libros (titulo,autor,editorial) values ('Uno','Richard Bach','Planeta');
 insert into libros values ('El Aleph','Borges','Emece','Uno de los libros más célebres de este autor.');
--Colocamos el puntero a texto del campo "sinopsis" del registro con código 2 en una variable "@puntero" y luego "writetext" almacena el nuevo texto en el registro apuntado por "@puntero":

 declare @puntero binary(16)
 select @puntero = textptr (sinopsis)
  from libros
  where codigo=2
 writetext libros.sinopsis @puntero 'Este es un nuevo libro acerca de PHP escrito por el profesor 
Molina que aborda todos los temas necesarios para el aprendizaje desde cero de este lenguaje.';
--Leemos el campo "sinopsis" del libro cuyo código es 2, para ver si se actualizó:

 declare @puntero binary(16)
 select @puntero = textptr (sinopsis)
  from libros
  where codigo=2
 readtext libros.sinopsis @puntero 0 0;
--Si intentamos actualizar un campo "text", "ntext" o "image" que tiene valor nulo o un puntero inválido, aparece un mensaje de error, por lo tanto, en el siguiente ejemplo, verificamos si el puntero es válido antes de pasárselo a la función "writetext":

 declare @puntero varbinary(16)
 select @puntero=textptr(sinopsis) 
  from libros where codigo=1
 if (textvalid('libros.sinopsis', @puntero)=1)
  writetext libros.sinopsis @puntero 'Trata de una gaviota que vuela más alto que las demás.'
 else select 'puntero invalido, no se actualizó el registro';
--Para crear un puntero válido debemos ingresar un valor con "insert" o "update":

 update libros set sinopsis='xx' where codigo=1;
--Ahora si podemos actualizar el campo "sinopsis" del registro con código 1 con "writetext" porque ya tiene un puntero válido:

 declare @puntero varbinary(16)
 select @puntero=textptr(sinopsis) 
  from libros where codigo=1
 if (textvalid('libros.sinopsis', @puntero)=1)
  writetext libros.sinopsis @puntero 'Trata de una gaviota que vuela más alto que las demás.'
 else select 'puntero invalido, no se actualizó el registro';
--Veamos si se actualizó:

 declare @puntero binary(16)
 select @puntero = textptr (sinopsis)
  from libros
  where codigo=1
 readtext libros.sinopsis @puntero 0 0;
--Creamos un puntero válido al ingresar un nuevo registro:

 insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta','');
--Note que ingresamos una cadena vacía para el campo "sinopsis", con ello creamos un puntero válido.

--Actualizamos el campo "sinopsis" del último registro ingresado con "writetext":

 declare @puntero varbinary(16)
 select @puntero=textptr(sinopsis) 
  from libros where codigo=5
 if (textvalid('libros.sinopsis', @puntero)=1)
  writetext libros.sinopsis @puntero 'Trata de las aventuras de una niña en un país muy extraño.'
 else select 'puntero invalido, no se actualizó el registro';
--Veamos si se actualizó:

 declare @puntero binary(16)
 select @puntero = textptr (sinopsis)
  from libros
  where codigo=5
 readtext libros.sinopsis @puntero 0 0;
