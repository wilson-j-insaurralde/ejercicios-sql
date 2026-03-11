--Una empresa registra los datos de sus empleados en una tabla llamada "empleados".
--Eliminamos la tabla "empleados" si existe:

 if object_id ('empleados') is not null
  drop table empleados;
--También debemos eliminar los valores predeterminados con las siguientes intrucciones (en el siguiente capítulo explicaremos este tema):

 if object_id ('VP_cero') is not null
   drop default VP_cero;
 if object_id ('VP_100') is not null
   drop default VP_100;
 if object_id ('VP_datodesconocido') is not null
   drop default VP_datodesconocido;
 if object_id ('VP_telefono') is not null
   drop default VP_telefono;
--Creamos la tabla:

 create table empleados(
  nombre varchar(30),
  domicilio varchar(30),
  barrio varchar(15),
  telefono char(14),
  sueldo decimal(6,2)
 );
--Ingresamos un registro sin valores para ver qué valores por defecto se almacenan:

 insert into empleados default values;
 select * from empleados;
--Creamos un valor predeterminado con el valor "Desconocido":

 create default VP_datodesconocido
  as 'Desconocido';
--Lo asociamos al campo "domicilio":

 exec sp_bindefault VP_datodesconocido, 'empleados.domicilio';
--Lo asociamos al campo "barrio":

 exec sp_bindefault VP_datodesconocido, 'empleados.barrio';
--Ingresamos otro registro sin especificar valores y vemos los datos:

 insert into empleados default values;
 select * from empleados;
--Creamos un valor predeterminado que inserta el valor "0":

 create default VP_cero
  as 0;
--Lo asociamos al campo "sueldo":

 exec sp_bindefault VP_cero, 'empleados.sueldo';
--Ingresamos un registro y verificamos los datos:

 insert into empleados default values;
 select * from empleados;
--Creamos un valor predeterminado que inserta el valor "100":

 create default VP_100
  as 100;
--Lo asociamos al campo "sueldo":

 exec sp_bindefault VP_100, 'empleados.sueldo';
--Recuerde que si asociamos a un campo que ya tiene asociado un valor predeterminado otro valor predeterminado, la nueva asociación reemplaza a la anterior. Verificamos:

 insert into empleados default values;
 select * from empleados;
--Veamos los valores predeterminados asociadas a la tabla "empleados":

 exec sp_helpconstraint empleados;
--El valor predeterminado "VP_cero" no aparece porque no está asociado a ningún campo de "empleados"; si aparecen "VP_100", "VP_datodesconocido" que está asociado a 2 campos (domicilio y barrio).

--Veamos si "VP_cero" existe, ejecutando el procedimiento almacenado del sistema "sp_help":

 exec sp_help;
--Aún existe en la base de datos.

--Creamos un valor predeterminado que inserta ceros con el formato válido para un campo número de teléfono:

 create default VP_telefono
  as '(0000)0-000000';
--La asociamos al campo "telefono" de la tabla "empleados":

 exec sp_bindefault VP_telefono,'empleados.telefono';
--Ingresamos un registro y verificamos los valores predeterminados almacenados:

 insert into empleados default values;
 select * from empleados;
--Veamos los valores predeterminados asociadas a la tabla "empleados":

 exec sp_helpconstraint empleados;
--Aparecen 4 filas, una por cada asociación.