--Trabajamos con las tablas "libros" y "editoriales" de una librería.
--Eliminamos las tablas si existen y las creamos:

 if object_id('libros') is not null
  drop table libros;
 if object_id('editoriales') is not null
  drop table editoriales;

 create table editoriales(
  codigo tinyint identity,
  nombre varchar(30),
  primary key (codigo)
 );
 
 create table libros (
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial tinyint,
  precio decimal(5,2),
  primary key(codigo),
 constraint FK_libros_editorial
   foreign key (codigoeditorial)
   references editoriales(codigo)
   on update cascade,
 );
--Ingresamos algunos registros:

 insert into editoriales values('Planeta');
 insert into editoriales values('Emece');
 insert into editoriales values('Paidos');
 insert into editoriales values('Siglo XXI');

 insert into libros values('Uno','Richard Bach',1,15);
 insert into libros values('Ilusiones','Richard Bach',4,18);
 insert into libros values('Puente al infinito','Richard Bach',2,20);
 insert into libros values('Aprenda PHP','Mario Molina',4,40);
 insert into libros values('El aleph','Borges',2,10);
 insert into libros values('Antología','Borges',1,20);
 insert into libros values('Cervantes y el quijote','Borges',3,25);
--Mostramos los títulos de los libros de "Borges" de editoriales que han publicado también libros de "Richard Bach":

 select titulo
  from libros
  where autor like '%Borges%' and
  codigoeditorial = any
   (select e.codigo
    from editoriales as e
    join libros as l
    on codigoeditorial=e.codigo
    where l.autor like '%Bach%');
--Realizamos la misma consulta pero empleando "all" en lugar de "any":

 select titulo
  from libros
  where autor like '%Borges%' and
  codigoeditorial = all
   (select e.codigo
    from editoriales as e
    join libros as l
    on codigoeditorial=e.codigo
    where l.autor like '%Bach%');
--Mostramos los títulos y precios de los libros "Borges" cuyo precio supera a ALGUN precio de los libros de "Richard Bach":

 select titulo,precio
  from libros
  where autor like '%Borges%' and
  precio > any
   (select precio
    from libros
    where autor like '%Bach%');
--Veamos la diferencia si empleamos "all" en lugar de "any":

 select titulo,precio
  from libros
  where autor like '%Borges%' and
  precio > all
   (select precio
    from libros
    where autor like '%Bach%');
--Empleamos la misma subconsulta para eliminación:

 delete from libros
  where autor like '%Borges%' and
  precio > all
   (select precio
    from libros
    where autor like '%Bach%');