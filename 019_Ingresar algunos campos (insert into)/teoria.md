Hemos aprendido a ingresar registros listando todos los campos y colocando valores para todos y cada uno de ellos luego de "values".



Si ingresamos valores para todos los campos, podemos omitir la lista de nombres de los campos.

Por ejemplo, si tenemos creada la tabla "libros" con los campos "titulo", "autor" y "editorial", podemos ingresar un registro de la siguiente manera:



&nbsp;insert into libros

&nbsp; values ('Uno','Richard Bach','Planeta');

También es posible ingresar valores para algunos campos. Ingresamos valores solamente para los campos "titulo" y "autor":



&nbsp;insert into libros (titulo, autor)

&nbsp; values ('El aleph','Borges');

SQL Server almacenará el valor "null" en el campo "editorial", para el cual no hemos explicitado un valor.



Al ingresar registros debemos tener en cuenta:



\- la lista de campos debe coincidir en cantidad y tipo de valores con la lista de valores luego de "values". Si se listan más (o menos) campos que los valores ingresados, aparece un mensaje de error y la sentencia no se ejecuta.



\- si ingresamos valores para todos los campos podemos obviar la lista de campos.



\- podemos omitir valores para los campos que NO hayan sido declarados "not null", es decir, que permitan valores nulos (se guardará "null"); si omitimos el valor para un campo "not null", la sentencia no se ejecuta.



\- se DEBE omitir el valor para el campo"identity". Salvo que identity\_insert este en on.



\- se pueden omitir valores para campos declarados "not null" siempre que tengan definido un valor por defecto con la cláusula "default" (tema que veremos a continuación).



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; codigo int identity,

&nbsp; titulo varchar(40) not null,

&nbsp; autor varchar(30),

&nbsp; editorial varchar(15)

);



go



-- Si ingresamos valores para todos los campos, podemos omitir la lista de campos:

insert into libros

&nbsp; values ('Uno','Richard Bach','Planeta');



-- Podemos ingresar valores para algunos de los campos:

insert into libros (titulo, autor)

&nbsp; values ('El aleph','Borges');



-- No podemos omitir el valor para un campo declarado "not null",

-- como el campo "titulo" (genera error):

insert into libros (autor,editorial)

&nbsp; values ('Lewis Carroll','Planeta');



select \* from libros;

