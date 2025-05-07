README
Proceso de Desarrollo y Decisiones Tomadas
1. Modelo de Datos y Estructura de Tablas
El modelo de datos fue diseñado para cumplir con los requerimientos de un sistema que gestiona usuarios, comerciantes y establecimientos en un entorno de agremiación nacional de comercio. Las decisiones clave fueron las siguientes:

Usuarios: La tabla users almacena información esencial sobre los usuarios del sistema, como su nombre, correo electrónico, contraseña y rol. Los roles se limitan a dos: Administrador y Auxiliar de Registro. Esto garantiza que solo usuarios autorizados puedan acceder a la información y realizar acciones de actualización en el sistema.

Comerciantes: La tabla merchants está diseñada para almacenar información sobre los comerciantes, incluyendo su nombre, municipio, teléfono (opcional), correo electrónico (opcional), fecha de registro y estado. Además, se incluye un campo de auditoría updated_by que referencia al usuario que realizó la última actualización, creando una relación con la tabla users.

Establecimientos: La tabla establishments almacena datos sobre los establecimientos comerciales, como nombre, ingresos (con formato decimal de dos dígitos), cantidad de empleados y la referencia al comerciante propietario. También se incorporan campos de auditoría (updated_by y updated_at) para rastrear las modificaciones realizadas.

2. Creación de Secuencias y Auditoría
Para asegurar que cada registro tenga un identificador único y autoincrementable, se implementaron secuencias para las tablas users, merchants y establishments. Las secuencias permiten generar identificadores automáticamente con un valor único cada vez que se inserta un nuevo registro, asegurando la integridad de los datos.

Los campos de auditoría fueron implementados en las tablas merchants y establishments, permitiendo que cada inserción o actualización se registre con la fecha y el usuario responsable de la modificación. Esto facilita el seguimiento de cambios y garantiza la trazabilidad de los datos.

3. Datos Semilla
Se generaron datos semilla con valores aleatorios para poblar las tablas users, merchants y establishments. Los datos fueron diseñados para cumplir con las siguientes especificaciones:

Se crearon dos usuarios: uno con el rol de "Administrador" y otro con el rol de "Auxiliar de Registro".

Se generaron cinco comerciantes, cada uno con un municipio distinto y con un teléfono y correo electrónico únicos.

Se asignaron diez establecimientos, distribuidos aleatoriamente entre los comerciantes. Algunos comerciantes tienen más de un establecimiento, reflejando una relación uno a muchos.

Este enfoque garantiza que el sistema esté listo para realizar pruebas con datos representativos y verifique el funcionamiento de las relaciones entre las entidades.

4. Validaciones y Restricciones
Se implementaron validaciones de integridad referencial utilizando claves foráneas para asegurar que los registros de los establecimientos estén siempre asociados con un comerciante válido. Además, las restricciones de CHECK en las tablas aseguran que los valores de los campos como role, status y revenue sean válidos.
