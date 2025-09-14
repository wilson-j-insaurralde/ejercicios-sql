/*
Una concesionaria de autos vende autos usados y almacena los datos de los autos en una tabla llamada 
"autos".
1- Elimine la tabla "autos" si existe:
 if object_id('autos') is not null
  drop table autos;

2- Cree la tabla eligiendo el tipo de dato adecuado para cada campo, estableciendo el campo 
"patente" como clave primaria:
 create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio float,
  primary key (patente)
 );

Hemos definido el campo "patente" de tipo "char" y no "varchar" porque la cadena de caracteres 
siempre tendrá la misma longitud (6 caracteres). Lo mismo sucede con el campo "modelo", en el cual 
almacenaremos el año, necesitamos 4 caracteres fijos.

3- Ingrese los siguientes registros:
 insert into autos
  values('ACD123','Fiat 128','1970',15000);
 insert into autos
  values('ACG234','Renault 11','1990',40000);
 insert into autos
  values('BCD333','Peugeot 505','1990',80000);
 insert into autos
  values('GCD123','Renault Clio','1990',70000);
 insert into autos
  values('BCC333','Renault Megane','1998',95000);
 insert into autos
  values('BVF543','Fiat 128','1975',20000);

4- Seleccione todos los autos del año 1990:
 select * from autos
  where modelo='1990';
*/

 if object_id('autos') is not null
  drop table autos;

 create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio float,
  primary key (patente)
 );

 insert into autos
  values('ACD123','Fiat 128','1970',15000);
 insert into autos
  values('ACG234','Renault 11','1990',40000);
 insert into autos
  values('BCD333','Peugeot 505','1990',80000);
 insert into autos
  values('GCD123','Renault Clio','1990',70000);
 insert into autos
  values('BCC333','Renault Megane','1998',95000);
 insert into autos
  values('BVF543','Fiat 128','1975',20000);

 select * from autos
  where modelo='1990';