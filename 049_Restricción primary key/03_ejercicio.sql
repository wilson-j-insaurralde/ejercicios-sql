/*
Trabajamos con la tabla "libros" de una librería.
Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
La creamos estableciendo el campo código como clave primaria:

 create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  primary key (codigo)
 );
Veamos la restricción "primary key" que creó automáticamente SQL Server:

 exec sp_helpconstraint libros;
Aparece la siguiente información:

constraint_type			constraint_name		constraint_keys
-----------------------------------------------------------------------
PRIMARY KEY (clustered)		PK__libros__571DF1D5 	codigo
Vamos a eliminar la tabla y la crearemos nuevamente, sin establecer la clave primaria:

 drop table libros;
 create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15)
 );
Definimos una restricción "primary key" para nuestra tabla "libros" para asegurarnos que cada libro tendrá un código diferente y único:

 alter table libros
 add constraint PK_libros_codigo
 primary key(codigo);
Veamos la información respecto a ella:

 exec sp_helpconstraint libros;
Si intentamos ingresar un registro con un valor para el campo "codigo" que ya existe, no lo permite. Tampoco permite modificar un código colocando uno existente.

Si intentamos definir otra restricción "primary key", SQL Server no lo permite.


*/
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  primary key (codigo)
 );

 exec sp_helpconstraint libros;

 drop table libros;
 create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15)
 );

 alter table libros
 add constraint PK_libros_codigo
 primary key(codigo);

 exec sp_helpconstraint libros;