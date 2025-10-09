/*
Una empresa de remises tiene registrada la información de sus vehículos en una tabla llamada 
"remis".
1- Elimine la tabla si existe:
 if object_id('remis') is not null
  drop table remis;

2- Cree la tabla con la siguiente estructura:
 create table remis(
  numero tinyint identity,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 );

3- Ingrese algunos registros sin repetir patente:
 insert into remis values('ABC123','Renault 12','1990');
 insert into remis values('DEF456','Fiat Duna','1995');

4- Intente definir una restricción "primary key" para el campo "patente".
No lo permite porque el campo no fue definido "not null".

5- Establezca una restricción "primary key" para el campo "numero".
Si bien "numero" no fue definido explícitamente "not null", no acepta valores nulos por ser 
"identity".

6- Vea la información de las restricciones (2 filas):
 exec sp_helpconstraint remis;
*/

 if object_id('remis') is not null
  drop table remis;

   create table remis(
  numero tinyint identity,
  patente char(6),
  marca varchar(15),
  modelo char(4)
 );
 
  insert into remis values('ABC123','Renault 12','1990');
 insert into remis values('DEF456','Fiat Duna','1995');

 --alter table remis 
 --add constraint PK_remis_patente
 --primary key (patente) ; 
 alter table remis 
 add constraint PK_remis_numero
 primary key(numero);
  exec sp_helpconstraint remis;