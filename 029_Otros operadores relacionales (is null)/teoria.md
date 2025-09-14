

Ver video



Hemos aprendido los operadores relacionales "=" (igual), "<>" (distinto), ">" (mayor), "<" (menor), ">=" (mayor o igual) y "<=" (menor o igual). Dijimos que no eran los únicos.



Existen otro operador relacional "is null".



Se emplea el operador "is null" para recuperar los registros en los cuales esté almacenado el valor "null" en un campo específico:



&nbsp;select \* from libros

&nbsp; where editorial is null;

Para obtener los registros que no contiene "null", se puede emplear "is not null", esto mostrará los registros con valores conocidos.



Siempre que sea posible, emplee condiciones de búsqueda positivas ("is null"), evite las negativas ("is not null") porque con ellas se evalúan todos los registros y esto hace más lenta la recuperación de los datos.



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

);



go



insert into libros

&nbsp; values('El aleph','Borges','Emece',15.90);

insert into libros

&nbsp; values('Cervantes y el quijote','Borges','Paidos',null);

insert into libros

&nbsp; values('Alicia en el pais de las maravillas','Lewis Carroll',null,19.90);

insert into libros

&nbsp; values('Martin Fierro','Jose Hernandez','Emece',25.90);

insert into libros (titulo,autor,precio)

&nbsp; values('Antología poética','Borges',25.50);

insert into libros (titulo,autor,precio)

&nbsp; values('Java en 10 minutos','Mario Molina',45.80);

insert into libros (titulo,autor)

&nbsp; values('Martin Fierro','Jose Hernandez');

insert into libros (titulo,autor)

&nbsp; values('Aprenda PHP','Mario Molina');



select \* from libros

&nbsp; where editorial is null;



select \* from libros

&nbsp; where editorial is not null;

