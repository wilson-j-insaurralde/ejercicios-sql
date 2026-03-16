--Una librería almacena la información de sus libros para la venta en dos tablas, "libros" y "editoriales".

--Eliminamos ambas tablas, si existen:

 if object_id('libros') is not null
  drop table libros;
 if object_id('editoriales') is not null
  drop table editoriales;
--Creamos las tablas:

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30) default 'Desconocido',
  codigoeditorial tinyint not null,
  precio decimal(5,2)
 );
 create table editoriales(
  codigo tinyint identity,
  nombre varchar(20),
  primary key (codigo)
);
--Ingresamos algunos registros en ambas tablas:

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Siglo XXI');

 insert into libros values('El aleph','Borges',2,20);
 insert into libros values('Martin Fierro','Jose Hernandez',1,30);
 insert into libros values('Aprenda PHP','Mario Molina',3,50);
 insert into libros values('Java en 10 minutos',default,3,45);
--Recuperamos los datos de libros:

 select * from libros;
--vemos que en el campo "editorial" aparece el código, pero no sabemos el nombre de la editorial.

--Realizamos un join para obtener datos de ambas tablas (titulo, autor y nombre de la editorial):

 select titulo, autor, nombre
  from libros
  join editoriales
  on codigoeditorial=editoriales.codigo;
--Mostramos el código del libro, título, autor, nombre de la editorial y el precio realizando un join y empleando alias:

 select l.codigo,titulo,autor,nombre,precio
  from libros as l
  join editoriales as e
  on codigoeditorial=e.codigo;
--Note que al listar el campo "codigo" especificamos a qué tabla pertenece; si no lo hacemos SQL Server no sabrá si nos referimos al de la tabla "libros" o "editoriales". Los demás campos no tienen referencia a la tabla porque tienen nombres que no se repiten.

--Realizamos la misma consulta anterior agregando un "where" para obtener solamente los libros de la editorial "Siglo XXI":

 select l.codigo,titulo,autor,nombre,precio
  from libros as l
  join editoriales as e
  on codigoeditorial=e.codigo
  where e.nombre='Siglo XXI';
--Obtenemos título, autor y nombre de la editorial, esta vez ordenados por título:

 select titulo,autor,nombre
  from libros as l
  join editoriales as e
  on codigoeditorial=e.codigo
  order by titulo;