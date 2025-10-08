/*
Trabajamos con la tabla "libros" de una librería.
Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
La creamos e ingresamos algunos registros:

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2)
 );

 insert into libros values ('Uno','Bach','Planeta',22);
 insert into libros values ('El quijote','Cervantes','Emece',15);
 insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI',-40);
Agregamos una restricción "check" para asegurar que los precios no puedan ser negativos, pero como ya tenemos almacenado un precio que infringe la restricción, vamos a especificar que no haya comprobación de datos existentes:

 alter table libros
 with nocheck
 add constraint CK_libros_precio_positivo
 check (precio>=0);
Si intentamos ingresar un registro con precio negativo, no lo permite. Para que lo permita, debemos dehabilitar la comprobación:

 alter table libros
  nocheck constraint CK_libros_precio_positivo;
Ingresemos un registro con precio negativo:

 insert into libros values('Java en 10 minutos',default,'Siglo XXI',-1);
Veamos si la restricción está o no habilitada:

 exec sp_helpconstraint libros;
La columna "status_enabled" nos informa que está deshabilitada (Disabled).

Habilitamos la restricción :

 alter table libros
  check constraint CK_libros_precio_positivo;
Si ahora intentamos ingresar un precio negativo SQL Server no lo permitirá.
*/

 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(5,2)
 );

 insert into libros values ('Uno','Bach','Planeta',22);
 insert into libros values ('El quijote','Cervantes','Emece',15);
 insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI',-40);

 alter table libros
 with nocheck
 add constraint CK_libros_precio_positivo
 check (precio>=0);

 alter table libros
  nocheck constraint CK_libros_precio_positivo;

 insert into libros values('Java en 10 minutos',default,'Siglo XXI',-1);

 exec sp_helpconstraint libros;

 alter table libros
  check constraint CK_libros_precio_positivo;
