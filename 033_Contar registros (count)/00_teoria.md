Existen en SQL Server funciones que nos permiten contar registros, calcular sumas, promedios, obtener valores máximos y mínimos. Estas funciones se denominan funciones de agregado y operan sobre un conjunto de valores (registros), no con datos individuales y devuelven un único valor.



Imaginemos que nuestra tabla "libros" contiene muchos registros. Para averiguar la cantidad sin necesidad de contarlos manualmente usamos la función "count()":



&nbsp;select count(\*)

&nbsp; from libros;

La función "count()" cuenta la cantidad de registros de una tabla, incluyendo los que tienen valor nulo.



También podemos utilizar esta función junto con la cláusula "where" para una consulta más específica. Queremos saber la cantidad de libros de la editorial "Planeta":



&nbsp;select count(\*)

&nbsp; from libros

&nbsp; where editorial='Planeta';

Para contar los registros que tienen precio (sin tener en cuenta los que tienen valor nulo), usamos la función "count()" y en los paréntesis colocamos el nombre del campo que necesitamos contar:



&nbsp;select count(precio)

&nbsp; from libros;

Note que "count(\*)" retorna la cantidad de registros de una tabla (incluyendo los que tienen valor "null") mientras que "count(precio)" retorna la cantidad de registros en los cuales el campo "precio" no es nulo. No es lo mismo. "count(\*)" cuenta registros, si en lugar de un asterisco colocamos como argumento el nombre de un campo, se contabilizan los registros cuyo valor en ese campo NO es nulo.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id ('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; codigo int identity,

&nbsp; titulo varchar(40) not null,

&nbsp; autor varchar(20) default 'Desconocido',

&nbsp; editorial varchar(20),

&nbsp; precio decimal(6,2),

&nbsp; primary key(codigo)

);



go



insert into libros

&nbsp; values('El aleph','Borges','Emece',15.90);

insert into libros

&nbsp; values('Antología poética','J. L. Borges','Planeta',null);

insert into libros

&nbsp; values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);

insert into libros

&nbsp; values('Matematica estas ahi','Paenza','Siglo XXI',15);

insert into libros

&nbsp; values('Martin Fierro','Jose Hernandez',default,40);

insert into libros

&nbsp; values('Aprenda PHP','Mario Molina','Nuevo siglo',null);

insert into libros

&nbsp; values('Uno','Richard Bach','Planeta',20);



-- Averiguemos la cantidad de libros usando la función "count()":

select count(\*)

&nbsp; from libros;



-- Contamos los libros de editorial "Planeta":

select count(\*)

&nbsp; from libros

&nbsp; where editorial='Planeta';



-- Contamos los registros que tienen precio (sin tener en cuenta 

-- los que tienen valor nulo),

select count(precio)

&nbsp; from libros;

