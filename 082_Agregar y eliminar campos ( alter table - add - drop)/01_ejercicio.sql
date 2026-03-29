--Trabajamos con la tabla "libros" de una librería.
--Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
--Creamos la tabla:

 create table libros(
  titulo varchar(30),
  editorial varchar(15),
  edicion datetime,
  precio decimal(6,2)
 );
--Agregamos un registro:

 insert into libros (titulo,editorial,precio)
  values ('El aleph','Emece',25.50);
--Agregamos el campo "cantidad" a la tabla "libros", de tipo tinyint, que acepta valores nulos:

 alter table libros
  add cantidad tinyint;
--Verificamos la estructura de la tabla empleando el procedimiento almacenado "sp_columns":

 exec sp_columns libros;
--aparece el nuevo campo.

--Agregamos un campo "codigo" a la tabla "libros", de tipo int con el atributo "identity":

 alter table libros
  add codigo int identity;
--Intentamos agregar un campo llamado "autor" de tipo varchar(30) que NO acepte valores nulos:

 alter table libros
  add autor varchar(30) not null;
--No es posible, porque SQL Server no permite agregar campos "not null" a menos que se especifique un valor por defecto:

 alter table libros
  add autor varchar(20) not null default 'Desconocido';
--En el ejemplo anterior, se agregó una restricción "default" para el nuevo campo, que puede verificarse ejecutando el procedimiento almacenado "sp_helpconstraint".

--En el siguiente ejemplo eliminamos el campo "precio" de la tabla "libros":

 alter table libros
  drop column precio;
--Verificamos la eliminación:

 exec sp_columns libros;
--el campo "precio" ya no existe.

--Recuerde que no pueden eliminarse los campos con restricciones, intentémoslo:

 alter table libros
  drop column autor;
--no lo permite.

--Podemos eliminar varios campos en una sola sentencia:

 alter table libros
  drop column editorial,edicion;