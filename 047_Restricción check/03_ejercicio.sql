/*
Trabajamos con la tabla "libros" de una librer�a.
Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
La creamos e ingresamos algunos registros:

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  preciomin decimal(5,2),
  preciomay decimal(5,2)
 );

 insert into libros values ('Uno','Bach','Planeta',22,20);
 insert into libros values ('El quijote','Cervantes','Emece',15,13);
 insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI',48,53);
 insert into libros values ('Java en 10 minutos','Garcia','Siglo XXI',35,40);
Agregamos una restricci�n "check" para asegurar que los valores de los campos correspondientes a precios no puedan ser negativos:

 alter table libros
   add constraint CK_libros_precios_positivo
   check (preciomin>=0 and preciomay>=0);
Si intentamos ingresar un valor inv�lido para alg�n campo correspondiente al precio, que vaya en contra de la restricci�n, por ejemplo el valor "-15" aparecer� un mensaje de error indicando que hay conflicto con la restricci�n creada anteriormente y la inserci�n no se realiza. Igualmente si intentamos actualizar un precio, que vaya en contra de la restricci�n.

Si intentamos agregar una restricci�n que no permita que el precio mayorista supere el precio minorista, aparece un mensaje de error y la sentencia no se ejecuta, porque hay registros que no cumplen con la restricci�n que intentamos establecer. Podemos modificar los datos que no cumplen la condici�n de la restricci�n o eliminar los registros:

 update libros set preciomay=48
   where titulo='Aprenda PHP';
 delete from libros where titulo='Java en 10 minutos'; 
Ahora SQL Server si nos permite agregar la restricci�n "check" que impida que se ingresen valores para "preciomay" superiores a "preciomin":

 alter table libros
   add constraint CK_libros_preciominmay
   check (preciomay<=preciomin);
Veamos las restricciones de la tabla:

 exec sp_helpconstraint libros;
Ingresamos un registro con valores por defecto:

 insert into libros default values;
Note que los campos correspondientes a precios admiten valores 0 y 999.99 (por el tipo de dato y la restricci�n), adem�s del valor "null".
*/

if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15),
  preciomin decimal(5,2),
  preciomay decimal(5,2)
 );

 insert into libros values ('Uno','Bach','Planeta',22,20);
 insert into libros values ('El quijote','Cervantes','Emece',15,13);
 insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI',48,53);
 insert into libros values ('Java en 10 minutos','Garcia','Siglo XXI',35,40);

 alter table libros
   add constraint CK_libros_precios_positivo
   check (preciomin>=0 and preciomay>=0);

 update libros set preciomay=48
  where titulo='Aprenda PHP';
 
 delete from libros where titulo='Java en 10 minutos'; 

 alter table libros
   add constraint CK_libros_preciominmay
   check (preciomay<=preciomin);

 exec sp_helpconstraint libros;

 insert into libros default values;
