/*
Una concesionaria de autos vende autos usados y almacena la información en una tabla llamada 
"autos".
1- Elimine la tabla "autos" si existe:
 if object_id('autos') is not null
  drop table autos;

2- Cree la tabla con la siguiente estructura:
 create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio decimal(8,2),
  primary key(patente)
 );

3- Ingrese algunos registros:
 insert into autos
  values('ACD123','Fiat 128','1970',15000);
 insert into autos
  values('ACG234','Renault 11','1980',40000);
 insert into autos
  values('BCD333','Peugeot 505','1990',80000);
 insert into autos
  values('GCD123','Renault Clio','1995',70000);
 insert into autos
  values('BCC333','Renault Megane','1998',95000);
 insert into autos
  values('BVF543','Fiat 128','1975',20000);

4- Seleccione todos los autos cuyo modelo se encuentre entre '1970' y '1990' usando el operador 
"between" y ordénelos por dicho campo(4 registros)

5- Seleccione todos los autos cuyo precio esté entre 50000 y 100000.

*/
 if object_id('autos') is not null
  drop table autos;

 create table autos(
  patente char(6),
  marca varchar(20),
  modelo char(4),
  precio decimal(8,2),
  primary key(patente)
 );

 insert into autos
  values('ACD123','Fiat 128','1970',15000);
 insert into autos
  values('ACG234','Renault 11','1980',40000);
 insert into autos
  values('BCD333','Peugeot 505','1990',80000);
 insert into autos
  values('GCD123','Renault Clio','1995',70000);
 insert into autos
  values('BCC333','Renault Megane','1998',95000);
 insert into autos
  values('BVF543','Fiat 128','1975',20000);

 select * from autos
  where modelo between '1970' and '1990'
  order by modelo;

 select * from autos
  where precio between 50000 and 100000; 