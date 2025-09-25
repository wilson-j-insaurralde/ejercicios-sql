Hemos visto que si al insertar registros no se especifica un valor para un campo que admite valores nulos, se ingresa automaticamente "null" y si el campo está declarado "identity", se inserta el siguiente de la secuencia. A estos valores se les denomina valores por defecto o predeterminados.



Un valor por defecto se inserta cuando no está presente al ingresar un registro y en algunos casos en que el dato ingresado es inválido.



Para campos de cualquier tipo no declarados "not null", es decir, que admiten valores nulos, el valor por defecto es "null". Para campos declarados "not null", no existe valor por defecto, a menos que se declare explícitamente con la cláusula "default".



Para todos los tipos, excepto los declarados "identity", se pueden explicitar valores por defecto con la cláusula "default".



Podemos establecer valores por defecto para los campos cuando creamos la tabla. Para ello utilizamos "default" al definir el campo. Por ejemplo, queremos que el valor por defecto del campo "autor" de la tabla "libros" sea "Desconocido" y el valor por defecto del campo "cantidad" sea "0":



&nbsp;create table libros(

&nbsp; codigo int identity,

&nbsp; titulo varchar(40),

&nbsp; autor varchar(30) not null default 'Desconocido', 

&nbsp; editorial varchar(20),

&nbsp; precio decimal(5,2),

&nbsp; cantidad tinyint default 0

&nbsp;);

Si al ingresar un nuevo registro omitimos los valores para el campo "autor" y "cantidad", Sql Server insertará los valores por defecto; el siguiente valor de la secuencia en "codigo", en "autor" colocará "Desconocido" y en cantidad "0".



Entonces, si al definir el campo explicitamos un valor mediante la cláusula "default", ése será el valor por defecto.



Ahora, al visualizar la estructura de la tabla con "sp\_columns" podemos entender lo que informa la columna "COLUMN\_DEF", muestra el valor por defecto del campo.



También se puede utilizar "default" para dar el valor por defecto a los campos en sentencias "insert", por ejemplo:



&nbsp;insert into libros (titulo,autor,precio,cantidad)

&nbsp; values ('El gato con botas',default,default,100);

Si todos los campos de una tabla tienen valores predeterminados (ya sea por ser "identity", permitir valores nulos o tener un valor por defecto), se puede ingresar un registro de la siguiente manera:



&nbsp;insert into libros default values;

La sentencia anterior almacenará un registro con los valores predetermiandos para cada uno de sus campos.



Entonces, la cláusula "default" permite especificar el valor por defecto de un campo. Si no se explicita, el valor por defecto es "null", siempre que el campo no haya sido declarado "not null".



Los campos para los cuales no se ingresan valores en un "insert" tomarán los valores por defecto:



\- si tiene el atributo "identity": el valor de inicio de la secuencia si es el primero o el siguiente valor de la secuencia, no admite cláusula "default";



\- si permite valores nulos y no tiene cláusula "default", almacenará "null";



\- si está declarado explícitamente "not null", no tiene valor "default" y no tiene el atributo "identity", no hay valor por defecto, así que causará un error y el "insert" no se ejecutará.



\- si tiene cláusula "default" (admita o no valores nulos), el valor definido como predeterminado;



\- para campos de tipo fecha y hora, si omitimos la parte de la fecha, el valor predeterminado para la fecha es "1900-01-01" y si omitimos la parte de la hora, "00:00:00".



Un campo sólo puede tener un valor por defecto. Una tabla puede tener todos sus campos con valores por defecto. Que un campo tenga valor por defecto no significa que no admita valores nulos, puede o no admitirlos.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; codigo int identity,

&nbsp; titulo varchar(40),

&nbsp; autor varchar(30) not null default 'Desconocido', 

&nbsp; editorial varchar(20),

&nbsp; precio decimal(5,2),

&nbsp; cantidad tinyint default 0

);



go



-- Ingresamos un registro omitiendo los valores para el campo "autor" y "cantidad":

insert into libros (titulo,editorial,precio)

&nbsp; values('Java en 10 minutos','Paidos',50.40);



select \* from libros;



-- Si ingresamos un registro sin valor para el campo "precio", 

-- que admite valores nulos, se ingresará "null" en ese campo:

insert into libros (titulo,editorial)

&nbsp; values('Aprenda PHP','Siglo XXI');



select \* from libros;



-- Visualicemos la estructura de la tabla:

exec sp\_columns libros;



-- Podemos emplear "default" para dar el valor por defecto a algunos campos:

insert into libros (titulo,autor,precio,cantidad)

&nbsp; values ('El gato con botas',default,default,100);



select \* from libros;



-- Como todos los campos de "libros" tienen valores predeterminados, podemos tipear:

insert into libros default values;



select \* from libros;



-- Podemos ingresar el valor "null" en el campo "cantidad":

insert into libros (titulo,autor,cantidad)

&nbsp; values ('Alicia en el pais de las maravillas','Lewis Carroll',null);

