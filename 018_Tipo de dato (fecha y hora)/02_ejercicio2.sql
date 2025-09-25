/*
Problema:
Una empresa almacena los datos de sus empleados en una tabla "empleados".
Eliminamos la tabla, si existe:

 if object_id('empleados') is not null
  drop table empleados;
Creamos la tabla eligiendo el tipo de dato adecuado para cada campo:

 create table empleados(
  nombre varchar(20),
  documento char(8),
  fechaingreso datetime
 );
Seteamos el formato de la fecha para que guarde día, mes y año:

 set dateformat dmy;
Ingresamos algunos registros:

 insert into empleados values('Ana Gomez','22222222','12-01-1980');
 insert into empleados values('Bernardo Huerta','23333333','15-03-81');
 insert into empleados values('Carla Juarez','24444444','20/05/1983');
 insert into empleados values('Daniel Lopez','25555555','2.5.1990');
El segundo registro ingresado tiene 2 dígitos correspondientes al año; en el tercero empleamos la barra ('/') como separador y en el cuarto empleamos como separador el punto ('.') y colocamos un sólo dígito en la part del día y el mes.

Recuperamos los registros:

 select * from empleados;
Note que el formato de visualización es "y-m-d".

Mostramos los datos de los empleados cuya fecha de ingreso es anterior a '01-01-1985':

 select * from empleados where fechaingreso<'01-01-1985';
Actualizamos el nombre a "Maria Carla Juarez' del empleado cuya fecha de ingreso es igual a '20/05/1983':

 update empleados set nombre='Maria Carla Juarez' where fechaingreso='20.5.83';
Veamos si se actualizó:

 select * from empleados;
Borramos los empleados cuya fecha de ingreso es distinta a '20.5.83':

 delete from empleados where fechaingreso<>'20/05/1983';
Veamos si se eliminaron:

 select * from empleados;
*/
 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  nombre varchar(20),
  documento char(8),
  fechaingreso datetime
 );

 set dateformat dmy;

 insert into empleados values('Ana Gomez','22222222','12-01-1980');
 insert into empleados values('Bernardo Huerta','23333333','15-03-81');
 insert into empleados values('Carla Juarez','24444444','20/05/1983');
 insert into empleados values('Daniel Lopez','25555555','2.5.1990');

 select * from empleados;

 select * from empleados where fechaingreso<'01-01-1985';

 update empleados set nombre='Maria Carla Juarez' where fechaingreso='20.5.83';

 select * from empleados;

 delete from empleados where fechaingreso<>'20/05/1983';

 select * from empleados;
