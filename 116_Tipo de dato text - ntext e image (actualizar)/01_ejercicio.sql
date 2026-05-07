--Una librería almacena los datos de sus libros en una tabla llamada "libros" y en otra tabla denominada "ofertas" almacena el título del libro y la sinopsis.
--Eliminamos las tablas, si existen:

 if object_id('libros') is not null
  drop table libros;
 if object_id('ofertas') is not null
  drop table ofertas;
--Creamos las tablas:

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  sinopsis text
 );

 create table ofertas(
  titulo varchar(40),
  sinopsis text
 );
--Ingresamos algunos registros:

 insert into libros values ('Ilusiones','Richard Bach','Planeta',null);
 insert into libros values ('Aprenda PHP','Mario Molina','Nuevo Siglo','Para aprender PHP a paso');
 insert into libros values ('Uno','Richard Bach','Planeta','');
 insert into libros values ('El Aleph','Borges','Emece','Uno de los libros más célebres de este autor.');

 insert into ofertas values ('Aprenda PHP','');
--Recuperamos todos los registros de ambas tablas:

 select *from libros;
 select *from ofertas;
--Necesitamos que en la sinopsis del libro "Aprenda PHP" se guarde "Para aprender PHP paso a paso"; debemos insertar en la posición 18, el texto "paso ", sin eliminar ningún caracter. Verificamos que el puntero sea válido, en caso de no serlo, mostramos un mensaje de error:

 declare @puntero binary(16)
 select @puntero = textptr(sinopsis)
  from libros
  where titulo='Aprenda PHP'
  if (textvalid('libros.sinopsis',@puntero)=1)
   updatetext libros.sinopsis @puntero 18 0 'paso '
  else
   select 'Puntero inválido';
--Leemos el campo "sinopsis" actualizado anteriormente para verificar que se actualizó:

 declare @puntero binary(16)
 select @puntero = textptr (sinopsis)
  from libros
  where titulo='Aprenda PHP'
 
 readtext libros.sinopsis @puntero 0 0;
--Necesitamos actualizar la sinopsis del libro "Aprenda PHP" de la tabla "ofertas" con la sinopsis del mismo libro de la tabla "libros":

 declare @puntero1 binary(16)
 select @puntero1 = textptr(sinopsis)
  from libros
  where titulo='Aprenda PHP'

 declare @puntero2 binary(16)
 select @puntero2 = textptr(sinopsis)
  from ofertas
  where titulo='Aprenda PHP'

  updatetext ofertas.sinopsis @puntero2 0 null
   libros.sinopsis @puntero1;
--Leemos el campo "sinopsis" actualizado anteriormente para verificar que se actualizó:

 declare @puntero binary(16)
 select @puntero = textptr (sinopsis)
  from ofertas
  where titulo='Aprenda PHP'
 
 readtext ofertas.sinopsis @puntero 0 0;