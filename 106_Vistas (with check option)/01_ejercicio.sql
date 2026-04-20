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
  sueldo decimal(5,2)
   constraint CK_secciones_sueldo check (sueldo>=0),
  constraint PK_secciones primary key (codigo)
 );

 create table empleados(
  legajo int identity,
  documento char(8)
   constraint CK_empleados_documento check (documento like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  sexo char(1)
   constraint CK_empleados_sexo check (sexo in ('f','m')),
  apellido varchar(20),
  nombre varchar(20),
  domicilio varchar(30),
  seccion tinyint not null,
  cantidadhijos tinyint
   constraint CK_empleados_hijos check (cantidadhijos>=0),
  estadocivil char(10)
   constraint CK_empleados_estadocivil check (estadocivil in ('casado','divorciado','soltero','viudo')),
  fechaingreso datetime,
   constraint PK_empleados primary key (legajo),
  constraint FK_empleados_seccion
   foreign key (seccion)
   references secciones(codigo)
   on update cascade,
  constraint UQ_empleados_documento
   unique(documento)
 );
--Ingresamos algunos registros:

 insert into secciones values('Administracion',300);
 insert into secciones values('Contaduría',400);
 insert into secciones values('Sistemas',500);

 insert into empleados values('22222222','f','Lopez','Ana','Colon 123',1,2,'casado','1990-10-10');
 insert into empleados values('23333333','m','Lopez','Luis','Sucre 235',1,0,'soltero','1990-02-10');
 insert into empleados values('24444444','m','Garcia','Marcos','Sarmiento 1234',2,3,'divorciado','1998-07-12');
 insert into empleados values('25555555','m','Gomez','Pablo','Bulnes 321',3,2,'casado','1998-10-09');
 insert into empleados values('26666666','f','Perez','Laura','Peru 1254',3,3,'casado','2000-05-09');
--Eliminamos la vista "vista_empleados" si existe:

 if object_id('vista_empleados') is not null
  drop view vista_empleados;
 
--Creamos la vista "vista_empleados", que es resultado de una combinación:

--Es posible obligar a todas las instrucciones de modificación de datos que se ejecutan en una vista a cumplir ciertos criterios.
--Por ejemplo, creamos la siguiente vista:

 create view vista_empleados
 as
  select apellido, e.nombre, sexo, s.nombre as seccion
  from empleados as e
  join secciones as s
  on seccion=codigo
  where s.nombre='Administracion'
  with check option;
--Consultamos la vista:

 select * from vista_empleados;
--Actualizamos el nombre de un empleado a través de la vista:

 update vista_empleados set nombre='Beatriz' where nombre='Ana';
--Veamos si la modificación se realizó en la tabla:

 select * from empleados;