/*
Trabajamos con la tabla "usuarios".
Eliminamos la tabla si existe:

 if object_id('usuarios') is not null
  drop table usuarios;
Creamos la tabla:

 create table usuarios(
  nombre varchar(20),
  clave varchar(10)
 );
Ingresamos algunos registros:

 insert into usuarios (nombre,clave)
  values ('Marcelo','River');
 insert into usuarios (nombre,clave)
  values ('Susana','chapita');
 insert into usuarios (nombre,clave)
  values ('Carlosfuentes','Boca');
 insert into usuarios (nombre,clave)
  values ('Federicolopez','Boca');
Cambiaremos los valores de todas las claves, por la cadena "RealMadrid":

 update usuarios set clave='RealMadrid';
El cambio afectó a todos los registros, veámoslo:

 select * from usuarios;
Necesitamos cambiar el valor de la clave del usuario llamado "Federicolopez" por "Boca":

 update usuarios set clave='Boca'
  where nombre='Federicolopez';
Verifiquemos que la actualización se realizó:

 select * from usuarios;
Vimos que si Microsoft SQL Server no encuentra registros que cumplan con la condición no se modifican registros:

 update usuarios set clave='payaso'
  where nombre='JuanaJuarez';
Si vemos la tabla veremos que no a cambiado:

 select * from usuarios;
Para actualizar varios campos en una sola instrucción empleamos:

 update usuarios set nombre='Marceloduarte', clave='Marce'
  where nombre='Marcelo';
Si vemos la tabla:

 select * from usuarios;
*/

if object_id('usuarios') is not null
  drop table usuarios;

 create table usuarios(
  nombre varchar(20),
  clave varchar(10)
 );

 insert into usuarios (nombre,clave)
  values ('Marcelo','River');
 insert into usuarios (nombre,clave)
  values ('Susana','chapita');
 insert into usuarios (nombre,clave)
  values ('Carlosfuentes','Boca');
 insert into usuarios (nombre,clave)
  values ('Federicolopez','Boca');

 update usuarios set clave='RealMadrid';

 select * from usuarios;

 update usuarios set clave='Boca'
  where nombre='Federicolopez';

 select * from usuarios;

 update usuarios set clave='payaso'
  where nombre='JuanaJuarez';

 select * from usuarios;

 update usuarios set nombre='Marceloduarte', clave='Marce'
  where nombre='Marcelo';

 select * from usuarios;
