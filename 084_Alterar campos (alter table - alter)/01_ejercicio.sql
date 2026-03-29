--Trabajamos con la tabla "libros" de una librería.
--Eliminamos la tabla, si existe:

 if object_id('libros') is not null
  drop table libros;
--Creamos la tabla:

 create table libros(
  codigo int identity,
  titulo varchar(30),
  autor varchar(30),
  editorial varchar(15),
  precio decimal(6,2) not null default 0
 );
--Ingresamos algunos registros:

 insert into libros
  values('El aleph','Borges','Planeta',20);
 insert into libros
  values('Java en 10 minutos',null,'Siglo XXI',30);
 insert into libros
  values('Uno','Richard Bach','Planeta',15);
 insert into libros
  values('Martin Fierro','Jose Hernandez',null,30);
 insert into libros
  values('Aprenda PHP','Mario Molina','Emece',25);
--Vamos a efectuar diferentes modificaciones a los campos de esta tabla. Luego de cada una podemos ver la estructura de la tabla para controlar si los cambios se realizaron o no empleando el procedimiento almacenado "sp_columns".

--Modificamos el campo "titulo" para que acepte una cadena más larga y no admita valores nulos:

 alter table libros
  alter column titulo varchar(40) not null;
--Si intentamos modificar el campo "autor" para que no admita valores nulos SQL Server no lo permite porque hay registros con valor nulo en "autor".

--Eliminamos tal registro y realizamos la modificación:

 delete from libros where autor is null;
 alter table libros
  alter column autor varchar(30) not null;
--Intentamos quitar el atributo "identity" del campo "codigo" y lo redefinimos como "smallint":

 alter table libros
  alter column codigo smallint;
--No aparece mensaje de error pero no se realizó el cambio completo, controlémoslo:

 exec sp_columns libros;
--el campo "codigo" es "smallint pero aún es "identity".

--Aprendimos que no se puede modificar el tipo de dato o atributos de un campo que tiene una restricción si el cambio afecta a la restricción; pero si el cambio no afecta a la restricción, si se realiza:

 alter table libros
  alter column precio decimal(6,2) null;
--El campo "precio" fue alterado para que acepte valores nulos:

