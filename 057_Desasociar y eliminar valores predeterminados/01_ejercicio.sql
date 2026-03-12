--Problema:
--Una empresa registra los datos de sus empleados en una tabla llamada "empleados".
--Eliminamos la tabla "empleados" si existe:

 if object_id ('empleados') is not null
  drop table empleados;
--Recordemos que si eliminamos una tabla, las asociaciones de los valores predeterminados a sus campos desaparecen,
--pero los valores predeterminados siguen existiendo. Si intentamos crear un valor predeterminado con igual nombre que uno existente,
--aparecerá un mensaje indicándolo, por ello, debemos eliminar los valores predeterminados (si existen) para poder crearlos nuevamente:

 if object_id ('VP_cero') is not null
   drop default VP_cero;
 if object_id ('VP_datodesconocido') is not null
   drop default VP_datodesconocido;
--Creamos la tabla:

 create table empleados(
  nombre varchar(30),
  domicilio varchar(30),
  barrio varchar(15),
  sueldo decimal(6,2)
 );
--Creamos un valor predeterminado que inserta el valor "0":

 create default VP_cero
  as 0;
--Lo asociamos al campo "sueldo":

 exec sp_bindefault VP_cero, 'empleados.sueldo';
--Creamos un valor predeterminado con el valor "Desconocido":

 create default VP_datodesconocido
  as 'Desconocido';
--Lo asociamos al campo "domicilio" y al campo "barrio":

 exec sp_bindefault VP_datodesconocido, 'empleados.domicilio';
 exec sp_bindefault VP_datodesconocido, 'empleados.barrio';
--Veamos los valores predeterminados asociados a los campos de la tabla "empleados":

 exec sp_helpconstraint empleados;
--Aparecen 3 filas, correspondientes a las asociaciones de valores predeterminados a los campos "sueldo", "domicilio" y "barrio".

--Quitamos la asociación al campo "barrio":

 exec sp_unbindefault 'empleados.barrio';
--Ejecutamos nuevamente el procedimiento "sp_helpconstraint":

 exec sp_helpconstraint empleados;
--Note que el valor predeterminado "VP_datodesconocido" ya no está asociado al campo "barrio".
--Pero dicho valor predeterminado aún existe en la base de datos, verifiquémoslo:

 exec sp_help;
--aparece en la lista.

--Aun no podemos eliminarlo porque está asociado al campo "domicilio", quitamos la asociación y luego lo eliminamos:

 exec sp_unbindefault 'empleados.domicilio';
 drop default VP_datodesconocido;



