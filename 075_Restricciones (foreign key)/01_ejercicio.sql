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
  autor varchar(30),
  codigoeditorial tinyint
 );
 create table editoriales(
  codigo tinyint,
  nombre varchar(20),
  primary key (codigo)
);
--Ingresamos algunos registros en ambas tablas:
 insert into editoriales values(1,'Emece');
 insert into editoriales values(2,'Planeta');
 insert into editoriales values(3,'Siglo XXI');

 insert into libros values('El aleph','Borges',1);
 insert into libros values('Martin Fierro','Jose Hernandez',2);
 insert into libros values('Aprenda PHP','Mario Molina',2);
--Agregamos una restricción "foreign key" a la tabla "libros":

 alter table libros
 add constraint FK_libros_codigoeditorial
  foreign key (codigoeditorial)
  references editoriales(codigo);
--Ingresamos un libro sin especificar valores:
 insert into libros default values;
--Note que en "codigoeditorial" almacenó "null", porque esta restricción permite valores nulos (a menos que se haya especificado lo contrario al definir el campo).

--Veamos las restricciones de "libros":
 exec sp_helpconstraint libros;
--aparece la restricción "foreign key".
--Veamos las restricciones de "editoriales":
 exec sp_helpconstraint editoriales;
--aparece la restricción "primary key" y nos informa que la tabla es rerenciada por una "foreign key" de la tabla "libros" llamada "FK_libros_codigoeditorial".