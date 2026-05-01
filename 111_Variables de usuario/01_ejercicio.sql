--Trabajamos con la tabla "libros" de una librería.
--Eliminamos la tabla si existe:

 if object_id('libros') is not null
  drop table libros;
--Creamos la tabla:

 create table libros(
  titulo varchar(30),
  autor varchar(25),
  editorial varchar(20),
  precio decimal(5,2)
 );
--Ingresamos algunos registros:

 insert into libros values('Uno','Bach Richard','Planeta',15);
 insert into libros values('El aleph','Borges J. L.','Emece',25);
 insert into libros values('Matematica estas ahi','Paenza Adrian','Siglo XXI',15);
 insert into libros values('Aprenda PHP','Mario Molina','Siglo XXI',35);
 insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',35);
--Declare una variable llamada "@valor" de tipo "int" y vea su contenido:

 declare @valor int
 select @valor;
--Declare una variable llamada "@nombre" de tipo "varchar(20)", asígnele un valor y vea su contenido:

 declare @nombre varchar(20)
 set @nombre='Juan'
 select @nombre;
--Queremos saber todos los datos de los libros con mayor precio de la tabla "libros". Declare una variable de tipo decimal, busque el precio más alto de "libros" y almacénelo en una variable, luego utilice dicha variable para mostrar todos los datos del libro:

 declare @mayorprecio  decimal(5,2)
 select @mayorprecio=max(precio) from libros
 select *from libros where precio=@mayorprecio;