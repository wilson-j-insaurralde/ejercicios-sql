Con la cláusula "distinct" se especifica que los registros con ciertos datos duplicados sean obviadas en el resultado. Por ejemplo, queremos conocer todos los autores de los cuales tenemos libros, si utilizamos esta sentencia:



&nbsp;select autor from libros;

Aparecen repetidos. Para obtener la lista de autores sin repetición usamos:



&nbsp;select distinct autor from libros;

También podemos tipear:



&nbsp;select autor from libros

&nbsp; group by autor;

Note que en los tres casos anteriores aparece "null" como un valor para "autor"· Si sólo queremos la lista de autores conocidos, es decir, no queremos incluir "null" en la lista, podemos utilizar la sentencia siguiente:



&nbsp;select distinct autor from libros

&nbsp; where autor is not null;

Para contar los distintos autores, sin considerar el valor "null" usamos:



&nbsp;select count(distinct autor)

&nbsp; from libros;

Note que si contamos los autores sin "distinct", no incluirá los valores "null" pero si los repetidos:



&nbsp;select count(autor)

&nbsp; from libros;

Esta sentencia cuenta los registros que tienen autor.



Podemos combinarla con "where". Por ejemplo, queremos conocer los distintos autores de la editorial "Planeta":



&nbsp;select distinct autor from libros

&nbsp; where editorial='Planeta';

También puede utilizarse con "group by" para contar los diferentes autores por editorial:



&nbsp;select editorial, count(distinct autor)

&nbsp; from libros

&nbsp; group by editorial;

La cláusula "distinct" afecta a todos los campos presentados. Para mostrar los títulos y editoriales de los libros sin repetir títulos ni editoriales, usamos:



&nbsp;select distinct titulo,editorial

&nbsp; from libros

&nbsp; order by titulo;

Note que los registros no están duplicados, aparecen títulos iguales pero con editorial diferente, cada registro es diferente.



Entonces, "distinct" elimina registros duplicados.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; codigo int identity,

&nbsp; titulo varchar(40),

&nbsp; autor varchar(30),

&nbsp; editorial varchar(15),

&nbsp; primary key(codigo)

);



go



insert into libros

&nbsp; values('El aleph','Borges','Planeta');

insert into libros

&nbsp; values('Martin Fierro','Jose Hernandez','Emece');

insert into libros

&nbsp; values('Martin Fierro','Jose Hernandez','Planeta');

insert into libros

&nbsp; values('Antologia poetica','Borges','Planeta');

insert into libros

&nbsp; values('Aprenda PHP','Mario Molina','Emece');

insert into libros

&nbsp; values('Aprenda PHP','Lopez','Emece');

insert into libros

&nbsp; values('Manual de PHP', 'J. Paez', null);

insert into libros

&nbsp; values('Cervantes y el quijote',null,'Paidos');

insert into libros

&nbsp; values('Harry Potter y la piedra filosofal','J.K. Rowling','Emece');

insert into libros

&nbsp; values('Harry Potter y la camara secreta','J.K. Rowling','Emece');

insert into libros

&nbsp; values('Alicia en el pais de las maravillas','Lewis Carroll','Paidos');

insert into libros

&nbsp; values('Alicia en el pais de las maravillas','Lewis Carroll','Planeta');

insert into libros

&nbsp; values('PHP de la A a la Z',null,null);

insert into libros

&nbsp; values('Uno','Richard Bach','Planeta');



-- Para obtener la lista de autores sin repetición

select distinct autor from libros;



-- Para obtener la lista de autores conocidos, es decir, no incluyendo "null" 

-- en la lista:

select distinct autor from libros

&nbsp; where autor is not null;



-- Contamos los distintos autores

select count(distinct autor)

&nbsp; from libros;



-- Nombres de las editoriales sin repetir:

select distinct editorial from libros;



--  Cantidad de editoriales distintas:

select count(distinct editorial) from libros;



-- Distintos autores de la editorial "Planeta":

select distinct autor from libros

&nbsp; where editorial='Planeta';



-- Distintos autores que tiene cada editorial empleando "group by":

select editorial,count(distinct autor)

&nbsp; from libros

&nbsp; group by editorial;



-- Mostramos los títulos y editoriales de los libros sin repetir 

-- títulos ni editoriales:

select distinct titulo,editorial

&nbsp; from libros

&nbsp; order by titulo;

