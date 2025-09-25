Para eliminar los registros de una tabla usamos el comando "delete":



&nbsp;delete from usuarios;

Muestra un mensaje indicando la cantidad de registros que ha eliminado.



Si no queremos eliminar todos los registros, sino solamente algunos, debemos indicar cuál o cuáles, para ello utilizamos el comando "delete" junto con la clausula "where" con la cual establecemos la condición que deben cumplir los registros a borrar.



Por ejemplo, queremos eliminar aquel registro cuyo nombre de usuario es "Marcelo":



&nbsp;delete from usuarios

&nbsp;where nombre='Marcelo';

Si solicitamos el borrado de un registro que no existe, es decir, ningún registro cumple con la condición especificada, ningún registro será eliminado.



Tenga en cuenta que si no colocamos una condición, se eliminan todos los registros de la tabla nombrada.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('usuarios') is not null

&nbsp; drop table usuarios;



create table usuarios(

&nbsp; nombre varchar(30),

&nbsp; clave varchar(10)

);



go



insert into usuarios (nombre,clave)

&nbsp; values ('Marcelo','River');

insert into usuarios (nombre,clave)

&nbsp; values ('Susana','chapita');

insert into usuarios (nombre,clave)

&nbsp; values ('CarlosFuentes','Boca');

insert into usuarios (nombre,clave)

&nbsp; values ('FedericoLopez','Boca');



select \* from usuarios;



-- Eliminamos el registro cuyo nombre de usuario es "Marcelo"

delete from usuarios

&nbsp; where nombre='Marcelo';



select \* from usuarios;



-- Intentamos eliminarlo nuevamente (no se borra registro)

delete from usuarios

&nbsp;where nombre='Marcelo';



select \* from usuarios;



-- Eliminamos todos los registros cuya clave es 'Boca'

delete from usuarios

&nbsp; where clave='Boca';



select \* from usuarios;



-- Eliminemos todos los registros

delete from usuarios;



select \* from usuarios;

