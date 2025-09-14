Un campo numérico puede tener un atributo extra "identity". Los valores de un campo con este atributo genera valores secuenciales que se inician en 1 y se incrementan en 1 automáticamente.



Se utiliza generalmente en campos correspondientes a códigos de identificación para generar valores únicos para cada nuevo registro que se inserta.



Sólo puede haber un campo "identity" por tabla.



Para que un campo pueda establecerse como "identity", éste debe ser entero (también puede ser de un subtipo de entero o decimal con escala 0, tipos que estudiaremos posteriormente).



Para que un campo genere sus valores automáticamente, debemos agregar el atributo "identity" luego de su definición al crear la tabla:



&nbsp;create table libros(

&nbsp; codigo int identity,

&nbsp; titulo varchar(40) not null,

&nbsp; autor varchar(30),

&nbsp; editorial varchar(15),

&nbsp; precio float

&nbsp;);

Cuando un campo tiene el atributo "identity" no se puede ingresar valor para él, porque se inserta automáticamente tomando el último valor como referencia, o 1 si es el primero.



Para ingresar registros omitimos el campo definido como "identity", por ejemplo:



&nbsp;insert into libros (titulo,autor,editorial,precio)

&nbsp; values('El aleph','Borges','Emece',23);

Este primer registro ingresado guardará el valor 1 en el campo correspondiente al código.



Si continuamos ingresando registros, el código (dato que no ingresamos) se cargará automáticamente siguiendo la secuencia de autoincremento.



No está permitido ingresar el valor correspondiente al campo "identity", por ejemplo:



&nbsp;insert into libros (codigo,titulo,autor,editorial,precio)

&nbsp; values(5,'Martin Fierro','Jose Hernandez','Paidos',25);

generará un mensaje de error.



"identity" permite indicar el valor de inicio de la secuencia y el incremento, pero lo veremos posteriormente.



Un campo definido como "identity" generalmente se establece como clave primaria.



Un campo "identity" no es editable, es decir, no se puede ingresar un valor ni actualizarlo.



Un campo de identidad no permite valores nulos, aunque no se indique especificamente. Si ejecutamos el procedimiento "sp\_columns()" veremos que en el campo "codigo" en la columna "TYPE\_NAME" aparece "int identity" y en la columna "IS\_NULLABLE" aparece "NO".



Los valores secuenciales de un campo "identity" se generan tomando como referencia el último valor ingresado; si se elimina el último registro ingresado (por ejemplo 3) y luego se inserta otro registro, SQL Server seguirá la secuencia, es decir, colocará el valor "4".



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; codigo int identity,

&nbsp; titulo varchar(40) not null,

&nbsp; autor varchar(30),

&nbsp; editorial varchar(15),

&nbsp; precio float

);



go



insert into libros (titulo,autor,editorial,precio)

&nbsp; values('El aleph','Borges','Emece',23);



select \* from libros;



insert into libros (titulo,autor,editorial,precio)

&nbsp; values('Uno','Richard Bach','Planeta',18);

insert into libros (titulo,autor,editorial,precio)

&nbsp; values('Aprenda PHP','Mario Molina','Siglo XXI',45.60);

insert into libros (titulo,autor,editorial,precio)

&nbsp; values('Alicia en el pais de maravillas','Lewis Carroll','Paidos',15.50);



select \* from libros;



-- Intentemos ingresar un valor para el campo "codigo" (genera error):

insert into libros (codigo,titulo,autor,editorial,precio)

&nbsp; values(5,'Martin Fierro','Jose Hernandez','Paidos',25);



-- Intentemos cambiar el valor de código de un registro (genera error):

update libros set codigo=9

&nbsp; where titulo='Uno';



exec sp\_columns libros;



-- Eliminemos el último registro:

delete from libros

&nbsp; where autor='Lewis Carroll';



-- Ingresamos un quinto registro

insert into libros (titulo, autor, editorial, precio)

&nbsp; values('Martin Fierro','Jose Hernandez','Paidos',25); 



--  El campo código se guardó el valor secuencial sin considerar que el valor "4" ya no existe:

select \* from libros;

