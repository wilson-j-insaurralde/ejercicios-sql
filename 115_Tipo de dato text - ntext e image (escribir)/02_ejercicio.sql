/*

En una página web se guardan los siguientes datos de las visitas: número de visita, nombre, mail, 
pais, fecha.
1- Elimine la tabla "visitas", si existe:
 if object_id('visitas') is not null
  drop table visitas;

2- Créela con la siguiente estructura:
 create table visitas (
  numero int identity,
  nombre varchar(30),
  mail varchar(50),
  pais varchar (20),
  fecha datetime
  constraint DF_visitas_fecha default getdate(),
  comentarios text,
  constraint PK_visitas
  primary key(numero)
);
3- Ingrese algunos registros:
 insert into visitas values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10',null);
 insert into visitas values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30',default);
 insert into visitas values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico',default,'Excelente página');
 insert into visitas values ('Mariano Perez','PerezM@hotmail.com','Argentina','2006-11-11 14:30','Muy buena y divertida');

4- Recupere todos los registros:
 select *from visitas;

5- Reemplace el texto del campo "comentarios" del registro con número 3.

6- Lea el campo "comentarios" de la visita número 3 para ver si se actualizó.

7- Intente actualizar el campo "text" de la visita número 1.
Error, puntero inválido.

8- Vuelva a intentar la actualización del punto anterior pero controlando que el puntero sea válido.

9- Ingrese un nuevo registro con cadena vacía para el campo "comentarios":
 insert into visitas values ('Salvador Quiroga','salvador@hotmail.com','Argentina','2006-09-09 18:25','');

10- Actualice el campo "comentarios" del registro ingresado anteriormente.

11- Verifique que se actualizó.

*/

if OBJECT_ID('visitas') is not null
drop table visitas;

create table visitas (
  numero int identity,
  nombre varchar(30),
  mail varchar(50),
  pais varchar (20),
  fecha datetime
  constraint DF_visitas_fecha default getdate(),
  comentarios text,
  constraint PK_visitas
  primary key(numero)

);

 insert into visitas values ('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10',null);
 insert into visitas values ('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30',default);
 insert into visitas values ('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico',default,'Excelente página');
 insert into visitas values ('Mariano Perez','PerezM@hotmail.com','Argentina','2006-11-11 14:30','Muy buena y divertida');



 select * from visitas; 

 declare @puntero binary(16)
 select @puntero =textptr(comentarios)
 from visitas 
 where numero=3 
 
 writetext visitas.comentarios @puntero 'Esta página es excelente, no hay otra mejor.';


  declare @puntero binary(16)
 select @puntero = textptr (comentarios)
  from visitas
  where numero=3
 
 readtext visitas.comentarios @puntero 0 0;


  declare @puntero varbinary(16)
 select @puntero=textptr(comentarios) 
  from visitas where numero=1

 writetext visitas.comentarios @puntero 'Es una muy buena página, pero tiene algunos errores.';

 declare @puntero varbinary(16)
 select @puntero=textptr(comentarios) 
  from visitas where numero=1
 if (textvalid('visitas.comentarios', @puntero)=1)
  writetext visitas.comentarios @puntero 'Es una muy buena página, pero tiene algunos errores.'
 else select 'puntero invalido, no se actualizó el registro';

 insert into visitas values ('Salvador Quiroga','salvador@hotmail.com','Argentina','2006-09-09 18:25','');

 declare @puntero varbinary(16)
 select @puntero=textptr(comentarios) 
  from visitas where nombre='Salvador Quiroga'
 if (textvalid('visitas.comentarios', @puntero)=1)
  writetext visitas.comentarios @puntero 'Es una página más que interesante.';

 declare @puntero binary(16)
 select @puntero = textptr (comentarios)
  from visitas
  where nombre='Salvador Quiroga'
 
  readtext visitas.comentarios @puntero 0 0;