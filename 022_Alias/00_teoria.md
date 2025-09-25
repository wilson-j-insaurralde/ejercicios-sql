Una manera de hacer más comprensible el resultado de una consulta consiste en cambiar los encabezados de las columnas.

Por ejemplo, tenemos la tabla "agenda" con un campo "nombre" (entre otros) en el cual se almacena el nombre y apellido de nuestros amigos; queremos que al mostrar la información de dicha tabla aparezca como encabezado del campo "nombre" el texto "nombre y apellido", para ello colocamos un alias de la siguiente manera:



&nbsp;select nombre as NombreYApellido,

&nbsp; domicilio,telefono

&nbsp; from agenda;

Para reemplazar el nombre de un campo por otro, se coloca la palabra clave "as" seguido del texto del encabezado.



Si el alias consta de una sola cadena las comillas no son necesarias, pero si contiene más de una palabra, es necesario colocarla entre comillas simples:



&nbsp;select nombre as 'Nombre y apellido',

&nbsp; domicilio,telefono

&nbsp; from agenda;

Un alias puede contener hasta 128 caracteres.

También se puede crear un alias para columnas calculadas.



La palabra clave "as" es opcional en algunos casos, pero es conveniente usarla.



Entonces, un "alias" se usa como nombre de un campo o de una expresión. En estos casos, son opcionales, sirven para hacer más comprensible el resultado; en otros casos, que veremos más adelante, son obligatorios.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('agenda') is not null

&nbsp; drop table agenda;



create table agenda(

&nbsp; nombre varchar(30),

&nbsp; domicilio varchar(30),

&nbsp; telefono varchar(11)

);



go



insert into agenda

&nbsp; values('Juan Perez','Avellaneda 908','4252525');

insert into agenda

&nbsp; values('Marta Lopez','Sucre 34','4556688');

insert into agenda

&nbsp; values('Carlos Garcia','Sarmiento 1258',null);



select nombre as NombreYApellido,

&nbsp; domicilio,telefono

&nbsp; from agenda;



select nombre as 'Nombre y apellido',

&nbsp; domicilio,telefono

&nbsp; from agenda;



select nombre 'Nombre y apellido',

&nbsp; domicilio,telefono

&nbsp; from agenda;

