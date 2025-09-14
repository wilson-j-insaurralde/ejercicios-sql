/*
Un comercio que tiene un stand en una feria registra en una tabla llamada "visitantes" algunos datos de las personas que visitan o compran en su stand para luego enviarle publicidad de sus productos.

Eliminamos la tabla "visitantes", si existe:

 if object_id('visitantes') is not null
  drop table visitantes;
Creamos con la siguiente estructura:

 create table visitantes(
  nombre varchar(30),
  edad integer,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11)
 );
Los campos "nombre", "domicilio" y "ciudad" almacenar�n valores cuya longitud var�a, por ello elegimos el tipo "varchar" y le damos a cada uno una longitud m�xima estimando su tama�o. El campo "sexo" se define de tipo "char", porque necesitamos solamente 1 caracter "f" o "m", que siempre ser� fijo. El campo "telefono" tambi�n se define como varchar porque no todos los n�meros telef�nicos tienen la misma longitud.

Intentamos ingresar una cadena de mayor longitud que la definida:

 insert into visitantes (nombre,edad,sexo,domicilio,ciudad,telefono)
  values ('Juan Juarez',32,'masc','Avellaneda 789','Cordoba','4234567');
aparece un mensaje de error y la sentencia no se ejecuta

Ingresamos un n�mero telef�nico olvidando las comillas, es decir, como un valor num�rico:

 insert into visitantes (nombre,edad,sexo,domicilio,ciudad,telefono)
  values ('Marcela Morales',43,'f','Colon 456','Cordoba',4567890);
lo convierte a cadena, ve�moslo:

 select * from visitantes;
*/
 if object_id('visitantes') is not null
  drop table visitantes;

 create table visitantes(
  nombre varchar(30),
  edad integer,
  sexo char(1),
  domicilio varchar(30),
  ciudad varchar(20),
  telefono varchar(11)
 );

 insert into visitantes (nombre,edad,sexo,domicilio,ciudad,telefono)
  values ('Juan Juarez',32,'masc','Avellaneda 789','Cordoba','4234567');

 insert into visitantes (nombre,edad,sexo,domicilio,ciudad,telefono)
  values ('Marcela Morales',43,'f','Colon 456','Cordoba',4567890);

 select * from visitantes;