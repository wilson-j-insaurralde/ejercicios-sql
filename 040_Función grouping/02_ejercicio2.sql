/*
Problema:
Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.
Eliminamos la tabla si existe:


 if object_id('visitantes') is not null
  drop table visitantes;
La creamos con la siguiente estructura:

 create table visitantes(
  nombre varchar(30),
  sexo char(1),
  ciudad varchar(20)
 );
Ingresamos algunos registros:

 insert into visitantes values('Susana Molina', 'f', 'Cordoba');
 insert into visitantes values('Marcela Mercado', 'f','Cordoba');
 insert into visitantes values('Roberto Perez','f',null);
 insert into visitantes values('Alberto Garcia','m','Cordoba');
 insert into visitantes values('Teresa Garcia','f','Alta Gracia');
Contamos la cantidad de visitantes agrupando por ciudad y empleando "rollup":

 select ciudad,
  count(*) as cantidad
  from visitantes
  group by ciudad
  with rollup;
Note que la última fila es la de resumen generada por "rollup", pero no es sencillo distinguirla de la primera fila, en la cual "null" es un valor del campo. Para diferenciarla empleamos "grouping":

 select ciudad,
  count(*) as cantidad,
  grouping(ciudad) as resumen
  from visitantes
  group by ciudad
  with rollup;
Note que la última fila contiene en la columna generada por "grouping" el valor 1, indicando que es la fila de resumen generada por "rollup"; la primera fila, contiene en dicha columna el valor 0, lo cual indica que el valor "null" es un valor del campo "ciudad".
*/
 if object_id('visitantes') is not null
  drop table visitantes;

 create table visitantes(
  nombre varchar(30),
  sexo char(1),
  ciudad varchar(20)
 );

 insert into visitantes values('Susana Molina', 'f', 'Cordoba');
 insert into visitantes values('Marcela Mercado', 'f','Cordoba');
 insert into visitantes values('Roberto Perez','f',null);
 insert into visitantes values('Alberto Garcia','m','Cordoba');
 insert into visitantes values('Teresa Garcia','f','Alta Gracia');

 select ciudad,
  count(*) as cantidad
  from visitantes
  group by ciudad
  with rollup;

 select ciudad,
  count(*) as cantidad,
  grouping(ciudad) as resumen
  from visitantes
  group by ciudad
  with rollup;