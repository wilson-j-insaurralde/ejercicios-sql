/*
Problema:
Trabajamos con la tabla "libros" de una librer�a.
Eliminamos la tabla "libros", si existe:

 if object_id('libros') is not null
  drop table libros;
Creamos la tabla especificando que el campos "codigo" genere valores secuenciales comenzando en 1 e increment�ndose en 1 autom�ticamente:

 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio float
 );
Ingresamos algunos registros, recordando que si un campo tiene el atributo "identity" debemos omitirlo en la inserci�n:

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',23);
Veamos c�mo se almacen�:

 select * from libros;
Este primer registro ingresado guarda el valor 1 en el campo correspondiente al c�digo.

Continuemos ingresando registros:

 insert into libros (titulo,autor,editorial,precio)
  values('Uno','Richard Bach','Planeta',18);
 insert into libros (titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Siglo XXI',45.60);
 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de maravillas','Lewis Carroll','Paidos',15.50);
Veamos c�mo se almacenaron:

 select * from libros;
el c�digo (dato que no ingresamos) se carg� autom�ticamente siguiendo la secuencia de autoincremento.

Intentemos ingresar un valor para el campo "codigo":

 insert into libros (codigo,titulo,autor,editorial,precio)
  values(5,'Martin Fierro','Jose Hernandez','Paidos',25);
generar� un mensaje de error.

Un campo "identity" tampoco puede ser actualizado. Intentemos cambiar el valor de c�digo de un registro:

 update libros set codigo=9
  where titulo='Uno';
aparece un mensaje de error.

Vamos a ver la estructura de la tabla ejecutando el siguiente procedimiento almacenado:

 exec sp_columns libros;
Note que en el campo "codigo", en la columna "TYPE_NAME" aparece "int identity" y en la columna IS_NULLABLE" aparece "NO", porque un campo "identity" autom�ticamente se convierte en "not null". En el campo "titulo", en la columna "IS_NULLABLE" aparece "NO" porque expl�citamente indicamos que el campo fuera "not null".

Eliminemos el �ltimo registro:

 delete from libros
  where autor='Lewis Carroll';
Ingresamos un quinto registro y luego vemos que en el campo c�digo se guard� el valor secuencial sin considerar que el valor "4" ya no existe:

  insert into libros (titulo, autor, editorial, precio)
  values('Martin Fierro','Jose Hernandez','Paidos',25); 
  select * from libros;

*/
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(15),
  precio float
 );

 insert into libros (titulo,autor,editorial,precio)
  values('El aleph','Borges','Emece',23);

 select * from libros;

 insert into libros (titulo,autor,editorial,precio)
  values('Uno','Richard Bach','Planeta',18);
 insert into libros (titulo,autor,editorial,precio)
  values('Aprenda PHP','Mario Molina','Siglo XXI',45.60);
 insert into libros (titulo,autor,editorial,precio)
  values('Alicia en el pais de maravillas','Lewis Carroll','Paidos',15.50);

 select * from libros;

 insert into libros (codigo,titulo,autor,editorial,precio)
  values(5,'Martin Fierro','Jose Hernandez','Paidos',25);

 update libros set codigo=9
  where titulo='Uno';

 exec sp_columns libros;

 delete from libros
  where autor='Lewis Carroll';

  insert into libros (titulo, autor, editorial, precio)
  values('Martin Fierro','Jose Hernandez','Paidos',25); 

  select * from libros;
