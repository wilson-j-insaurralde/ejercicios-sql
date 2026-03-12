--Una empresa registra los datos de sus empleados en una tabla llamada "empleados".
--Eliminamos la tabla "empleados" (si existe) y los valores predeterminados:

 if object_id ('empleados') is not null
  drop table empleados;
 if object_id ('VP_sueldo') is not null
   drop default VP_sueldo;
 if object_id ('VP_seccion') is not null
   drop default Vp_seccion;
--Creamos la tabla:

 create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
 );
--Creamos un valor predeterminado para el campo "sueldo":

 create default VP_sueldo
  as 500;
--Asociamos el valor predeterminado creado anteriormente al campo "sueldo":

 exec sp_bindefault VP_sueldo, 'empleados.sueldo';
--Creamos un valor predeterminado para "seccion":

 create default VP_seccion
  as 'Secretaria';
--No la asociamos.

--Veamos todos los objetos de la base de datos activa:

 exec sp_help;
--Aparece una tabla con todos los objetos de la base de datos activa, incluyendo los dos valores predeterminados creados anteriormente; se muestra el nombre, el propietario del objeto y, en caso de los valores predeterminados, aparece "default".

--Si agregamos al procedimiento almacenado "sp_help" el nombre del valor predeterminado del cual queremos información:

 exec sp_help VP_sueldo;
--muestra el nombre, propietario, tipo y fecha de creación.

--Para ver los valores predeterminados asociados a la tabla "empleados" tipeamos:

 exec sp_helpconstraint empleados;
---retorna una lista de todas las restricciones que tiene una tabla. También los valores predeterminados asociados. Aparecen 2 filas: una con información de la restricción "primary key" y otra con información del valor predeterminado asociado, este último muestra:

-- constraint_type: indica que es un valor predeterminado con "DEFAULT", nombrando el campo al que está asociado.

-- constraint_name: nombre del valor predeterminado.

-- constraint_keys: el texto del valor predeterminado.

-- las otras columnas no tienen información.

--Note que no aparece el valor predeterminado "VP_seccion" porque no fue asociado a la tabla.

--Si asociamos el valor predeterminado a la tabla:

 exec sp_bindefault VP_seccion, 'empleados.seccion';
--y ejecutamos el procedimiento nuevamente:

 exec sp_helpconstraint empleados;
--Aparecen ambos valores predeterminados.

--Veamos el texto que define el valor predeterminado "VP_seccion" empleando "sp_helptext":

 exec sp_helptext VP_seccion;
--Deshacemos la asociación del valor predeterminado "VP_sueldo" y lo eliminamos:

 exec sp_unbindefault'empleados.sueldo'; 
 drop default VP_sueldo;
--Verificamos que ya no existe tal valor predeterminado:

 exec sp_help VP_sueldo;
--Vemos si el valor predeterminado "VP_seccion" existe consultando la tabla "sysobjects":

 select * from sysobjects
  where xtype='D' and
  name like '%seccion%';