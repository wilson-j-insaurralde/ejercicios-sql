Las funciones definidas por el usuario pueden encriptarse, para evitar que sean leídas con "sp\_helptext".



Para ello debemos agregar al crearlas la opción "with encryption" antes de "as".



En funciones escalares:



&#x20;create function NOMBREFUNCION

&#x20;(@PARAMETRO TIPO) 

&#x20; returns TIPO

&#x20; with encryption

&#x20; as 

&#x20; begin

&#x20;  CUERPO

&#x20;  return EXPRESION

&#x20; end

En funciones de tabla de varias sentencias se coloca luego del formato de la tabla a retornar:



&#x20;create function NOMBREFUNCION

&#x20;(@PARAMETRO TIPO)

&#x20;returns @NOMBRETABLARETORNO table-- nombre de la tabla

&#x20;--formato de la tabla

&#x20;(CAMPO1 TIPO,

&#x20; CAMPO2 TIPO,

&#x20; CAMPO3 TIPO

&#x20;)

&#x20;with encryption

&#x20;as

&#x20;begin

&#x20;  insert @NOMBRETABLARETORNO

&#x20;   select CAMPOS from TABLA

&#x20;    where campo OPERADOR @PARAMETRO

&#x20;  RETURN

&#x20;end

En funciones con valores de tabla en línea:



&#x20;create function NOMBREFUNCION

&#x20;(@PARAMETRO TIPO=VALORPORDEFECTO)

&#x20;returns table

&#x20;with encryption

&#x20;as

&#x20;return (SELECT);

Veamos un ejemplo:



&#x20;create function f\_libros

&#x20;(@autor varchar(30)='Borges')

&#x20;returns table

&#x20;with encryption

&#x20;as

&#x20;return (

&#x20; select titulo,editorial

&#x20; from libros

&#x20; where autor like '%'+@autor+'%'

&#x20;);

Si ejecutamos el procedimiento almacenado del sistema "sp\_helptext" seguido del nombre de la función creada anteriormente, SQL Server mostrará un mensaje indicando que tal función está encriptada.





