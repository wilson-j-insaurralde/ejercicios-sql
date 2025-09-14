Retorna la cantidad de registros. Es similar a la función "count(\*)", la diferencia es que "count\_big" retorna un valor "bigint" y "count", un "int".



"count\_big(\*)" cuenta la cantidad de registros de una tabla, incluyendo los valores nulos y duplicados.



"count\_big(CAMPO)" retorna la cantidad de registros cuyo valor en el campo especificado entre paréntesis no es nulo.



"count\_big(distinct CAMPO)" retorna la cantidad de registros cuyo valor en el campo especificado no es nulo, sin considerar los repetidos.



Averiguemos la cantidad de libros usando la función "count\_big()":



&nbsp;select count\_big(\*)

&nbsp; from libros;

Note que incluye todos los libros aunque tengan valor nulo en algún campo.



Contamos los libros de editorial "Planeta":



&nbsp;select count\_big(\*)

&nbsp; from libros

&nbsp; where editorial='Planeta';

Contamos los registros que tienen precio (sin tener en cuenta los que tienen valor nulo):



&nbsp;select count\_big(precio)

&nbsp; from libros;

Contamos las editoriales (sin repetir):



&nbsp;select count\_big(distinct editorial)

&nbsp; from libros;

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



insert into libros values('El aleph','Borges','Emece',15.90);

insert into libros values('Antología poética','Borges','Planeta',null);

insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);

insert into libros values('Matematica estas ahi','Paenza','Siglo XXI',15);

insert into libros values('Martin Fierro','Jose Hernandez',default,40);

insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',null);

insert into libros values('Uno','Richard Bach','Planeta',20);



select count\_big(\*)

&nbsp; from libros;



select count\_big(\*)

&nbsp; from libros

&nbsp; where editorial='Planeta';



select count\_big(precio)

&nbsp; from libros;



-- Contamos las editoriales (sin repetir):

select count\_big(distinct editorial)

&nbsp; from libros;



