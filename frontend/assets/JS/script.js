
const URL_API = "http://localhost:3000/api/planetas";

// Aquí guardaremos los planetas obtenidos desde MySQL
let planetas = [];

// Obtener los datos de nuestra propia API
async function cargarPlanetas() {

    try {
        const respuesta = await fetch(URL_API);

        //Comprobar si la solicitud funcionó

        if (!respuesta.ok) {
            throw new Error("Error al consultar la API");
        }

        planetas = await respuesta.json();

        console.log("Planetas obtenidos desde MySQL:", planetas);

    } catch (error) {
        console.error("Error al cargar los planetas:", error);
    }

}


// BOTONES VER DETALLES

const botones = document.querySelectorAll(".ver-detalles");

botones.forEach((boton) => {

    boton.addEventListener("click", () => {

        const nombre = boton.dataset.planeta;
        const contenido = document.getElementById("contenidoDetalle");

        // Buscar el planeta en los datos que recibimos
        const planeta = planetas.find((p) =>
            p.name.toLowerCase() === nombre.toLowerCase()
        );

        if (!planeta) {
            contenido.textContent = "No se encontró información del planeta.";
            return;
        }

        // Mostrar la información del planeta
        contenido.innerHTML = `
            <p>Nombre: ${planeta.name}</p>
            <p>Sistema: ${planeta.sistema}</p>
            <p>Temperatura: ${planeta.temperature} K</p>
            <p>Masa: ${planeta.mass} masas de Júpiter</p>
            <p>Radio: ${planeta.radius} radios de Júpiter</p>
            <p>Período orbital: ${planeta.period} días</p>
        `;

    });

});


// BUSCADOR POR TEMPERATURA

const formulario = document.getElementById("formularioTemperatura");

const input = document.getElementById("temperaturaMaxima");

const botonesFiltro = document.querySelectorAll(".ver-detalles");

formulario.addEventListener("submit", (evento) => {

    evento.preventDefault();

    const temperatura = Number(input.value);

    botonesFiltro.forEach((boton) => {

        const nombre = boton.dataset.planeta;

        const tarjeta = boton.closest(".carousel-item");

        // Buscar el planeta en nuestros datos
        const planeta = planetas.find((p) =>
            p.name.toLowerCase() === nombre.toLowerCase()
        );

        if (!planeta || !tarjeta) {
            return;
        }

        // Comparar la temperatura del planeta
        if (Number(planeta.temperature) <= temperatura) {

            tarjeta.style.display = "";

        } else {

            tarjeta.style.display = "none";

        }

    });

});


// BOTÓN MOSTRAR TODOS

const mostrarTodos = document.getElementById("mostrarTodos");

mostrarTodos.addEventListener("click", () => {

    botonesFiltro.forEach((boton) => {

        const tarjeta = boton.closest(".carousel-item");

        if (tarjeta) {
            tarjeta.style.display = "";
        }

    });

    input.value = "";

});


// Cargar los planetas cuando abrimos la página
cargarPlanetas();
