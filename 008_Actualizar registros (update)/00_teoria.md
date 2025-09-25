Decimos que actualizamos un registro cuando modificamos alguno de sus valores.



Para modificar uno o varios datos de uno o varios registros utilizamos "update" (actualizar).



Por ejemplo, en nuestra tabla "usuarios", queremos cambiar los valores de todas las claves, por "RealMadrid":



&nbsp;update usuarios set clave='RealMadrid';

Utilizamos "update" junto al nombre de la tabla y "set" junto con el campo a modificar y su nuevo valor.



El cambio afectará a todos los registros.



Podemos modificar algunos registros, para ello debemos establecer condiciones de selección con "where".

Por ejemplo, queremos cambiar el valor correspondiente a la clave de nuestro usuario llamado "Federicolopez", queremos como nueva clave "Boca", necesitamos una condición "where" que afecte solamente a este registro:



&nbsp;update usuarios set clave='Boca'

&nbsp; where nombre='Federicolopez';

Si Microsoft SQL Server no encuentra registros que cumplan con la condición del "where", no se modifica ninguno.



Las condiciones no son obligatorias, pero si omitimos la cláusula "where", la actualización afectará a todos los registros.



También podemos actualizar varios campos en una sola instrucción:



&nbsp;update usuarios set nombre='Marceloduarte', clave='Marce'

&nbsp; where nombre='Marcelo';

Para ello colocamos "update", el nombre de la tabla, "set" junto al nombre del campo y el nuevo valor y separado por coma, el otro nombre del campo con su nuevo valor.



Servidor de SQL Server instalado en forma local.

Ingresemos el siguiente lote de comandos en el SQL Server Management Studio:



if object\_id('usuarios') is not null

&nbsp; drop table usuarios;



create table usuarios(

&nbsp; nombre varchar(20),

&nbsp; clave varchar(10)

);



go



insert into usuarios (nombre,clave)

&nbsp; values ('Marcelo','River');

insert into usuarios (nombre,clave)

&nbsp; values ('Susana','chapita');

insert into usuarios (nombre,clave)

&nbsp; values ('Carlosfuentes','Boca');

insert into usuarios (nombre,clave)

&nbsp; values ('Federicolopez','Boca');



update usuarios set clave='RealMadrid';



select \* from usuarios;



update usuarios set clave='Boca'

&nbsp; where nombre='Federicolopez';



select \* from usuarios;



update usuarios set clave='payaso'

&nbsp; where nombre='JuanaJuarez';



select \* from usuarios;



update usuarios set nombre='Marceloduarte', clave='Marce'

&nbsp; where nombre='Marcelo';



select \* from usuarios;

