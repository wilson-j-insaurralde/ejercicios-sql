/*
Problema:
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
  primary key (codigo)
 );
Ingresamos algunos registros:

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25.33);
 insert into libros
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65);
 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.95);
 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta',15);
Recuperamos los registros ordenados por el t�tulo:

select * from libros
 order by titulo;
Ordenamos los registros por el campo "precio", referenciando el campo por su posici�n en la lista de selecci�n:

 select titulo,autor,precio
  from libros order by 3;
Los ordenamos por "editorial", de mayor a menor empleando "desc":

 select * from libros
  order by editorial desc;
Ordenamos por dos campos:

 select * from libros
  order by titulo,editorial;
Ordenamos en distintos sentidos:

 select * from libros
  order by titulo asc, editorial desc;
Podemos ordenar por un campo que no se lista en la selecci�n:

 select titulo, autor
  from libros
  order by precio;
Est� permitido ordenar por valores calculados:

 select titulo, autor, editorial,
 precio+(precio*0.1) as 'precio con descuento'
 from libros
 order by 4;
*/

 if object_id ('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  precio decimal(6,2),
  primary key (codigo)
 );

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',25.33);
 insert into libros
  values('Java en 10 minutos','Mario Molina','Siglo XXI',50.65);
 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',19.95);
 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta',15);

select * from libros
 order by titulo;

 select titulo,autor,precio
  from libros order by 3;

 select * from libros
  order by editorial desc;

 select * from libros
  order by titulo,editorial;

 select * from libros
  order by titulo asc, editorial desc;

 select titulo, autor
  from libros
  order by precio;

 select titulo, autor, editorial,
 precio+(precio*0.1) as 'precio con descuento'
 from libros
 order by 4;
