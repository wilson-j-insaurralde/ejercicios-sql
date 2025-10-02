Es importante, al diseñar una base de datos y las tablas que contiene, tener en cuenta la integridad de los datos, esto significa que la información almacenada en las tablas debe ser válida, coherente y exacta.



Hasta el momento, hemos controlado y restringido la entrada de valores a un campo mediante el tipo de dato que le definimos (cadena, numéricos, etc.), la aceptación o no de valores nulos, el valor por defecto. También hemos asegurado que cada registro de una tabla sea único definiendo una clave primaria y empleando la propiedad identity.



SQL Server ofrece más alternativas, además de las aprendidas, para restringir y validar los datos, las veremos ordenadamente y al finalizar haremos un resumen de las mismas.



Comenzamos por las restricciones.



Las restricciones (constraints) son un método para mantener la integridad de los datos, asegurando que los valores ingresados sean válidos y que las relaciones entre las tablas se mantenga. Se establecen a los campos y las tablas.



Pueden definirse al crear la tabla ("create table") o agregarse a una tabla existente (empleando "alter table") y se pueden aplicar a un campo o a varios. Se aconseja crear las tablas y luego agregar las restricciones.



Se pueden crear, modificar y eliminar las restricciones sin eliminar la tabla y volver a crearla.



El procedimiento almacenado del sistema "sp\_helpconstraint" junto al nombre de la tabla, nos muestra información acerca de las restricciones de dicha tabla.



Cuando se agrega una restricción a una tabla, SQL Server comprueba los datos existentes.

Hay varios tipos de restricciones.

