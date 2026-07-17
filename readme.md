# 🛢️ Domando SQL Server - De Cero a Avanzado

¡Buenas! Soy Wilson Javier Insaurralde. En este repositorio comparto mi camino de aprendizaje y especialización en bases de datos relacionales utilizando **Microsoft SQL Server**. 

Este espacio no es solo teoría; es un registro vivo de **150 módulos prácticos y teóricos** donde implementé código ejecutable paso a paso, abarcando desde el diseño de tablas esenciales hasta la programación avanzada del motor.

---

## 🚀 Mapa de Contenidos (150 Temas Completados)

Para reflejar fielmente las 150 carpetas del repositorio, dividí el contenido según los bloques técnicos que fui resolviendo:[cite: 1]

### 🟩 1. Fundamentos, Tipos de Datos y Consultas Esenciales (Temas 001 - 045)
*   **Comandos del Sistema:** Inspección de objetos con `sp_tables` y `sp_columns`, y borrado con `DROP TABLE` y `TRUNCATE TABLE`[cite: 1].
*   **Manipulación de Datos (DML):** Inserciones, actualizaciones y borrados (`INSERT INTO`, `SELECT`, `WHERE`, `DELETE`, `UPDATE`)[cite: 1].
*   **Tipos de Datos Avanzados:** Manejo exhaustivo de tipos de datos básicos, texto, numéricos, fechas y horas, y el comportamiento de los valores `NULL`[cite: 1].
*   **Atributo Identity:** Control y características específicas de campos autoincrementales[cite: 1].
*   **Funciones Integradas:** Operadores aritméticos y de concatenación, alias, funciones de cadena, funciones matemáticas, y funciones de fecha y hora[cite: 1].
*   **Consultas de Selección:** Filtrado con operadores lógicos (`AND`, `OR`, `NOT`), rangos (`BETWEEN`), listas (`IN`), y búsqueda de patrones (`LIKE` / `NOT LIKE`)[cite: 1].
*   **Agrupamiento y Reportes Avanzados:** Control de registros duplicados (`DISTINCT`), cláusula `TOP`, funciones de agregación (`COUNT`, `SUM`, `MIN`, `MAX`, `AVG`) y el conteo de grandes volúmenes con `COUNT_BIG`[cite: 1].
*   **Cláusulas de Control:** Agrupamientos complejos con `GROUP BY`, filtros de grupo (`HAVING`), modificadores `WITH ROLLUP` y `WITH CUBE`, función `GROUPING`, y el uso de las cláusulas de ordenamiento y reporte `COMPUTE` y `COMPUTE BY`[cite: 1].

### 🟨 2. Integridad de Datos, Restricciones y Reglas (Temas 046 - 063)
*   **Claves Primarias:** Configuración de claves primarias simples y compuestas[cite: 1].
*   **Restricciones de Tabla (Constraints):** Implementación de restricciones de tipo `DEFAULT` y `CHECK`, deshabilitación con `WITH CHECK / NOCHECK`, restricciones `PRIMARY KEY` y `UNIQUE`[cite: 1].
*   **Administración y Diagnóstico:** Uso del procedimiento del sistema `sp_helpconstraint` e información y eliminación de restricciones[cite: 1].
*   **Reglas del Sistema:** Creación, asociación y desasociación de reglas globales (`CREATE RULE`, `sp_bindrule`, `sp_unbindrule`) y análisis con `sp_help`[cite: 1].
*   **Valores Predeterminados y Objetos:** Creación, desasociación y eliminación de valores predeterminados con `CREATE DEFAULT`[cite: 1].
*   **Optimización mediante Índices:** Análisis teórico y práctico de índices agrupados (`CLUSTERED`) y no agrupados (`NONCLUSTERED`), creación, regeneración y eliminación de índices[cite: 1].

### 🟧 3. Trabajo con Varias Tablas, Claves Foráneas y Subconsultas (Temas 064 - 100)
*   **Combinaciones (Joins):** Dominio absoluto de `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`, y combinaciones cruzadas (`CROSS JOIN`)[cite: 1].
*   **Técnicas de Combinación Avanzada:** Autocombinación (Self Join), combinaciones combinadas con funciones de agrupamiento, cruzamiento de más de dos tablas en simultáneo, y operaciones combinadas con `UPDATE` y `DELETE`[cite: 1].
*   **Claves Foráneas (Foreign Key):** Integridad referencial, restricciones `FOREIGN KEY` aplicadas en la misma tabla, acciones en cascada, deshabilitación/eliminación (`WITH CHECK / NOCHECK`) y extracción de información de FKs[cite: 1].
*   **Estructura y Uniones:** Restricciones aplicadas directamente al crear la tabla, operadores de conjunto (`UNION`), y modificaciones estructurales de campos (`ALTER TABLE` con `ADD`, `DROP` y `ALTER`)[cite: 1].
*   **Campos Calculados y Tipos de Usuario:** Implementación de campos dinámicos calculados y manejo completo de Tipos de Datos Definidos por el Usuario (creación, asociación de reglas, valores predeterminados y eliminación)[cite: 1].
*   **Subconsultas Complejas:** Subconsultas como expresión, subconsultas con operadores `IN`, predicados de comparación (`ANY`, `SOME`, `ALL`), subconsultas correlacionadas, operadores de existencia (`EXISTS` / `NOT EXISTS`), subconsultas simulando autocombinación, subconsultas en lugar de tablas, y su uso integrado en operaciones `UPDATE`, `DELETE` e `INSERT`[cite: 1].

### 🟥 4. Programación Avanzada, Procedimientos, Funciones y Triggers (Temas 101 - 150)
*   **Estructuras de Control de Flujo:** Creación de tablas a partir de otras (`SELECT INTO`), uso del delimitador de lotes `GO`, y lógica de control condicional mediante `CASE` e `IF`, junto con variables de usuario[cite: 1].
*   **Vistas (Views):** Creación, obtención de información, modificación (`ALTER VIEW`), eliminación, encriptación de vistas, uso del modificador `WITH CHECK OPTION` y manipulación de datos de tablas a través de vistas[cite: 1].
*   **Grandes Volúmenes de Datos (Blobs clásicos):** Estudio y reemplazo teórico de `TEXT`, `NTEXT` e `IMAGE` por sus equivalentes modernos `VARCHAR(MAX)`, `NVARCHAR(MAX)` y `VARBINARY(MAX)`. Trabajo con punteros de texto para leer, escribir, actualizar y aplicar funciones específicas de bloque[cite: 1].
*   **Procedimientos Almacenados (Stored Procedures):** Ciclo completo de creación, ejecución, eliminación y modificación. Configuración de parámetros de entrada y parámetros de salida, control de retornos (`RETURN`), consultas de información, encriptado de procedimientos, inserción de datos a través de ellos, anidamiento de SPs y técnicas de recompilación[cite: 1].
*   **Estructuras Temporales y Funciones:** Gestión de tablas temporales. Diseño de funciones de usuario (eliminación con `DROP`), funciones escalares (creación y llamada), funciones de tabla de varias instrucciones, funciones con valores de tabla en línea, modificación, encriptado y visualización de información de funciones[cite: 1].
*   **Disparadores (Triggers):** Automatización e integridad. Creación de disparadores de inserción (`INSERT TRIGGER`), de borrado (`DELETE TRIGGER`), de actualización (`UPDATE TRIGGER`), y disparadores asociados a varios eventos simultáneos[cite: 1]. Control del momento del disparo (`INSTEAD OF` y `AFTER`), eliminación, consulta de información, modificación, procesos de deshabilitación y habilitación, y técnicas de ocultación de lógica mediante `WITH ENCRYPTION`[cite: 1].

---

## 🛠️ Tecnologías y Herramientas utilizadas
*   **Motor de Base de Datos:** Microsoft SQL Server
*   **Lenguaje:** T-SQL (Transact-SQL)
*   **Entorno de Desarrollo:** SQL Server Management Studio (SSMS)

---
*¡Gracias por pasarte a mirar! Este repositorio demuestra mi constancia diaria para dominar el manejo de datos desde el backend.*
