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
--Ingresamos algunos registros:

 insert into editoriales values(1,'Planeta');
 insert into editoriales values(2,'Emece');
 insert into editoriales values(3,'Paidos');

 insert into libros values(1,'Uno','Richard Bach',1);
 insert into libros values(2,'El aleph','Borges',2);
 insert into libros values(3,'Aprenda PHP','Mario Molina',5);
--Agregamos una restricción "foreign key" a la tabla "libros" para evitar que se ingresen códigos de editoriales inexistentes en "editoriales". Incluimos la opción "with nocheck" para evitar la comprobación de la restricción en los datos existentes (note que hay un libro que tiene un código de editorial inválido):

 alter table libros
  with nocheck
  add constraint FK_libros_codigoeditorial
  foreign key (codigoeditorial)
  references editoriales(codigo);
--La deshabilitación de la comprobación de la restricción no afecta a los siguientes ingresos, modificaciones y actualizaciones. Para poder ingresar, modificar o eliminar datos a una tabla sin que SQL Server compruebe la restricción debemos deshabilitarla:

 alter table libros
  nocheck constraint FK_libros_codigoeditorial;
--Veamos si la restricción está habilitada o no:

exec sp_helpconstraint libros;
--En la columna "status_enabled" de la restricción "foreign key" aparece "Disabled".

--Veamos las restricciones de "editoriales":

exec sp_helpconstraint editoriales;
--Aparece la restricción "primary key" y nos informa que hay una restricción "foreign key" que hace referencia a ella de la tabla "libros" (aunque esté deshabilitada).

--Ahora podemos ingresar un registro en "libros" con código inválido:

 insert into libros values(4,'Ilusiones','Richard Bach',6);
--También podemos modificar:

 update editoriales set codigo=8 where codigo=1;
--También realizar eliminaciones:

 delete from editoriales where codigo=2;
--Habilitamos la restricción:

 alter table libros
  check constraint FK_libros_codigoeditorial;
--Veamos si la restricción está habilitada o no:

 exec sp_helpconstraint libros;
--En la columna "status_enabled" aparece "Enabled".

--Eliminamos la restricción:

 alter table libros
  drop constraint FK_libros_codigoeditorial;
--Ejecutamos el procedimiento almacenado sp_helpconstraint para ver si la restricción se eliminó:

 exec sp_helpconstraint libros;
--No aparece la restricción "foreign key".

--Vemos las restricciones de "editoriales":

 exec sp_helpconstraint editoriales;
--No aparece la restricción "foreign key" que hace referencia a esta tabla.