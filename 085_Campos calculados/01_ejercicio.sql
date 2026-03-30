--Trabajamos con la tablas "empleados".
--Eliminamos la tabla, si existe, y la creamos:

 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8),
  nombre varchar(10),
  domicilio varchar(30),
  sueldobasico decimal(6,2),
  hijos tinyint not null default 0,
  sueldototal as sueldobasico + (hijos*100)
 );
--El campo "sueldototal" es un campo calculado que suma al sueldo básico de cada empleado y la cantidad abonada por los hijos (100 por cada hijo).

--No puede ingresarse valor para dicho campo:

 insert into empleados values('22222222','Juan Perez','Colon 123',300,2);
 insert into empleados values('23333333','Ana Lopez','Sucre 234',500,0);
--Veamos los registros:

 select * from empleados;
--Veamos lo que sucede si actualizamos un registro:

 update empleados set hijos=1 where documento='23333333';
--Recuperamos los registros:

 select * from empleados;
--el campo calculado "sueldototal" recalcula los valores para cada registro automáticamente.

--Agregamos un campo calculado:

 alter table empleados
  add salariofamiliar as hijos*100;
--Veamos la estructura de la tabla:

 exec sp_columns empleados;
--Recuperemos los registros:

 select * from empleados;