/*
Una empresa tiene registrados datos de sus empleados en una tabla llamada "empleados".
1- Elimine la tabla si existe:
 if object_id('empleados') is not null
  drop table empleados;

2- Créela con la siguiente estructura:
 create table empleados (
  documento varchar(8) not null,
  nombre varchar(30),
  seccion varchar(20)
 );

3- Ingrese algunos registros, dos de ellos con el mismo número de documento:
 insert into empleados
  values ('22222222','Alberto Lopez','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','Administracion');
 insert into empleados
  values ('23333333','Carlos Fuentes','Administracion');

4- Intente establecer una restricción "primary key" para la tabla para que el documento no se repita 
ni admita valores nulos:
 alter table empleados
 add constraint PK_empleados_documento
 primary key(documento);
No lo permite porque la tabla contiene datos que no cumplen con la restricción, debemos eliminar (o 
modificar) el registro que tiene documento duplicado:
 delete from empleados
  where nombre='Carlos Fuentes';

5- Establezca la restricción "primary key" del punto 4.

6- Intente actualizar un documento para que se repita.
No lo permite porque va contra la restricción.

7-Intente establecer otra restricción "primary key" con el campo "nombre".
No lo permite, sólo puede haber una restricción "primary key" por tabla.

8- Intente ingresar un registro con valor nulo para el documento.
No lo permite porque la restricción no admite valores nulos.

9- Establezca una restricción "default" para que almacene "00000000" en el documento en caso de 
omitirlo en un "insert".

10- Ingrese un registro sin valor para el documento.

11- Vea el registro:
 select * from empleados;

12- Intente ingresar otro empleado sin documento explícito.
No lo permite porque se duplicaría la clave.

13- Vea las restricciones de la tabla empleados (2 filas):
 exec sp_helpconstraint empleados;
*/

if OBJECT_ID('empleados') is not null 
	drop table empleados; 

	create table empleados
	(
	  documento varchar(8) not null,
      nombre varchar(30),
      seccion varchar(20)	
	);

	 insert into empleados
  values ('22222222','Alberto Lopez','Sistemas');
 insert into empleados
  values ('23333333','Beatriz Garcia','Administracion');
 insert into empleados
  values ('23333333','Carlos Fuentes','Administracion');

  delete from empleados where nombre='Carlos Fuentes';
  alter table empleados 
  add constraint PK_empleados_documento
  primary key(documento);

  -- update empleados set documento='22222222'
  -- where documento='23333333';
 -- alter table empleados 
 -- add constraint PK_empleados_nombre
  --primary key(nombre);
   --insert into empleados values(null,'Marcelo Juarez','Sistemas');
   alter table empleados 
   add constraint DF_empleados_documento_default
   default '00000000' for documento;

    insert into empleados (nombre,seccion) values('Luis Luque','Sistemas'); 
	 select * from empleados;
	 -- insert into empleados (nombre,seccion) values('Ana Fuentes','Sistemas'); 

	  exec sp_helpconstraint empleados;