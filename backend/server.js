
require("dotenv").config();

const express = require("express");
const mysql = require("mysql2/promise");
const cors = require("cors");

// Creamos nuestro servidor
const app = express();

// Permitimos que el frontend consulte nuestro backend
app.use(cors());
app.use(express.json());

// Configuramos la conexión con MySQL
const conexion = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    port: Number(process.env.DB_PORT || 3306)
});

// Creamos una ruta para consultar los planetas
app.get("/api/planetas", async (req, res) => {

    try {
        const [planetas] = await conexion.query(`
            SELECT
                p.id_planeta,
                p.name,
                p.temperature,
                p.mass,
                p.radius,
                p.period,
                s.nombre AS sistema
            FROM planetas p
            INNER JOIN sistemas s
            ON p.id_sistema = s.id_sistema
        `);

        res.json(planetas);

    } catch (error) {
        console.error("Error al consultar MySQL:", error.message);

        res.status(500).json({
            mensaje: "Error al obtener los planetas"
        });
    }

});

// Encendemos nuestro servidor
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Servidor funcionando en http://localhost:${PORT}`);
});
