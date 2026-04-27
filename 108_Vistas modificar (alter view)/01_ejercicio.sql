--Problema:
--Una empresa almacena la información de sus empleados en dos tablas llamadas "empleados" y "secciones".
--Eliminamos las tablas, si existen:

 if object_id('empleados') is not null
  drop table empleados;
 if object_id('secciones') is not null
  drop table secciones;
--Creamos las tablas:

 create table secciones(
  codigo tinyint identity,
  nombre varchar(20),
  constraint PK_secciones primary key (codigo)
 );

 create table empleados(
  legajo int identity,
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  seccion tinyint not null,
  constraint FK_empleados_seccion
   foreign key (seccion)
   references secciones(codigo)
   on update cascade,
  constraint PK_empleados
   primary key (documento)
);
--Ingresamos algunos registros:

 insert into secciones values('Administracion');
 insert into secciones values('Contaduría');
 insert into secciones values('Sistemas');

 insert into empleados values('22222222','Lopez Ana','Colon 123',1);
 insert into empleados values('23333333','Lopez Luis','Sucre 235',1);
 insert into empleados values('24444444','Garcia Marcos','Sarmiento 1234',2);
 insert into empleados values('25555555','Gomez Pablo','Bulnes 321',3);
 insert into empleados values('26666666','Perez Laura','Peru 1254',3);
--Eliminamos la vista "vista_empleados" si existe:

 if object_id('vista_empleados') is not null
  drop view vista_empleados;
--Creamos la vista "vista_empleados" encriptada que muestre algunos campos de los empleados de la sección 1 y colocamos "with check option":

 create view vista_empleados
  with encryption
 as
  select documento,nombre,seccion
  from empleados
  where seccion=1
  with check option;
--Consultamos la vista:

 select *from vista_empleados;
--Veamos el texto de la vista:

 sp_helptext vista_empleados;
--No lo permite porque está encriptada.

--Si intentamos modificar la sección de un empleado desde la vista la opción "with check option" no lo permite.

--Modificamos la vista para que muestre el domicilio y no colocamos la opción de encriptación ni "with check option":

 alter view vista_empleados
 as
  select documento,nombre,seccion, domicilio
  from empleados
  where seccion=1;
--Consultamos la vista para ver si se modificó:

 select *from vista_empleados;
--Aparece el nuevo campo.

--Veamos el texto de la vista:

 exec sp_helptext vista_empleados;
--Lo permite porque ya no está encriptada.

--Actualizamos la sección de un empleado:

 update vista_empleados set seccion=2 where documento='22222222';
--Si se permite porque la opción "with check option" se quitó de la vista.

--Consultamos la vista:

 select * from vista_empleados;
--Note que el registro modificado ya no aparece porque no pertenece a la sección 1.

--Eliminamos la vista "vista_empleados2" si existe:

 if object_id('vista_empleados2') is not null
  drop view vista_empleados2;
--Creamos la vista "vista_empleados2" que muestre todos los campos de la tabla "empleados":

 create view vista_empleados2
 as
  select * from empleados;
--Consultamos la vista:

 select * from vista_empleados2;
--Agregamos un campo a la tabla "empleados":

 alter table empleados
 add sueldo decimal(6,2);
--Consultamos la vista "vista_empleados2":

 select * from vista_empleados2;
--Note que el nuevo campo agregado a "empleados" no aparece, a pesar que la vista indica que muestre todos los campos de dicha tabla; esto sucede porque los campos se seleccionan al ejecutar "create view", para que aparezcan debemos alterar la vista:

 alter view vista_empleados2
 as
  select * from empleados;
--Consultemos la vista:

 select * from vista_empleados2; 
