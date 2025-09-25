/*
Trabajamos con la tabla "libros" de una librer�a.
Eliminamos la tabla "libros", si existe:

 if object_id('libros') is not null
  drop table libros;
Creamos la tabla especificando que el campos "codigo" genere valores secuenciales comenzando en 100 e increment�ndose en 2 autom�ticamente:

 create table libros(
  codigo int identity(100,2),
  titulo varchar(20),
  autor varchar(30),
  precio float
 );
Ingresamos algunos registros, recordando que si un campo tiene el atributo "identity" debemos omitirlo en la inserci�n:

 insert into libros (titulo,autor,precio)
  values('El aleph','Borges',23);
 insert into libros (titulo,autor,precio)
  values('Uno','Richard Bach',18);
 insert into libros (titulo,autor,precio)
  values('Aprenda PHP','Mario Molina',45.60);
Veamos c�mo se almacenaron:

 select * from libros;
el c�digo (dato que no ingresamos) se carg� autom�ticamente, inici�ndose en 100 y siguiendo la secuencia de autoincremento (2).

Para saber cu�l es el valor de inicio del campo "identity" de la tabla "libros" tipeamos:

select ident_seed('libros');
retorna "2".

Si intentamos ingresar un valor para el campo "codigo":

 insert into libros (codigo,titulo,autor,precio)
  values(106,'Martin Fierro','Jose Hernandez',25);
generar� un mensaje de error.

Para permitir ingresar un valor en un campo de identidad activamos la opci�n "identity_insert":

 set identity_insert libros on;
Recordemos que si "identity_insert" est� en ON, la instrucci�n "insert" DEBE explicitar un valor:

 insert into libros (codigo,titulo,autor)
 values (100,'Matematica estas ahi','Paenza');
Note que ingresamos un valor de c�digo que ya existe; esto est� permitido porque el atributo "identity" no implica unicidad.

Ingresamos otro registro:

 insert into libros (codigo,titulo,autor)
 values (1,'Ilusiones','Richard Bach');
Note que ingresamos un valor de c�digo menor al valor de inicio de la secuencia, est� permitido.

Si no se coloca un valor para el campo de identidad, la sentencia no se ejecuta y aparece un mensaje de error:

 insert into libros (titulo,autor)
 values ('Uno','Richard Bach');
Para desactivar la opci�n "identity_insert" tipeamos:

 set identity_insert libros off;
Intentemos ingresar un valor para el campo "codigo":

 insert into libros (codigo,titulo,autor)
 values (300,'Uno','Richard Bach');
aparece un mensaje de error.
*/

 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity(100,2),
  titulo varchar(20),
  autor varchar(30),
  precio float
 );

 insert into libros (titulo,autor,precio)
  values('El aleph','Borges',23);
 insert into libros (titulo,autor,precio)
  values('Uno','Richard Bach',18);
 insert into libros (titulo,autor,precio)
  values('Aprenda PHP','Mario Molina',45.60);

 select * from libros;

select ident_seed('libros');

 insert into libros (codigo,titulo,autor,precio)
  values(106,'Martin Fierro','Jose Hernandez',25);

 set identity_insert libros on;

 insert into libros (codigo,titulo,autor)
 values (100,'Matematica estas ahi','Paenza');

 insert into libros (codigo,titulo,autor)
 values (1,'Ilusiones','Richard Bach');

 insert into libros (titulo,autor)
 values ('Uno','Richard Bach');

 set identity_insert libros off;

 insert into libros (codigo,titulo,autor)
 values (300,'Uno','Richard Bach');
