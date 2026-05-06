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
 insert into libros values ('El Aleph','Borges','Emece',
   'Uno de los libros más célebres de este autor.');
--Leemos la información almacenada en el campo "sinopsis" de "libros" del registro con código 2, desde la posición 9, 50 caracteres:

 declare @puntero varbinary(16)
 select @puntero=textptr(sinopsis) 
  from libros
  where codigo=2
 readtext libros.sinopsis @puntero 9 50;
--Leemos la información almacenada en el campo "sinopsis" de "libros" del registro con código 3, tal registro no tiene inicializado el campo "sinopsis", para que no ocurra un error, vamos a controlar el puntero antes de leer el campo:

 declare @puntero varbinary(16)
 select @puntero=textptr(sinopsis) 
  from libros where codigo=3
 if (textvalid('libros.sinopsis', @puntero)=1)
  readtext libros.sinopsis @puntero 0 0
 else select 'puntero invalido';
--Recuperamos la sinopsis del libro con código 4 (desde el comienzo al final), controlando que el puntero sea válido:

 declare @puntero varbinary(16)
 select @puntero=textptr(sinopsis) 
  from libros where codigo=4
 if (textvalid('libros.sinopsis', @puntero)=1)
  readtext libros.sinopsis @puntero 0 0
 else select 'puntero invalido';