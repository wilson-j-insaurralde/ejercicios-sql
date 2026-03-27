--Trabajamos con las tablas "libros", "autores" y "editoriales" de una librería:
--Eliminamos las tablas si existen:

 if object_id('libros') is not null
  drop table libros;
 if object_id('editoriales') is not null
  drop table editoriales;
 if object_id('autores') is not null
  drop table autores;
--Creamos la tabla "editoriales" con una restricción "primary key":

 create table editoriales(
  codigo tinyint not null,
  nombre varchar(30),
  constraint PK_editoriales primary key (codigo)
);
--Creamos la tabla "autores" con una restricción "primary key", una "unique" y una "check":

 create table autores(
  codigo int not null
   constraint CK_autores_codigo check (codigo>=0),
  nombre varchar(30) not null,
  constraint PK_autores_codigo
   primary key (codigo),
  constraint UQ_autores_nombre
    unique (nombre),
);
--Aplicamos varias restricciones cuando creamos la tabla "libros":

 create table libros(
  codigo int identity,
  titulo varchar(40),
  codigoautor int not null,
  codigoeditorial tinyint not null,
  precio decimal(5,2)
   constraint DF_libros_precio default (0),
  constraint PK_libros_codigo
   primary key clustered (codigo),
  constraint UQ_libros_tituloautor
    unique (titulo,codigoautor),
  constraint FK_libros_editorial
   foreign key (codigoeditorial)
   references editoriales(codigo)
   on update cascade,
  constraint FK_libros_autores
   foreign key (codigoautor)
   references autores(codigo)
   on update cascade,
  constraint CK_libros_precio_positivo check (precio>=0)
);
--Veamos las restricciones de "editoriales":

 exec sp_helpconstraint editoriales;
--Aparece la restricción "primary key" para el campo "codigo" y la restricción "foreign key" de "libros" "FK_libros_editorial" que referencia esta tabla.

--Veamos las restricciones de "autores":

 exec sp_helpconstraint autores;
--Aparecen 4 restricciones: una restricción "check" para el campo "codigo", una restricción "primary key" para el campo "codigo", una restricción "unique" para el campo "nombre" y la restricción "foreign key" de "libros" "FK_libros_autores" que referencia esta tabla.

--Veamos las restricciones de "libros":

 exec sp_helpconstraint libros;
--Aparecen 6 restricciones: una restricción "check" sobre el campo "precio", una "default" sobre el campo "precio", una restricción "foreign key" que establece el campo "codigoeditorial" como clave externa que hace referencia al campo "codigo" de "editoriales" y permite actualizaciones en cascada y no eliminaciones, una restricción "foreign key" que establece el campo "codigoautor" como clave externa que hace referencia al campo "codigo" de "autores" y permite actualizaciones en cascada y no eliminaciones, una restricción "primary key" con índice agrupado para el campo "codigo" y una restricción "unique" con índice no agrupado para los campos "titulo" y "codigoautor".

--Recuerde que si definimos una restricción "foreign key" al crear una tabla, la tabla referenciada debe existir, por ello creamos las tablas "editoriales" y "autores" antes que "libros".

--También debemos ingresar registros en las tablas "autores" y "editoriales" antes que en "libros", a menos que deshabilitemos la restricción "foreign key".