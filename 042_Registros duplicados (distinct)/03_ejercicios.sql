/*
Trabajamos con la tabla "libros" de una librer�a.
Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
Creamos la tabla:

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  primary key(codigo)
 );
Ingresamos algunos registros:

 insert into libros
  values('El aleph','Borges','Planeta');
 insert into libros
  values('Martin Fierro','Jose Hernandez','Emece');
 insert into libros
  values('Martin Fierro','Jose Hernandez','Planeta');
 insert into libros
  values('Antologia poetica','Borges','Planeta');
 insert into libros
  values('Aprenda PHP','Mario Molina','Emece');
 insert into libros
  values('Aprenda PHP','Lopez','Emece');
 insert into libros
  values('Manual de PHP', 'J. Paez', null);
 insert into libros
  values('Cervantes y el quijote',null,'Paidos');
 insert into libros
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Emece');
 insert into libros
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece');
 insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos');
 insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
 insert into libros
  values('PHP de la A a la Z',null,null);
 insert into libros
  values('Uno','Richard Bach','Planeta');
Para obtener la lista de autores sin repetici�n tipeamos:

 select distinct autor from libros;
Note que aparece "null" como un valor para "autor"� Para obtener la lista de autores conocidos, es decir, no incluyendo "null" en la lista:

 select distinct autor from libros
  where autor is not null;
Contamos los distintos autores:

 select count(distinct autor)
  from libros;
Queremos los nombres de las editoriales sin repetir:

 select distinct editorial from libros;
Queremos saber la cantidad de editoriales distintas:

 select count(distinct editorial) from libros;
La combinamos con "where" para obtener los distintos autores de la editorial "Planeta":

 select distinct autor from libros
  where editorial='Planeta';
Contamos los distintos autores que tiene cada editorial empleando "group by":

 select editorial,count(distinct autor)
  from libros
  group by editorial;
Mostramos los t�tulos y editoriales de los libros sin repetir t�tulos ni editoriales:

 select distinct titulo,editorial
  from libros
  order by titulo;
Note que los registros no est�n duplicados, aparecen t�tulos iguales pero con editorial diferente, cada registro es diferente.


*/

 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  primary key(codigo)
 );

 insert into libros
  values('El aleph','Borges','Planeta');
 insert into libros
  values('Martin Fierro','Jose Hernandez','Emece');
 insert into libros
  values('Martin Fierro','Jose Hernandez','Planeta');
 insert into libros
  values('Antologia poetica','Borges','Planeta');
 insert into libros
  values('Aprenda PHP','Mario Molina','Emece');
 insert into libros
  values('Aprenda PHP','Lopez','Emece');
 insert into libros
  values('Manual de PHP', 'J. Paez', null);
 insert into libros
  values('Cervantes y el quijote',null,'Paidos');
 insert into libros
  values('Harry Potter y la piedra filosofal','J.K. Rowling','Emece');
 insert into libros
  values('Harry Potter y la camara secreta','J.K. Rowling','Emece');
 insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos');
 insert into libros
  values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
 insert into libros
  values('PHP de la A a la Z',null,null);
 insert into libros
  values('Uno','Richard Bach','Planeta');

 select distinct autor from libros;

 select distinct autor from libros
  where autor is not null;

 select count(distinct autor)
  from libros;

 select distinct editorial from libros;

 select count(distinct editorial) from libros;

 select distinct autor from libros
  where editorial='Planeta';

 select editorial,count(distinct autor)
  from libros
  group by editorial;

 select distinct titulo,editorial
  from libros
  order by titulo;