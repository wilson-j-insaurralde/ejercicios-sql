

--Problema:
--Una empresa registra los datos de sus empleados en una tabla llamada "empleados".
--Eliminamos la tabla "empleados" (si existe) y las reglas:

 if object_id ('empleados') is not null
  drop table empleados;
 if object_id ('RG_sueldo') is not null
   drop rule RG_sueldo;
 if object_id ('RG_seccion_lista') is not null
   drop rule RG_seccion_lista;
--Creamos la tabla:

 create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
 );
--Creamos una regla para el campo "sueldo":

 create rule RG_sueldo
 as @sueldo between 100 and 1000;
--Asociamos la regla creada anteriormente al campo "sueldo":

 exec sp_bindrule RG_sueldo, 'empleados.sueldo';
--Creamos una regla con una lista de valores para "seccion":

 create rule RG_seccion_lista
 as @seccion in ('Sistemas','Secretaria','Contaduria');
--No la asociamos.

--Llamemos al procedimiento almacenado "sp_help" junto al nombre de la regla de la cual queremos información:

 exec sp_help RG_sueldo;
--muestra el nombre, propietario, tipo y fecha de creación.

--Para ver las reglas asociadas a la tabla "empleados" tipeamos:

 exec sp_helpconstraint empleados;
--retorna una lista de todas las restricciones que tiene una tabla. También las reglas asociadas. Aparecen 2 filas: una con información de la restricción "primary key" y otra con información de la regla asociada, esta última muestra:

-- constraint_type: indica que es una regla con "RULE", nombrando el campo al que está asociada.

-- constraint_name: nombre de la regla.

-- constraint_keys: el texto de la regla.

-- las otras columnas no tienen información.

--Note que no aparece la regla "RG_seccion_lista" porque no fue asociada a la tabla.

--Si asociamos la regla a la tabla:

 exec sp_bindrule RG_seccion_lista, 'empleados.seccion';
--y ejecutamos el procedimiento nuevamente:

 exec sp_helpconstraint empleados;
--Aparecen ambas reglas.

--También podemos ver el texto de una regla empleando "sp_helptext":

exec sp_helptext "RG_seccion_lista";
--Deshacemos la asociación de la regla "RG_sueldo" y la eliminamos:

 exec sp_unbindrule 'empleados.sueldo'; 
 drop rule RG_sueldo;
--Verificamos que ya no existe tal regla:

 exec sp_help RG_sueldo;
--Vemos si la regla "RG_seccion_lista" existe consultando la tabla "sysobjects":

 select * from sysobjects
  where xtype='R' and
  name like '%seccion%';




