/*
Primer problema:
Un banco tiene registrados las cuentas corrientes de sus clientes en una tabla llamada "cuentas".
La tabla contiene estos datos:
	Número de Cuenta        Documento       Nombre          Saldo
	______________________________________________________________
        1234                          25666777        Pedro Perez     500000.60
        2234                          27888999        Juan Lopez      -250000
        3344                          27888999        Juan Lopez      4000.50
        3346                          32111222        Susana Molina   1000

1- Elimine la tabla "cuentas" si existe:
 if object_id('cuentas') is not null
  drop table cuentas;

2- Cree la tabla eligiendo el tipo de dato adecuado para almacenar los datos descriptos arriba:

 - Número de cuenta: entero, no nulo, no puede haber valores repetidos, clave primaria;
 - Documento del propietario de la cuenta: cadena de caracteres de 8 de longitud (siempre 8), no nulo;
 - Nombre del propietario de la cuenta: cadena de caracteres de 30 de longitud,
 - Saldo de la cuenta: valores altos con decimales.

3- Ingrese los siguientes registros:
 insert into cuentas(numero,documento,nombre,saldo)
  values('1234','25666777','Pedro Perez',500000.60);
 insert into cuentas(numero,documento,nombre,saldo)
  values('2234','27888999','Juan Lopez',-250000);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3344','27888999','Juan Lopez',4000.50);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3346','32111222','Susana Molina',1000);
Note que hay dos cuentas, con distinto número de cuenta, de la misma persona.

4- Seleccione todos los registros cuyo saldo sea mayor a "4000" (2 registros)

5- Muestre el número de cuenta y saldo de todas las cuentas cuyo propietario sea "Juan Lopez" (2 
registros)

6- Muestre las cuentas con saldo negativo (1 registro)

7- Muestre todas las cuentas cuyo número es igual o mayor a "3000" (2 registros):
 select * from cuentas
  where numero>=3000;
*/
 if object_id('cuentas') is not null
  drop table cuentas;

 create table cuentas(
  numero int not null,
  documento char(8),
  nombre varchar(30),
  saldo money,
  primary key (numero)
 );

 insert into cuentas(numero,documento,nombre,saldo)
  values('1234','25666777','Pedro Perez',500000.60);
 insert into cuentas(numero,documento,nombre,saldo)
  values('2234','27888999','Juan Lopez',-250000);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3344','27888999','Juan Lopez',4000.50);
 insert into cuentas(numero,documento,nombre,saldo)
  values('3346','32111222','Susana Molina',1000);

 select * from cuentas
  where saldo<4000;

 select numero,saldo from cuentas
  where nombre='Juan Lopez';

 select * from cuentas
  where saldo<0;

 select * from cuentas
  where numero>=3000;