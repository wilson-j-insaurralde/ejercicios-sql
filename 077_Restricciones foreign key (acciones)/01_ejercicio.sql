--Una librería almacena la información de sus libros para la venta en dos tablas, "libros" y "editoriales".
--Eliminamos ambas tablas, si existen:

 if object_id('libros') is not null
  drop table libros;
 if object_id('editoriales') is not null
  drop table editoriales;
--Creamos las tablas:

 create table libros(
  codigo int not null,
  titulo varchar(40),
  autor varchar(30),
  codigoeditorial tinyint,
  primary key (codigo)
 );
 create table editoriales(
  codigo tinyint not null,
  nombre varchar(20),
  primary key (codigo)
);
--Ingresamos algunos registros en ambas tablas:

 insert into editoriales values(1,'Emece');
 insert into editoriales values(2,'Planeta');
 insert into editoriales values(3,'Siglo XXI');

 insert into libros values(1,'El aleph','Borges',1);
 insert into libros values(2,'Martin Fierro','Jose Hernandez',2);
 insert into libros values(3,'Aprenda PHP','Mario Molina',2);
--Establecemos una restricción "foreign key" para evitar que se ingrese en "libros" un código de editorial inexistente en "editoriales" con la opción "on cascade" para actualizaciones y eliminaciones:

 alter table libros
 add constraint FK_libros_codigoeditorial
  foreign key (codigoeditorial)
  references editoriales(codigo)
  on update cascade
  on delete cascade;
--Si actualizamos un valor de código de "editoriales", la modificación se extiende a todos los registros de la tabla "libros" que hacen referencia a ella en "codigoeditorial":

 update editoriales set codigo=10 where codigo=1;
--Veamos si la actualización se extendió a "libros":

 select titulo, autor, e.codigo,nombre
  from libros as l
  join editoriales as e
  on codigoeditorial=e.codigo;
--Si eliminamos una editorial, se borra tal editorial de "editoriales" y todos los registros de "libros" de dicha editorial:

 delete from editoriales where codigo=2;
--Veamos si la eliminación se extendió a "libros":

 select * from libros;