Hemos visto las restricciones que se aplican a los campos, "default" y "check".



Ahora veremos las restricciones que se aplican a las tablas, que aseguran valores únicos para cada registro.



Hay 2 tipos: 1) primary key y 2) unique.



Anteriormente, para establecer una clave primaria para una tabla empleábamos la siguiente sintaxis al crear la tabla, por ejemplo:



&nbsp;create table libros(

&nbsp; codigo int not null,

&nbsp; titulo varchar(30),

&nbsp; autor varchar(30),

&nbsp; editorial varchar(20),

&nbsp; primary key(codigo)

&nbsp;);

Cada vez que establecíamos la clave primaria para la tabla, SQL Server creaba automáticamente una restricción "primary key" para dicha tabla. Dicha restricción, a la cual no le dábamos un nombre, recibía un nombre dado por SQL Server que comienza con "PK" (por primary key), seguido del nombre de la tabla y una serie de letras y números aleatorios.



Podemos agregar una restricción "primary key" a una tabla existente con la sintaxis básica siguiente:



&nbsp;alter table NOMBRETABLA

&nbsp;add constraint NOMBRECONSTRAINT

&nbsp;primary key (CAMPO,...);

En el siguiente ejemplo definimos una restricción "primary key" para nuestra tabla "libros" para asegurarnos que cada libro tendrá un código diferente y único:



&nbsp;alter table libros

&nbsp;add constraint PK\_libros\_codigo

&nbsp;primary key(codigo);

Con esta restricción, si intentamos ingresar un registro con un valor para el campo "codigo" que ya existe o el valor "null", aparece un mensaje de error, porque no se permiten valores duplicados ni nulos. Igualmente, si actualizamos.



Por convención, cuando demos el nombre a las restricciones "primary key" seguiremos el formato "PK\_NOMBRETABLA\_NOMBRECAMPO".



Sabemos que cuando agregamos una restricción a una tabla que contiene información, SQL Server controla los datos existentes para confirmar que cumplen las exigencias de la restricción, si no los cumple, la restricción no se aplica y aparece un mensaje de error. Por ejemplo, si intentamos definir la restricción "primary key" para "libros" y hay registros con códigos repetidos o con un valor "null", la restricción no se establece.



Cuando establecíamos una clave primaria al definir la tabla, automáticamente SQL Server redefinía el campo como "not null"; pero al agregar una restricción "primary key", los campos que son clave primaria DEBEN haber sido definidos "not null" (o ser implícitamente "not null" si se definen identity).



SQL Server permite definir solamente una restricción "primary key" por tabla, que asegura la unicidad de cada registro de una tabla.



Si ejecutamos el procedimiento almacenado "sp\_helpconstraint" junto al nombre de la tabla, podemos ver las restricciones "primary key" (y todos los tipos de restricciones) de dicha tabla.



Un campo con una restricción "primary key" puede tener una restricción "check".



Un campo "primary key" también acepta una restricción "default" (excepto si es identity), pero no tiene sentido ya que el valor por defecto solamente podrá ingresarse una vez; si intenta ingresarse cuando otro registro ya lo tiene almacenado, aparecerá un mensaje de error indicando que se intenta duplicar la clave.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; codigo int not null,

&nbsp; titulo varchar(40),

&nbsp; autor varchar(30),

&nbsp; editorial varchar(15),

&nbsp; primary key (codigo)

);



go



-- Veamos la restricción "primary key" que creó automáticamente SQL Server:

exec sp\_helpconstraint libros;



-- Vamos a eliminar la tabla y la crearemos nuevamente, sin establecer la 

-- clave primaria:

drop table libros;



create table libros(

&nbsp; codigo int not null,

&nbsp; titulo varchar(40),

&nbsp; autor varchar(30),

&nbsp; editorial varchar(15)

);



go



-- Definimos una restricción "primary key" para nuestra tabla "libros" 

-- para asegurarnos que cada libro tendrá un código diferente y único:

alter table libros

&nbsp;add constraint PK\_libros\_codigo

&nbsp;primary key(codigo);



-- Veamos la información respecto a ella:

exec sp\_helpconstraint libros;

