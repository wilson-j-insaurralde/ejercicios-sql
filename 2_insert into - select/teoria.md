Un registro es una fila de la tabla que contiene los datos propiamente dichos. Cada registro tiene un dato por cada columna (campo). Nuestra tabla "usuarios" consta de 2 campos, "nombre" y "clave".



Al ingresar los datos de cada registro debe tenerse en cuenta la cantidad y el orden de los campos.



La sintaxis básica y general es la siguiente:



&nbsp;insert into NOMBRETABLA (NOMBRECAMPO1, ..., NOMBRECAMPOn)

&nbsp;values (VALORCAMPO1, ..., VALORCAMPOn);

Usamos "insert into", luego el nombre de la tabla, detallamos los nombres de los campos entre paréntesis y separados por comas y luego de la cláusula "values" colocamos los valores para cada campo, también entre paréntesis y separados por comas.



Para agregar un registro a la tabla tipeamos:



&nbsp;insert into usuarios (nombre, clave) values ('Mariano','payaso');

Note que los datos ingresados, como corresponden a cadenas de caracteres se colocan entre comillas simples.



Para ver los registros de una tabla usamos "select":



&nbsp;select \* from usuarios;

El comando "select" recupera los registros de una tabla.

Con el asterisco indicamos que muestre todos los campos de la tabla "usuarios".



Es importante ingresar los valores en el mismo orden en que se nombran los campos:



&nbsp;insert into usuarios (clave, nombre) values ('River','Juan');

En el ejemplo anterior se nombra primero el campo "clave" y luego el campo "nombre" por eso, los valores también se colocan en ese orden.



Si ingresamos los datos en un orden distinto al orden en que se nombraron los campos, no aparece un mensaje de error y los datos se guardan de modo incorrecto.



En el siguiente ejemplo se colocan los valores en distinto orden en que se nombran los campos, el valor de la clave (la cadena "Boca") se guardará en el campo "nombre" y el valor del nombre (la cadena "Luis") en el campo "clave":



&nbsp;insert into usuarios (nombre,clave) values ('Boca','Luis');

