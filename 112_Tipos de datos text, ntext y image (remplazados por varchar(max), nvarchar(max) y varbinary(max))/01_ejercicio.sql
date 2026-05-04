--Una librería almacena los datos de sus libros en una tabla llamada "libros".
--Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
--Creamos la tabla con un campo de tipo "text" en el cual almacenaremos la sinopsis (comentario) del libro:

 create table libros(
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(6,2),
  sinopsis text
 );
--Ingresamos algunos registros:

 insert into libros values
 ('Ilusiones','Richard Bach','Planeta',15,null);
 insert into libros values
 ('Aprenda PHP','Mario Molina','Nuevo Siglo',45,
'Trata todos los temas necesarios para el aprendizaje de PHP');
 insert into libros (titulo,autor,editorial) values
 ('Uno','Richard Bach','Planeta');
 insert into libros values
 ('El aleph','Borges','Emece',18,'Uno de los más célebres libros de este autor');
--La siguiente consulta muestra la cantidad de libros que tienen sinopsis:

 select count(*)
  from libros
  where sinopsis is not null;
--Agregamos una restricción "default" al campo "sinopsis" (es la única restricción que puede aplicarse a campos de tipo "text"):

 alter table libros
 add constraint DF_libros_sinopsis
 default 'No hay datos'
 for sinopsis;
--Ingresamos un registro con valores por defecto:

 insert into libros default values;
--Recuperamos los registros y vemos que se almacenó el valor por defecto:

 select *from libros;
--Creamos ahora la tabla con el campo sinopsis con la nueva sintaxis propuesta para SQL Server:


create table libros(
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(6,2),
  sinopsis varchar(max)
);