--Una empresa almacena los datos de sus empleados en una tabla denominada "empleados".
--Eliminamos la tabla si existe:

 if object_id('empleados') is not null
  drop table empleados;
--Creamos la tabla, con la siguiente estructura:

 create table empleados(
  documento char(8) not null,
  nombre varchar(30) not null,
  domicilio varchar(30),
  seccion varchar(20),
  constraint PK_empleados primary key(documento),
 );
--Creamos el siguiente disparador encriptado:

 create trigger DIS_empleados_insertar
  on empleados
  with encryption
  after insert
 as
  if (select seccion from inserted)='Gerencia'
  begin
    raiserror('No puede ingresar empleados en la sección "Gerencia".', 16, 1)
    rollback transaction
  end;
--Ejecutamos el procedimiento almacenado del sistema "sp_helptext" seguido del nombre del trigger creado anteriormente:

 sp_helptext dis_empleados_insertar;
--SQL Server muestra un mensaje indicando que tal disparador ha sido encriptado.

--Modificamos el disparador para quitar la encriptación:

 alter trigger dis_empleados_insertar
  on empleados
  after insert
 as
  if (select seccion from inserted)='Gerencia'
  begin
    raiserror('No puede ingresar empleados en la sección "Gerencia".', 16, 1)
    rollback transaction
  end;
--Ejecutamos el procedimiento almacenado del sistema "sp_helptext" seguido del nombre del trigger:

 sp_helptext dis_empleados_insertar;
--SQL Server nos permite ver la definición del trigger porque ya no está encriptado.