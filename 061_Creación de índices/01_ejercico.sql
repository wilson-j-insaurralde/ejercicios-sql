--Trabajamos con la tabla "libros" de una librería.
--Eliminamos la tabla si existe y la creamos:

 if object_id('libros') is not null
  drop table libros;
 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(15)
 );
--Creamos un índice agrupado único para el campo "codigo" de la tabla "libros":

 create unique clustered index I_libros_codigo
 on libros(codigo);
--Creamos un índice no agrupado para el campo "titulo":

 create nonclustered index I_libros_titulo
 on libros(titulo);
--Veamos los indices de "libros":

 exec sp_helpindex libros;
--Aparecen 2 filas, uno por cada índice. Muestra el nombre del índice, si es agrupado (o no), primary (o unique) y el campo por el cual se indexa.

--Creamos una restricción "primary key" al campo "codigo" especificando que cree un índice NO agrupado:

 alter table libros
  add constraint PK_libros_codigo
  primary key nonclustered (codigo);
--Verificamos que creó un índice automáticamente:

 exec sp_helpindex libros;
--El nuevo índice es agrupado, porque no se especificó.

--Analicemos la información que nos muestra "sp_helpconstraint":

 exec sp_helpconstraint libros;
--En la columna "constraint_type" aparece "PRIMARY KEY" y entre paréntesis, el tipo de índice creado.

--Creamos un índice compuesto para el campo "autor" y "editorial":

 create index I_libros_autoreditorial
 on libros(autor,editorial);
--Se creará uno no agrupado porque no especificamos el tipo, además, ya existe uno agrupado y solamente puede haber uno por tabla.

--Consultamos la tabla "sysindexes":

 select name from sysindexes;
--Veamos los índices de la base de datos activa creados por nosotros podemos tipear la siguiente consulta:

 select name from sysindexes
  where name like 'I_%';