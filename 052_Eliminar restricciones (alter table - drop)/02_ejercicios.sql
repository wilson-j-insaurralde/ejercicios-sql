
--Problema:
--Trabajamos con la tabla "libros" de una librería.
--Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
--La creamos estableciendo el campo código como clave primaria:

 create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(6,2)
 );
--Definimos una restricción "primary key" para nuestra tabla "libros" para asegurarnos que cada libro tendrá un código diferente y único:

 alter table libros
 add constraint PK_libros_codigo
 primary key(codigo);
--Definimos una restricción "check" para asegurarnos que el precio no será negativo:

 alter table libros
 add constraint CK_libros_precio
 check (precio>=0);
--Definimos una restricción "default" para el campo "autor" para que almacene "Desconocido":

 alter table libros
 add constraint DF_libros_autor
 default 'Desconocido'
 for autor;
--Definimos una restricción "default" para el campo "precio" para que almacene 0:

 alter table libros
 add constraint DF_libros_precio
 default 0
 for precio;
--Vemos las restricciones:

 exec sp_helpconstraint libros;
--Aparecen 4 restricciones, 1 "check", 2 "default" y 1 "primary key".

--Eliminamos la restricción "DF_libros_autor":

 alter table libros
  drop DF_libros_autor;
--Eliminamos la restricción "PK_libros_codigo":

 alter table libros
  drop PK_libros_codigo;
--Vemos si se eliminaron:

 exec sp_helpconstraint libros;
--Aparecen 2 restricciones.


