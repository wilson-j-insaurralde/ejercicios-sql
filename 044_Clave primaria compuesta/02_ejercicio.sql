/*
Un club dicta clases de distintos deportes. En una tabla llamada "inscriptos" almacena la 
informaci�n necesaria.
1- Elimine la tabla "inscriptos" si existe:
 if object_id('inscriptos') is not null
  drop table inscriptos;

2- La tabla contiene los siguientes campos:
 - documento del socio alumno: char(8) not null
 - nombre del socio: varchar(30),
 - nombre del deporte (tenis, futbol, nataci�n, basquet): varchar(15) not null,
 - a�o de inscripcion: datetime,
 - matr�cula: si la matr�cula ha sido o no pagada ('s' o 'n').

3- Necesitamos una clave primaria que identifique cada registro. Un socio puede inscribirse en 
varios deportes en distintos a�os. Un socio no puede inscribirse en el mismo deporte el mismo a�o. 
Varios socios se inscriben en un mismo deporte en distintos a�os. Cree la tabla con una clave 
compuesta:
 create table inscriptos(
  documento char(8) not null, 
  nombre varchar(30),
  deporte varchar(15) not null,
  a�o datetime,
  matricula char(1),
  primary key(documento,deporte,a�o)
 );

4- Inscriba a varios alumnos en el mismo deporte en el mismo a�o:
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2005','s');
 insert into inscriptos
  values ('23333333','Marta Garcia','tenis','2005','s');
 insert into inscriptos
  values ('34444444','Luis Perez','tenis','2005','n');

5- Inscriba a un mismo alumno en varios deportes en el mismo a�o:
 insert into inscriptos
  values ('12222222','Juan Perez','futbol','2005','s');
 insert into inscriptos
  values ('12222222','Juan Perez','natacion','2005','s');
 insert into inscriptos
  values ('12222222','Juan Perez','basquet','2005','n');

6- Ingrese un registro con el mismo documento de socio en el mismo deporte en distintos a�os:
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2006','s');
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2007','s');

7- Intente inscribir a un socio alumno en un deporte en el cual ya est� inscripto en un a�o en el 
cual ya se haya inscripto.

8- Intente actualizar un registro para que la clave primaria se repita.

*/

 if object_id('inscriptos') is not null
  drop table inscriptos;

 create table inscriptos(
  documento char(8) not null, 
  nombre varchar(30),
  deporte varchar(15) not null,
  a�o datetime,
  matricula char(1),
  primary key(documento,deporte,a�o)
 );

  insert into inscriptos
  values ('12222222','Juan Perez','tenis','2005','s');
 insert into inscriptos
  values ('23333333','Marta Garcia','tenis','2005','s');
 insert into inscriptos
  values ('34444444','Luis Perez','tenis','2005','n');


   insert into inscriptos
  values ('12222222','Juan Perez','futbol','2005','s');
 insert into inscriptos
  values ('12222222','Juan Perez','natacion','2005','s');
 insert into inscriptos
  values ('12222222','Juan Perez','basquet','2005','n');


   insert into inscriptos
  values ('12222222','Juan Perez','tenis','2006','s');
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2007','s');

  
 insert into inscriptos
  values ('12222222','Juan Perez','tenis','2005','s');

 update inscriptos set deporte='tenis'
  where documento='12222222' and
  deporte='futbol' and
  a�o='2005';