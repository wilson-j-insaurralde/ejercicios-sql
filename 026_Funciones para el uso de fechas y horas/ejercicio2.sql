/*
Problema:
Trabajamos con la tabla "libros" de una librer�a.
Eliminamos la tabla si existe:

 if object_id ('libros') is not null
  drop table libros;
Creamos la tabla:

 create table libros(
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  edicion datetime,
  precio decimal(6,2)
 );
Ingresamos algunos registros:

 insert into libros 
  values('El aleph','Borges','Emece','1980/10/10',25.33);
 insert into libros 
  values('Java en 10 minutos','Mario Molina','Siglo XXI','2000/05/05',50.65);
 insert into libros 
  values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','2000/08/09',19.95);
 insert into libros 
  values('Aprenda PHP','Mario Molina','Siglo XXI','2000/02/04',45);
Mostramos el t�tulo del libro y el a�o de edici�n:

 select titulo, datepart (year,edicion) from libros;
Mostramos el t�tulo del libro y el nombre del mes de edici�n:

 select titulo, datename (month,edicion) from libros;
Mostramos el t�tulo del libro y los a�os que tienen de editados:

 select titulo, datediff(year,edicion,getdate()) from libros;
Muestre los t�tulos de los libros que se editaron el d�a 9, de cualquier mes de cualquier a�o:

 select titulo from libros
  where datepart(day,edicion)=9;
*/
 if object_id ('libros') is not null
  drop table libros;

 create table libros(
  titulo varchar(40) not null,
  autor varchar(20) default 'Desconocido',
  editorial varchar(20),
  edicion datetime,
  precio decimal(6,2)
 );

 insert into libros values('El aleph','Borges','Emece','1980/10/10',25.33);
 insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI','2000/05/05',50.65);
 insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','2000/08/09',19.95);
 insert into libros values('Aprenda PHP','Mario Molina','Siglo XXI','2000/02/04',45);

 select titulo, datepart (year,edicion) from libros;

 select titulo, datename (month,edicion) from libros;

 select titulo, datediff(year,edicion,getdate()) from libros;

 select titulo from libros
  where datepart(day,edicion)=9;
