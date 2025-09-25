/*
Trabaje con la tabla "libros" de una librería.

1- Elimine la tabla si existe:
 if object_id('libros') is not null
  drop table libros;

2- Créela con los siguientes campos: titulo (cadena de 30 caracteres de longitud), autor (cadena de 
20), editorial (cadena de 15) y precio (float):
 create table libros (
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15),
  precio float
 );

3- Ingrese los siguientes registros:
 insert into libros (titulo, autor, editorial, precio)
  values ('El aleph','Borges','Emece',25.00);
 insert into libros (titulo, autor, editorial, precio)
  values ('Martin Fierro','Jose Hernandez','Planeta',35.50);
 insert into libros (titulo, autor, editorial, precio)
  values ('Aprenda PHP','Mario Molina','Emece',45.50);
 insert into libros (titulo, autor, editorial, precio)
  values ('Cervantes y el quijote','Borges','Emece',25);
 insert into libros (titulo, autor, editorial, precio)
  values ('Matematica estas ahi','Paenza','Siglo XXI',15);

4- Muestre todos los registros (5 registros):
 select * from libros;

5- Modifique los registros cuyo autor sea igual  a "Paenza", por "Adrian Paenza" (1 registro 
afectado)
 update libros set autor='Adrian Paenza'
  where autor='Paenza';

6- Nuevamente, modifique los registros cuyo autor sea igual  a "Paenza", por "Adrian Paenza" (ningún 
registro afectado porque ninguno cumple la condición)
 update libros set autor='Adrian Paenza'
  where autor='Paenza';

7- Actualice el precio del libro de "Mario Molina" a 27 pesos (1 registro afectado):
 update libros set precio=27
 where autor='Mario Molina';

8- Actualice el valor del campo "editorial" por "Emece S.A.", para todos los registros cuya 
editorial sea igual a "Emece" (3 registros afectados):
 update libros set editorial='Emece S.A.'
  where editorial='Emece';

9 - Luego de cada actualización ejecute un select que mustre todos los registros de la tabla.

*/
if object_id('libros') is not null
  drop table libros;

 create table libros (
  titulo varchar(30),
  autor varchar(20),
  editorial varchar(15),
  precio float
 );

 insert into libros (titulo, autor, editorial, precio)
  values ('El aleph','Borges','Emece',25.00);
 insert into libros (titulo, autor, editorial, precio)
  values ('Martin Fierro','Jose Hernandez','Planeta',35.50);
 insert into libros (titulo, autor, editorial, precio)
  values ('Aprenda PHP','Mario Molina','Emece',45.50);
 insert into libros (titulo, autor, editorial, precio)
  values ('Cervantes y el quijote','Borges','Emece',25);
 insert into libros (titulo, autor, editorial, precio)
  values ('Matematica estas ahi','Paenza','Siglo XXI',15);

 select * from libros;

 update libros set autor='Adrian Paenza'
  where autor='Paenza';

 select * from libros;

 update libros set autor='Adrian Paenza'
  where autor='Paenza';

 select * from libros;

 update libros set precio=27
 where autor='Mario Molina';

 select * from libros;

 update libros set editorial='Emece S.A.'
  where editorial='Emece';

 select * from libros;