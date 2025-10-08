Sabemos que si agregamos una restricción a una tabla que contiene datos, SQL Server los controla para asegurarse que cumplen con la condición de la restricción, si algún registro no la cumple, la restricción no se establecece.



Es posible deshabilitar esta comprobación en caso de restricciones "check".



Podemos hacerlo cuando agregamos la restricción "check" a una tabla para que SQL Server acepte los valores ya almacenados que infringen la restricción. Para ello debemos incluir la opción "with nocheck" en la instrucción "alter table":



&nbsp;alter table libros

&nbsp; with nocheck

&nbsp; add constraint CK\_libros\_precio

&nbsp; check (precio>=0);

La restricción no se aplica en los datos existentes, pero si intentamos ingresar un nuevo valor que no cumpla la restricción, SQL Server no lo permite.



Entonces, para evitar la comprobación de datos existentes al crear la restricción, la sintaxis básica es la siguiente:



&nbsp;alter table TABLA

&nbsp; with nocheck

&nbsp; add constraint NOMBRERESTRICCION

&nbsp; check (CONDICION);

Por defecto, si no especificamos, la opción es "with check".



También podemos deshabilitar las restricciones para agregar o actualizar datos sin comprobarla:



&nbsp;alter table libros

&nbsp; nocheck constraint CK\_libros\_precio;

En el ejemplo anterior deshabilitamos la restricción "CK\_libros\_precio" para poder ingresar un valor negativo para "precio".



Para habilitar una restricción deshabilitada se ejecuta la misma instrucción pero con la cláusula "check" o "check all":



&nbsp;alter table libros

&nbsp; check constraint CK\_libros\_precio;

Si se emplea "check constraint all" no se coloca nombre de restricciones, habilita todas las restricciones que tiene la tabla nombrada.



Para habilitar o deshabilitar restricciones la comprobación de datos en inserciones o actualizaciones, la sintaxis básica es:



&nbsp;alter table NOMBRETABLA

&nbsp; OPCIONdeRESTRICCION constraint NOMBRERESTRICCION;

Para saber si una restricción está habilitada o no, podemos ejecutar el procedimiento almacenado "sp\_helpconstraint" y fijarnos lo que informa la columna "status\_enabled".



Entonces, las cláusulas "check" y "nocheck" permiten habilitar o deshabilitar restricciones "check" (también las restricciones "foreign key" que veremos más adelante), a las demás se las debe eliminar ("default" y las que veremos posteriormente).



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('libros') is not null

&nbsp; drop table libros;



create table libros(

&nbsp; codigo int identity,

&nbsp; titulo varchar(40),

&nbsp; autor varchar(30),

&nbsp; editorial varchar(15),

&nbsp; precio decimal(5,2)

);



go



insert into libros values ('Uno','Bach','Planeta',22);

insert into libros values ('El quijote','Cervantes','Emece',15);

insert into libros values ('Aprenda PHP','Mario Molina','Siglo XXI',-40);



-- Agregamos una restricción "check" para asegurar que los precios no puedan ser 

-- negativos, pero como ya tenemos almacenado un precio que infringe la restricción,

-- vamos a especificar que no haya comprobación de datos existentes:

alter table libros

&nbsp;  with nocheck

&nbsp;  add constraint CK\_libros\_precio\_positivo

&nbsp;  check (precio>=0);



-- Si intentamos ingresar un registro con precio negativo, no lo permite.

-- Para que lo permita, debemos dehabilitar la comprobación:

alter table libros

&nbsp; nocheck constraint CK\_libros\_precio\_positivo;



-- Ingresemos un registro con precio negativo (si lo permite):

insert into libros values('Java en 10 minutos',default,'Siglo XXI',-1);



-- Veamos si la restricción está o no habilitada:

-- La columna "status\_enabled" nos informa que está deshabilitada (Disabled)

exec sp\_helpconstraint libros;



-- Habilitamos la restricción.

-- Si ahora intentamos ingresar un precio negativo SQL Server no lo permitirá.

alter table libros

&nbsp; check constraint CK\_libros\_precio\_positivo;



select \* from libros;

