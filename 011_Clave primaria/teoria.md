Una clave primaria es un campo (o varios) que identifica un solo registro (fila) en una tabla.

Para un valor del campo clave existe solamente un registro.



Veamos un ejemplo, si tenemos una tabla con datos de personas, el número de documento puede establecerse como clave primaria, es un valor que no se repite; puede haber personas con igual apellido y nombre, incluso el mismo domicilio (padre e hijo por ejemplo), pero su documento será siempre distinto.



Si tenemos la tabla "usuarios", el nombre de cada usuario puede establecerse como clave primaria, es un valor que no se repite; puede haber usuarios con igual clave, pero su nombre de usuario será siempre diferente.



Podemos establecer que un campo sea clave primaria al momento de crear la tabla o luego que ha sido creada. Vamos a aprender a establecerla al crear la tabla. Hay 2 maneras de hacerlo, por ahora veremos la sintaxis más sencilla.



Tenemos nuestra tabla "usuarios" definida con 2 campos ("nombre" y "clave").

La sintaxis básica y general es la siguiente:





&nbsp;create table NOMBRETABLA(

&nbsp; CAMPO TIPO,

&nbsp; ...

&nbsp; primary key (NOMBRECAMPO)

&nbsp;);

En el siguiente ejemplo definimos una clave primaria, para nuestra tabla "usuarios" para asegurarnos que cada usuario tendrá un nombre diferente y único:



&nbsp;create table usuarios(

&nbsp; nombre varchar(20),

&nbsp; clave varchar(10),

&nbsp; primary key(nombre)

&nbsp;);

Lo que hacemos agregar luego de la definición de cada campo, "primary key" y entre paréntesis, el nombre del campo que será clave primaria.



Una tabla sólo puede tener una clave primaria. Cualquier campo (de cualquier tipo) puede ser clave primaria, debe cumplir como requisito, que sus valores no se repitan ni sean nulos. Por ello, al definir un campo como clave primaria, automáticamente SQL Server lo convierte a "not null".



Luego de haber establecido un campo como clave primaria, al ingresar los registros, SQL Server controla que los valores para el campo establecido como clave primaria no estén repetidos en la tabla; si estuviesen repetidos, muestra un mensaje y la inserción no se realiza. Es decir, si en nuestra tabla "usuarios" ya existe un usuario con nombre "juanperez" e intentamos ingresar un nuevo usuario con nombre "juanperez", aparece un mensaje y la instrucción "insert" no se ejecuta.



Igualmente, si realizamos una actualización, SQL Server controla que los valores para el campo establecido como clave primaria no estén repetidos en la tabla, si lo estuviese, aparece un mensaje indicando que se viola la clave primaria y la actualización no se realiza.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('usuarios') is not null

&nbsp; drop table usuarios;



create table usuarios(

&nbsp; nombre varchar(20),

&nbsp; clave varchar(10),

&nbsp; primary key(nombre)

);



go



exec sp\_columns usuarios;



insert into usuarios (nombre, clave)

&nbsp; values ('juanperez','Boca');

insert into usuarios (nombre, clave)

&nbsp; values ('raulgarcia','River');



--  Intentamos ingresar un valor de clave primaria existente (genera error):

insert into usuarios (nombre, clave)

&nbsp; values ('juanperez','payaso');



-- Intentamos ingresar el valor "null" en el campo clave primaria (genera error):

insert into usuarios (nombre, clave)

&nbsp; values (null,'payaso');



-- Intentemos actualizar el nombre de un usuario colocando un nombre existente (genera error):

update usuarios set nombre='juanperez'

&nbsp; where nombre='raulgarcia';

