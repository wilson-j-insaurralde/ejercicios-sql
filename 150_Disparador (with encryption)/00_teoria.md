Hasta el momento hemos aprendido que un trigger se crea sobre una tabla (o vista), especificando el momento de ejecución (after o instead of), para un evento (inserción, eliminación o actualización).



Podemos encriptar los triggers para evitar que sean leídos con "sp\_helptext". Para ello debemos agregar al crearlos la opción "with encryption" luego del nombre de la tabla o vista:



&#x20;create triggre NOMBREDISPARADOR

&#x20; on NOMBRETABLAoVISTA

&#x20; with encryption

&#x20; MOMENTODEDISPARO--after o instead of

&#x20; ACCION-- insert, update, delete

&#x20; as 

&#x20;   SENTENCIAS

El siguiente disparador se crea encriptado:



&#x20;create trigger DIS\_empleados\_insertar

&#x20; on empleados

&#x20; with encryption

&#x20; after insert

&#x20;as

&#x20; if (select seccion from inserted)='Gerencia'

&#x20; begin

&#x20;   raiserror('No puede ingresar empleados en la sección "Gerencia".', 16, 1)

&#x20;   rollback transaction

&#x20; end;

Si ejecutamos el procedimiento almacenado del sistema "sp\_helptext" seguido del nombre del trigger creado anteriormente, SQL Server mostrará un mensaje indicando que tal disparador ha sido encriptado.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('empleados') is not null

&#x20; drop table empleados;



create table empleados(

&#x20; documento char(8) not null,

&#x20; nombre varchar(30) not null,

&#x20; domicilio varchar(30),

&#x20; seccion varchar(20),

&#x20; constraint PK\_empleados primary key(documento),

);



go



\-- Creamos el siguiente disparador encriptado:

create trigger DIS\_empleados\_insertar

&#x20; on empleados

&#x20; with encryption

&#x20; after insert

&#x20;as

&#x20; if (select seccion from inserted)='Gerencia'

&#x20; begin

&#x20;   raiserror('No puede ingresar empleados en la sección "Gerencia".', 16, 1)

&#x20;   rollback transaction

&#x20; end;



go



\-- Ejecutamos el procedimiento almacenado del sistema "sp\_helptext" 

\-- seguido del nombre del trigger creado anteriormente 

\--(SQL Server muestra un mensaje indicando que tal disparador ha sido encriptado):

exec sp\_helptext dis\_empleados\_insertar;



go



\-- Modificamos el disparador para quitar la encriptación:

alter trigger dis\_empleados\_insertar

&#x20; on empleados

&#x20; after insert

&#x20;as

&#x20; if (select seccion from inserted)='Gerencia'

&#x20; begin

&#x20;   raiserror('No puede ingresar empleados en la sección "Gerencia".', 16, 1)

&#x20;   rollback transaction

&#x20; end;



\-- Ejecutamos el procedimiento almacenado del sistema "sp\_helptext"

\-- seguido del nombre del trigger (SQL Server nos permite ver la

\-- definición del trigger porque ya no está encriptado.):

exec sp\_helptext dis\_empleados\_insertar;

