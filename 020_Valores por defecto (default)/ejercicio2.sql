/*
Una pequeña biblioteca de barrio registra los préstamos de sus libros en una tabla llamada 
"prestamos". En ella almacena la siguiente información: título del libro, documento de identidad del 
socio a quien se le presta el libro, fecha de préstamo, fecha en que tiene que devolver el libro y 
si el libro ha sido o no devuelto.
1- Elimine la tabla "prestamos" si existe:
 if object_id('prestamos') is not null
  drop table prestamos;

2- Cree la tabla:
 create table prestamos(
  titulo varchar(40) not null,
  documento char(8) not null,
  fechaprestamo datetime not null,
  fechadevolucion datetime,
  devuelto char(1) default 'n'
 );

3- Ingrese algunos registros omitiendo el valor para los campos que lo admiten:
 insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion)
  values ('Manual de 1 grado','23456789','2006-12-15','2006-12-18');
 insert into prestamos (titulo,documento,fechaprestamo)
  values ('Alicia en el pais de las maravillas','23456789','2006-12-16');
 insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion)
  values ('El aleph','22543987','2006-12-16','2006-08-19');
 insert into prestamos (titulo,documento,fechaprestamo,devuelto)
  values ('Manual de geografia 5 grado','25555666','2006-12-18','s');

4- Seleccione todos los registros:
 select * from prestamos;

5- Ingrese un registro colocando "default" en los campos que lo admiten y vea cómo se almacenó.

6- Intente ingresar un registro con "default values" y analice el mensaje de error (no se puede)
*/

 if object_id('prestamos') is not null
  drop table prestamos;

 create table prestamos(
  titulo varchar(40) not null,
  documento char(8) not null,
  fechaprestamo datetime not null,
  fechadevolucion datetime,
  devuelto char(1) default 'n'
 );

 insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion)
  values ('Manual de 1 grado','23456789','2006-12-15','2006-12-18');
 insert into prestamos (titulo,documento,fechaprestamo)
  values ('Alicia en el pais de las maravillas','23456789','2006-12-16');
 insert into prestamos (titulo,documento,fechaprestamo,fechadevolucion)
  values ('El aleph','22543987','2006-12-16','2006-08-19');
 insert into prestamos (titulo,documento,fechaprestamo,devuelto)
  values ('Manual de geografia 5 grado','25555666','2006-12-18','s');

 select * from prestamos;

 insert into prestamos
  values('Manual de historia','32555666','2006-10-25',default,default);

 select * from prestamos;

 insert into prestamos default values;