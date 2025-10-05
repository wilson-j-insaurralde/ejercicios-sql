La restricción "default" especifica un valor por defecto para un campo cuando no se inserta explícitamente en un comando "insert".



Anteriormente, para establecer un valor por defecto para un campo empleábamos la cláusula "default" al crear la tabla, por ejemplo:



&nbsp;create table libros(

&nbsp; ...

&nbsp; autor varchar(30) default 'Desconocido',

&nbsp; ...

&nbsp;);

Cada vez que establecíamos un valor por defecto para un campo de una tabla, SQL Server creaba automáticamente una restricción "default" para ese campo de esa tabla.



Dicha restricción, a la cual no le dábamos un nombre, recibía un nombre dado por SQL Server que consiste "DF" (por default), seguido del nombre de la tabla, el nombre del campo y letras y números aleatorios.



Podemos agregar una restricción "default" a una tabla existente con la sintaxis básica siguiente:



&nbsp;alter table NOMBRETABLA

&nbsp;add constraint NOMBRECONSTRAINT

&nbsp;default VALORPORDEFECTO

&nbsp;for CAMPO;

En la sentencia siguiente agregamos una restricción "default" al campo autor de la tabla existente "libros", que almacena el valor "Desconocido" en dicho campo si no ingresamos un valor en un "insert":



&nbsp;alter table libros

&nbsp;add constraint DF\_libros\_autor

&nbsp;default 'Desconocido'

&nbsp;for autor;

Por convención, cuando demos el nombre a las restricciones "default" emplearemos un formato similar al que le da SQL Server: "DF\_NOMBRETABLA\_NOMBRECAMPO".



Solamente se permite una restricción "default" por campo y no se puede emplear junto con la propiedad "identity". Una tabla puede tener varias restricciones "default" para sus distintos campos.



La restricción "default" acepta valores tomados de funciones del sistema, por ejemplo, podemos establecer que el valor por defecto de un campo de tipo datetime sea "getdate()".



Podemos ver información referente a las restriciones de una tabla con el procedimiento almacenado "sp\_helpcontraint":



&nbsp;exec sp\_helpconstraint libros;

aparecen varias columnas con la siguiente información:



\- constraint\_type: el tipo de restricción y sobre qué campo está establecida 

&nbsp; (DEFAULT on column autor),

\- constraint\_name: el nombre de la restricción (DF\_libros\_autor),

\- delete\_action y update\_action: no tienen valores para este tipo de restricción.

\- status\_enabled y status\_for\_replication: no tienen valores para este tipo 

&nbsp; de restricción.

\- constraint\_keys: el valor por defecto (Desconocido).

Entonces, la restricción "default" especifica un valor por defecto para un campo cuando no se inserta explícitamente en un "insert", se puede establecer uno por campo y no se puede emplear junto con la propiedad "identity".



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; codigo int identity,

&nbsp; titulo varchar(40),

&nbsp; autor varchar(30) default 'Desconocido',

&nbsp; editorial varchar(15),

&nbsp; precio decimal(6,2)

);



go



insert into libros (titulo,editorial) values('Martin Fierro','Emece');

insert into libros (titulo,editorial) values('Aprenda PHP','Emece');



-- Veamos que SQL Server creó automáticamente una restricción "default"

-- para el campo "autor":

exec sp\_helpconstraint libros;



drop table libros;



create table libros(

&nbsp; codigo int identity,

&nbsp; titulo varchar(40),

&nbsp; autor varchar(30),

&nbsp; editorial varchar(15),

&nbsp; precio decimal(6,2)

);



go



-- Agregamos una restricción "default" empleando "alter table" 

-- para que almacene el valor "Desconocido" en el campo "autor":

alter table libros

&nbsp; add constraint DF\_libros\_autor

&nbsp; default 'Desconocido'

&nbsp; for autor;



-- Veamos la restrición agregada anteriormente con el procedimiento 

-- almacenado "sp\_helpcontraint":

exec sp\_helpconstraint libros;



insert into libros (titulo,editorial) values('Martin Fierro','Emece');

insert into libros default values;



-- Veamos cómo se almacenaron los registros sin valor explícito

-- para el campo con restricción "default":

select \* from libros;



-- Agregamos otra restricción "default" para el campo "precio" 

-- para que almacene el valor 0 en dicho campo:

alter table libros

&nbsp; add constraint DF\_libros\_precio

&nbsp; default 0

&nbsp; for precio;



exec sp\_helpconstraint libros;

