/*
Trabajamos con la tabla "libros" de una librería.
Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
Creamos la tabla con la siguiente estructura:

 create table libros(
  codigo smallint identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio smallmoney,
  cantidad tinyint
 );
Note que definimos el campo "codigo" de tipo "smallint", esto es porque estimamos que no tendremos más de 30000 libros. Si necesitáramos un rango mayor podemos emplear "int".

Como en el campo "precio" no almacenaremos valores mayores a 200000, definimos el campo de tipo "smallmoney".

También podemos definirlo de tipo "decimal(5,2)" porque el máximo precio no superará los 999.99.

El tipo "float" no es el más adecuado para representar precios porque no es exacto y muestra muchos decimales innecesarios.

Como los valores para el campo "cantidad" no superarán los 255, definimos el campo de tipo "tinyint". Si estimamos que tendremos más cantidad de libros podemos emplear "smallint" que tiene un rango mayor; no es adecuado usar int (cuyo rango llega hasta 4000 millones aprox.), porque ocuparíamos más espacio (4 bytes).

Analicemos la inserción de datos numéricos.

Intentemos ingresar un valor fuera del rango definido, una cantidad que supera el rango del tipo "tinyint", el valor 260:

 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('El aleph','Borges','Emece',25.60,260);
aparece un mensaje de error y la inserción no se ejecuta.

Intentamos ingresar un precio que supera el rango del tipo "smallmoney", el valor 250000:

 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('El aleph','Borges','Emece',250000,100);
aparece un mensaje de error y la instrucción no se ejecuta.

Intentamos ingresar una cadena que SQL Server no pueda convertir a valor numérico en el campo "precio" (error):

 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Uno','Richard Bach','Planeta','a50.30',100);
Ingresamos una cadena en el campo "cantidad":

 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Uno','Richard Bach','Planeta',50.30,'100');
*/
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo smallint identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio smallmoney,
  cantidad tinyint
 );

 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('El aleph','Borges','Emece',25.60,260);

 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('El aleph','Borges','Emece',250000,100);

 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Uno','Richard Bach','Planeta','a50.30',100);

 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Uno','Richard Bach','Planeta',50.30,'100');

 select * from libros;