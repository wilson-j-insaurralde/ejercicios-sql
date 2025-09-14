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
  primary key(codigo)
 );
Ingresamos algunos registros:

 insert into libros
  values('El aleph','Borges','Emece',15.90);
 insert into libros
  values('Antolog�a po�tica','J. L. Borges','Planeta',null);
 insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
 insert into libros
  values('Matematica estas ahi','Paenza','Siglo XXI',15);
 insert into libros
  values('Martin Fierro','Jose Hernandez',default,40);
 insert into libros
  values('Aprenda PHP','Mario Molina','Nuevo siglo',56.50);
Recuperamos todos los libros que contengan en el campo "autor" la cadena "Borges":

 select * from libros
  where autor like '%Borges%';
Seleccionamos los libros cuyos t�tulos comienzan con la letra "M":

 select * from libros
  where titulo like 'M%';
Seleccionamos todos los t�tulos que NO comienzan con "M":

 select * from libros
  where titulo not like 'M%';
Si queremos ver los libros de "Lewis Carroll" pero no recordamos si se escribe "Carroll" o "Carrolt", podemos emplear el comod�n "_" (gui�n bajo) y establecer la siguiente condici�n:

 select * from libros
  where autor like '%Carrol_';
Buscamos los libros cuya editorial comienza con las letras entre la "P" y la "S":

 select titulo,autor,editorial
  from libros
  where editorial like '[P-S]%';
Seleccionamos los libros cuya editorial NO comienza con las letras "P" ni "N":

 select titulo,autor,editorial
  from libros
  where editorial like '[^PN]%';
Recuperamos todos los libros cuyo precio se encuentra entre 10.00 y 19.99:

 select titulo,precio from libros
  where precio like '1_.%';
Recuperamos los libros que NO incluyen centavos en sus precios:

 select titulo,precio from libros
  where precio like '%.00';

*/

if object_id ('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key(codigo)
 );

 insert into libros
  values('El aleph','Borges','Emece',15.90);
 insert into libros
  values('Antolog�a po�tica','J. L. Borges','Planeta',null);
 insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);
 insert into libros
  values('Matematica estas ahi','Paenza','Siglo XXI',15);
 insert into libros
  values('Martin Fierro','Jose Hernandez',default,40);
 insert into libros
  values('Aprenda PHP','Mario Molina','Nuevo siglo',56.50);

 select * from libros
  where autor like '%Borges%';

 select * from libros
  where titulo like 'M%';

 select * from libros
  where titulo not like 'M%';

 select * from libros
  where autor like '%Carrol_';

 select titulo,autor,editorial
  from libros
  where editorial like '[P-S]%';

 select titulo,autor,editorial
  from libros
  where editorial like '[^PN]%';

 select titulo,precio from libros
  where precio like '1_.%';

 select titulo,precio from libros
  where precio like '%.00';