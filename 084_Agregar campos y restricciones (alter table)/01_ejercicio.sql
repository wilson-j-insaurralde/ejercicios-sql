--Trabajamos con la tabla "libros" de una librería.
--Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
--Creamos la tabla con la siguiente estructura:

 create table libros(
  autor varchar(30),
  editorial varchar(15)
 );
--Agregamos el campo "titulo" de tipo varchar(30) y una restricción "unique" con índice agrupado:

 alter table libros
  add titulo varchar(30) 
  constraint UQ_libros_autor unique clustered;
--Veamos si la estructura cambió:

 exec sp_columns libros;
--Agregamos el campo "codigo" de tipo int identity not null y en la misma sentencia una restricción "primary key" con índice no agrupado:

 alter table libros
  add codigo int identity not null
  constraint PK_libros_codigo primary key nonclustered;
--Agregamos el campo "precio" de tipo decimal(6,2) y una restricción "check" que no permita valores negativos para dicho campo:

 alter table libros
  add precio decimal(6,2)
  constraint CK_libros_precio check (precio>=0);
--Vemos las restricciones:

 exec sp_helpconstraint libros;