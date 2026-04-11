--Tenemos la tabla "libros" de una librería y queremos crear una tabla llamada "editoriales" que contenga los nombres de las editoriales.
--Eliminamos las tablas "libros" y "editoriales" si existen:

 if object_id('libros')is not null
  drop table libros;
 if object_id('editoriales')is not null
  drop table editoriales;
--Creamos la tabla "libros":

 create table libros( 
  codigo int identity,
  titulo varchar(40) not null,
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2),
  primary key(codigo)
 ); 
--Ingresamos algunos registros;

 insert into libros values('Uno','Richard Bach','Planeta',15);
 insert into libros values('El aleph','Borges','Emece',25);
 insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo',18);
 insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',45);
 insert into libros values('Ilusiones','Richard Bach','Planeta',14);
 insert into libros values('Java en 10 minutos','Mario Molina','Nuevo siglo',50);
--Creamos una tabla llamada "editoriales" que contenga los nombres de las editoriales:

 select distinct editorial as nombre
  into editoriales
  from libros;
--Veamos la nueva tabla:

 select *from editoriales;
--Necesitamos una nueva tabla llamada "librosporeditorial" que contenga la cantidad de libros de cada editorial. Primero eliminamos la tabla, si existe:

 if object_id('cantidadporeditorial') is not null
  drop table cantidadporeditorial;
--Creamos la nueva tabla:

 select editorial as nombre,count(*) as cantidad
  into cantidadporeditorial
  from libros
  group by editorial;
--Veamos los registros de la nueva tabla:

 select *from cantidadporeditorial;
--La tabla "cantidadporeditorial" se ha creado con el campo llamado "nombre" seleccionado del campo "editorial" de "libros" y con el campo "cantidad" con el valor calculado con count(*) de la tabla "libros".

--Queremos una tabla llamada "ofertas4" que contenga los mismos campos que "libros" y guarde los 4 libros más económicos. Primero eliminamos, si existe, la tabla "ofertas4":

 if object_id('ofertas4') is not null
  drop table ofertas4;
--Creamos "ofertas4" e insertamos la consulta de "libros":

 select top 4 *
  into ofertas4
  from libros
  order by precio desc;
--La consulta anterior retorna los 4 primeros libros de la tabla "libros", ordenados en forma ascendente por precio y los almacena en la nueva tabla ("ofertas4"). Note que no se listan los campos a extraer, se coloca un asterisco para indicar que se incluyen todos los campos.

--Veamos los registros de la nueva tabla:

 select *from ofertas4;
--Agregamos una columna a la tabla "editoriales" que contiene la ciudad en la cual está la casa central de cada editorial:

 alter table editoriales add ciudad varchar(30);
--Actualizamos dicho campo:

 update editoriales set ciudad='Cordoba' where nombre='Planeta';
 update editoriales set ciudad='Cordoba' where nombre='Emece';
 update editoriales set ciudad='Buenos Aires' where nombre='Nuevo siglo';
--Queremos una nueva tabla llamada "librosdecordoba" que contenga los títulos y autores de los libros de editoriales de Cordoba. En primer lugar, la eliminamos, si existe:

 if object_id('librosdecordoba') is not null
  drop table librosdecordoba;
--Consultamos las 2 tablas y guardamos el resultado en la nueva tabla que estamos creando:

 select titulo,autor
  into librosdecordoba
  from libros
  join editoriales
  on editorial=nombre 
  where ciudad='Cordoba';
--Consultamos la nueva tabla:

 select *from librosdecordoba;