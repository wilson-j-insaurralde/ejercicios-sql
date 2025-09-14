/*
Trabajamos con la tabla "libros" de una librer�a.
Eliminamos la tabla si existe:

 if object_id ('libros') is not null
  drop table libros;
Creamos la tabla:

 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
 );
Ingresamos algunos registros:

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25);
 insert into libros
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);
Mostramos s�lo los 12 primeros caracteres de los t�tulos de los libros y sus autores, empleando la funci�n "substring()":

 select substring(titulo,1,12) as titulo
  from libros;
Mostramos s�lo los 12 primeros caracteres de los t�tulos de los libros y sus autores, ahora empleando la funci�n "left()":

 select left(titulo,12) as titulo
  from libros;
Mostramos los t�tulos de los libros y sus precios convirtiendo este �ltimo a cadena de caracteres con un solo decimal, empleando la funci�n "str":

 select titulo,
  str(precio,6,1)
  from libros;
Mostramos los t�tulos de los libros y sus precios convirtiendo este �ltimo a cadena de caracteres especificando un solo argumento:

 select titulo,
  str(precio)
  from libros;
Se redondea a entero.

Mostramos los t�tulos, autores y editoriales de todos libros, al �ltimo campo lo queremos en may�sculas:

  select titulo, autor, upper(editorial)
   from libros;

*/

 if object_id ('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  cantidad tinyint default 0,
  primary key (codigo)
 );

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25);
 insert into libros
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
 insert into libros (titulo,autor,editorial,precio,cantidad)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

 select substring(titulo,1,12) as titulo
  from libros;

 select left(titulo,12) as titulo
  from libros;

 select titulo,
  str(precio,6,1)
  from libros;

 select titulo,
  str(precio)
  from libros;

  select titulo, autor, upper(editorial)
   from libros;
