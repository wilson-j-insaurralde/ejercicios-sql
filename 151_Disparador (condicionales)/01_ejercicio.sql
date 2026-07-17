--Una librería almacena los datos de sus libros en una tabla denominada "libros".
--Eliminamos la tabla si existe y la creamos con los siguientes campos:

 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  stock int,
  constraint pk_libros primary key (codigo)
 ); 
--Ingresamnos algunos registros:

 insert into libros values('Uno','R. Bach','Planeta',50);
 insert into libros values('Ilusiones','R. Bach','Planeta',15);
 insert into libros values('El aleph','Borges','Emece',10);
 insert into libros values('Aprenda PHP','M. Molina','Nuevo siglo',5);
--Creamos un disparador de actualización sobre la tabla "libros". Se permite actualizar el stock de varios libros a la vez; pero ningún "stock" debe tener un valor negativo. Si algún "stock" queda con un valor negativo, no debe cambiar, los demás si:

 create trigger dis_libros_actualizar
 on libros
 after update
 as
  if exists (select *from inserted where stock<0)
  begin
   update libros set stock=deleted.stock
   from libros
   join deleted
   on deleted.codigo=libros.codigo
   join inserted
   on inserted.codigo=libros.codigo
   where inserted.stock<0
  end;
--Actualizamos el stock de todos los libros, restándoles 15:

 update libros set stock=stock-15;
--Veamos el resultado:

 select *from libros;
--Solamente se actualizaron los 2 primeros libros, cuyo valor de stock era igual o superior a 15; los otros libros no se actualizaron.