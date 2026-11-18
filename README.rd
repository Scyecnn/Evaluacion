# Sistemas Planetarios

Proyecto web que permite explorar los planetas del **Sistema Solar** y del sistema **Kepler-90**, consultar sus características y filtrarlos según su temperatura.

## Funcionalidades

- Visualización de planetas de ambos sistemas mediante carruseles de Bootstrap.
- Botón **Ver detalles** para consultar información de cada planeta.
- Filtro por temperatura máxima (en kelvin).
- Botón **Mostrar todos** para restablecer la visualización.
- Consulta de datos almacenados en MySQL a través de una API.

## Tecnologías utilizadas

- Frontend: HTML, CSS, JavaScript y Bootstrap.
- Backend: Node.js y Express.
- Base de datos: MySQL.

## Organización del proyecto

Sistemas-Planetarios/
├── backend/
│   ├── server.js
│   ├── package.json
│   ├── .env                
│   └── datos.sql         
├── frontend/
│   ├── index.html
│   └── assets/
│       ├── CSS/
│       │   └── style.css
│       ├── JS/
│       │   └── script.js
│       └── imgs/
└── README.rd
```

## Base de datos

La base de datos utiliza dos tablas relacionadas:

- **`sistemas`**: contiene el identificador y el nombre de cada sistema planetario.
- **`planetas`**: contiene el nombre, temperatura, masa, radio, período orbital y el identificador del sistema al que pertenece cada planeta.

La relación es **uno a muchos (1:N)**: un sistema puede contener varios planetas. Ambas tablas se relacionan mediante "id_sistema".

El backend utiliza una consulta SQL con `INNER JOIN` para obtener los datos de cada planeta junto con el nombre de su sistema.

## Cómo ejecutar el proyecto localmente

### 1. Requisitos

- Node.js y npm instalados.
- MySQL instalado y en ejecución.
- Un editor de código, como Visual Studio Code.

### 2. Preparar la base de datos

Crear o importar la base de datos del proyecto en MySQL desde datos.sql y ejecutarlo.

### 3. Configurar las variables de entorno

Crear un archivo `.env` dentro de `backend` con los datos de conexión de tu instalación local:

```env
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=TU_CONTRASENA
DB_NAME=proyecto_planetario
DB_PORT=3306
PORT=3000
```


### 4. Instalar dependencias e iniciar el backend

Abrir una terminal en la carpeta `backend` y ejecutar:

```bash
npm install
node server.js
```

Si el servidor inicia correctamente, debería quedar disponible en:

http://localhost:3000


Para comprobar la ruta de consulta de planetas, abrir:

```text
http://localhost:3000/api/planetas
```

Esta ruta devuelve los datos en formato JSON cuando el backend puede consultar MySQL.

### 5. Abrir el frontend

Abrir `frontend/index.html` con un servidor local, por ejemplo mediante **Live Server** en Visual Studio Code. Mantener el backend y MySQL en ejecución para que los botones de detalles obtengan información desde la API.

## ¿Cómo funciona la aplicación?

1. El usuario ingresa a la página y explora las tarjetas de los planetas.
2. JavaScript realiza una solicitud HTTP `GET` a `/api/planetas`.
3. Express recibe la solicitud y consulta MySQL.
4. La consulta SQL relaciona las tablas `planetas` y `sistemas`.
5. El servidor devuelve los resultados en formato **JSON**.
6. El frontend utiliza esos datos para mostrar detalles y filtrar los planetas por temperatura.

## Uso de HTML semántico

El sitio utiliza etiquetas HTML semánticas como header, main, section, article y footer para organizar el contenido de manera clara y significativa.

Las etiquetas section permiten diferenciar los sistemas planetarios, mientras que article representa la información individual de cada planeta.

Además, se utilizan contenedores div cuando son necesarios para mantener la estructura y el funcionamiento de los carruseles de Bootstrap.

