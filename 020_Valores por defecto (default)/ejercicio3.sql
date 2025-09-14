/*
Trabajamos con la tabla "libros" de una librería.
Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
Creamos la tabla definiendo un valor por defecto para el campo "autor" y otro para el campo "cantidad":

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) not null default 'Desconocido', 
  editorial varchar(20),
  precio decimal(5,2),
  cantidad tinyint default 0
 );
Ingresamos un registro omitiendo los valores para el campo "autor" y "cantidad":

 insert into libros (titulo,editorial,precio)
  values('Java en 10 minutos','Paidos',50.40);
SQL Server ingresará el registro con el siguiente valor de la secuencia en "codigo", con el título, editorial y precio ingresados, en "autor" colocará "Desconocido" y en cantidad "0":

 select * from libros;
Si ingresamos un registro sin valor para el campo "precio", que admite valores nulos, se ingresará "null" en ese campo:

 insert into libros (titulo,editorial)
  values('Aprenda PHP','Siglo XXI');
 select *from libros;
Visualicemos la estructura de la tabla:

 exec sp_columns libros;
La columna "COLUMN_DEF", muestra el valor por defecto de cada campo.

Podemos emplear "default" para dar el valor por defecto a algunos campos:

 insert into libros (titulo,autor,precio,cantidad)
  values ('El gato con botas',default,default,100);
 select * from libros;
Como todos los campos de "libros" tienen valores predeterminados, podemos tipear:

 insert into libros default values;
 select * from libros;
La sentencia anterior almacenará un registro con los valores predetermiandos para cada uno de sus campos.

Que un campo tenga valor por defecto no significa que no admita valores nulos, puede o no admitirlos. Podemos ingresar el valor "null" en el campo "cantidad":

 insert into libros (titulo,autor,cantidad)
  values ('Alicia en el pais de las maravillas','Lewis Carroll',null);

*/

 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) not null default 'Desconocido', 
  editorial varchar(20),
  precio decimal(5,2),
  cantidad tinyint default 0
 );

 insert into libros (titulo,editorial,precio)
  values('Java en 10 minutos','Paidos',50.40);

 select * from libros;

 insert into libros (titulo,editorial)
  values('Aprenda PHP','Siglo XXI');
 select * from libros;

 exec sp_columns libros;

 insert into libros (titulo,autor,precio,cantidad)
  values ('El gato con botas',default,default,100);
 select *from libros;

 insert into libros default values;
 select * from libros;

 insert into libros (titulo,autor,cantidad)
  values ('Alicia en el pais de las maravillas','Lewis Carroll',null);