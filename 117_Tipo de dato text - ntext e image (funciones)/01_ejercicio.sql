--Una librería almacena los datos de sus libros en una tabla llamada "libros".
--Eliminamos la tabla si existe:

 if object_id('libros') is not null
  drop table libros;
--Creamos la tabla:

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  sinopsis text
 );
--Ingresamos algunos registros:

 insert into libros values ('Ilusiones','Richard Bach','Planeta',null);
 insert into libros values ('Aprenda PHP','Mario Molina','Nuevo Siglo',
   'Para aprender PHP paso a paso');
 insert into libros values ('Programación elemental en PHP','Mario Molina','Planeta',
   'Contiene conceptos básicos de PHP');
--Veamos la longitud del campo "sinopsis" de todos los libros:

 select titulo, datalength(sinopsis) as longitud
  from libros
  order by titulo;
--Buscamos todos los libros en los cuales en su sinopsis se encuentre el texto "PHP":

 select titulo
  from libros
  where patindex('%PHP%', sinopsis)>0;
--Empleamos la función "patindex" para mostrar la posición en que se encuentra la cadena "PHP" en la sinopsis de todos los libros:

 select titulo, patindex('%PHP%', sinopsis) as posicion
  from libros;
--Note que en el libro en el cual no se encuentra, retorna "0".

--Seleccionamos los títulos y los primeros 10 caracteres de la sinopsis de cada uno de ellos:

 select titulo,substring(sinopsis,1,10) as sinopsis
  from libros;