--Problema:
--Una empresa registra los datos de sus empleados en una tabla llamada "empleados".
El--iminamos la tabla "empleados" si existe:

 if object_id ('empleados') is not null
  drop table empleados;
--Recordemos que si eliminamos una tabla, las asociaciones de reglas de sus campos desaparecen,
--pero las reglas siguen existiendo. Si intentamos crear una regla con igual nombre que una existente,
--aparecerá un mensaje indicándolo, por ello, debemos eliminar las reglas (si existen) para poder crearlas nuevamente:

 if object_id ('RG_sueldo_100a1000') is not null
   drop rule RG_sueldo_100a1000;
--Creamos la tabla:

 create table empleados(
  documento char(8),
  nombre varchar(30) not null,
  seccion varchar(20),
  sueldo decimal(6,2),
  primary key(documento)
 );
--Creamos una regla para restringir los valores que se pueden ingresar en un campo "sueldo":

 create rule RG_sueldo_100a1000
 as @sueldo between 100 and 1000;
--Asociamos la regla creada anteriormente al campo "sueldo":

 exec sp_bindrule RG_sueldo_100a1000, 'empleados.sueldo';
--Si intentamos ingresar un registro con valor para el campo "sueldo" de "1200" aparece un mensaje de error indicando que hay conflicto con la regla y la inserción no se realiza.

--Vemos si la regla está asociada a algún campo de "empleados":

 exec sp_helpconstraint empleados;
--Aparece la regla.

--Si intentamos eliminar la regla "RG_sueldo_100a 1000" aparece un mensaje de error indicando que no se puede eliminar la regla porque está asociada.

--Quitamos la asociación:

 exec sp_unbindrule 'empleados.sueldo';
--Ahora que hemos quitado la asociación, podemos ingresar el valor "1200" en el campo "sueldo":

 insert into empleados values ('30111222','Pedro Torres','Contaduria',1200);
--Vemos si la regla está asociada a algún campo de "empleados":

 exec sp_helpconstraint empleados;
--No aparece la regla.

--Ejecutamos el procedimiento "sp_help" para verificar que la regla aún existe:

 exec sp_help;
--Aparece la regla.

--Ahora si podemos borrar la regla:

 drop rule RG_sueldo_100a1000;