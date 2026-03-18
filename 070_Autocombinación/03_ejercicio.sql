/*
Varios clubes de barrio se organizaron para realizar campeonatos entre ellos. La tabla llamada 
"equipos" guarda la informacion de los distintos equipos que jugarán.
1- Elimine la tabla, si existe y créela nuevamente:
 if object_id('equipos') is not null
  drop table equipos;

 create table equipos(
  nombre varchar(30),
  barrio varchar(20),
  domicilio varchar(30),
  entrenador varchar(30)
 );

2- Ingrese los siguientes registros:
 insert into equipos values('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez');
 insert into equipos values('Los leones','Centro','Colon 123','Gustavo Fuentes');
 insert into equipos values('Campeones','Pueyrredon','Guemes 346','Carlos Moreno');
 insert into equipos values('Cebollitas','Alberdi','Colon 1234','Luis Duarte');

4- Cada equipo jugará con todos los demás 2 veces, una vez en cada sede. Realice un "cross join" 
para combinar los equipos teniendo en cuenta que un equipo no juega consigo mismo (12 registros)

5- Obtenga el mismo resultado empleando un "join".

6- Realice un "cross join" para combinar los equipos para que cada equipo juegue con cada uno de los 
otros una sola vez (6 registros)

*/


if OBJECT_ID('equipos') is not null 
drop table equipos;

create table equipos(
  nombre varchar(30),
  barrio varchar(20),
  domicilio varchar(30),
  entrenador varchar(30)
);

 insert into equipos values('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez');
 insert into equipos values('Los leones','Centro','Colon 123','Gustavo Fuentes');
 insert into equipos values('Campeones','Pueyrredon','Guemes 346','Carlos Moreno');
 insert into equipos values('Cebollitas','Alberdi','Colon 1234','Luis Duarte');


 select e1.nombre,e2.nombre,e1.barrio as 'sede'
 from equipos as e1
 cross join equipos as e2
 where e1.nombre<>e2.nombre;

 select e1.nombre,e2.nombre,e1.barrio as 'sede'
 from equipos as e1
 join equipos as e2
 on e1.nombre<>e2.nombre;

  select e1.nombre,e2.nombre,e1.barrio as 'sede'
  from equipos as e1
  cross join equipos as e2
  where e1.nombre>e2.nombre;