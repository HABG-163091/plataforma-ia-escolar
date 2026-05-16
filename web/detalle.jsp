<%@page import="java.sql.*, conexion.ConexionBD"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Detalle del Recurso - Plataforma IA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-dark bg-dark px-4 shadow-sm">
        <a class="navbar-brand" href="#">Plataforma IA - Espacio de Aprendizaje</a>
        <a class="btn btn-outline-light btn-sm" href="principal.jsp">Volver al Dashboard</a>
    </nav>

    <div class="container mt-5" style="max-width: 800px;">
        <%
            // Capturamos el ID que viene en la URL (?id=X)
            String idRecurso = request.getParameter("id");
            
            if (idRecurso != null) {
                try {
                    Connection con = ConexionBD.conectar();
                    
                    // CORRECCIÓN: Seleccionamos todos los registros y filtraremos dinámicamente
                    // para evitar el error con el nombre exacto de tu columna primaria.
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM recursos_ia");
                    
                    boolean encontrado = false;
                    
                    while (rs.next()) {
                        // Usamos el índice 1 para obtener el ID real de la base de datos
                        String idBD = rs.getString(1);
                        
                        // Si coincide con el ID que el usuario seleccionó en la tarjeta
                        if (idBD.equals(idRecurso)) {
                            encontrado = true;
                            String titulo = rs.getString("titulo");
                            
                            // Generamos explicaciones dinámicas y sencillas según el ID del niño
                            String explicacionFormada = "";
                            String consejosAdicionales = "";
                            
                            if (idRecurso.equals("1") || idRecurso.endsWith("1")) {
                                explicacionFormada = "Las inteligencias artificiales públicas guardan en sus servidores todo lo que escribimos en ellas para seguir entrenando. Si les das tus datos reales, personas desconocidas podrían llegar a verlos.";
                                consejosAdicionales = "1. Nunca escribas tu dirección o teléfono.<br>2. Si la IA te pregunta cómo te llamas, puedes usar un apodo divertido.<br>3. Cuida también los datos de tus amigos y familiares.";
                            } else if (idRecurso.equals("2") || idRecurso.endsWith("2")) {
                                explicacionFormada = "La IA es genial para explicar temas difíciles. Si le pides que te explique la historia de México como si fuera un cuento de caballeros, lo hará de forma divertida para que estudies mejor.";
                                consejosAdicionales = "1. Pídele ejemplos sencillos de matemáticas.<br>2. Úsala para practicar preguntas antes de un examen.<br>3. Si no entiendes una palabra, pídele que te la explique como si tuvieras 8 años.";
                            } else if (idRecurso.equals("3") || idRecurso.endsWith("3")) {
                                explicacionFormada = "Copiar y pegar lo que hace la IA sin leerlo se considera trampa y evita que tu cerebro aprenda. El verdadero superpoder de la IA es darte ideas para que tú crees tus propios trabajos.";
                                consejosAdicionales = "1. Lee la respuesta de la IA y escríbela con tus palabras.<br>2. Úsala para inspirarte cuando no sepa cómo empezar un dibujo o cuento.<br>3. Siempre menciona en tu escuela que usaste la IA como ayuda.";
                            } else if (idRecurso.equals("4") || idRecurso.endsWith("4")) {
                                explicacionFormada = "En internet hay muchas aplicaciones falsas que prometen usar IA pero que en realidad quieren robar información, mostrarte anuncios feos o cobrarle dinero a tus padres a escondidas.";
                                consejosAdicionales = "1. No descargues nada sin el permiso de un adulto.<br>2. Si una app te pide una tarjeta de crédito, ciérrala de inmediato.<br>3. Usa solo las plataformas seguras que te recomienden tus profesores.";
                            } else {
                                explicacionFormada = "A veces la IA se confunde e inventa datos falsos con mucha seguridad (a esto se le llama alucinación). Por eso, nunca uses un dato de la IA para una tarea importante sin revisarlo primero.";
                                consejosAdicionales = "1. Revisa las fechas y nombres en tus libros de texto escolares.<br>2. Pregúntale a tu profesor si tienes dudas de un dato numérico.<br>3. Usa diccionarios o enciclopedias para confirmar la información.";
                            }
            %>
                            <div class="card shadow border-0 rounded-4 p-4 mb-4">
                                <span class="badge bg-primary text-wrap mb-3 p-2 text-start" style="max-width: fit-content;">Recurso Educativo #<%= idRecurso %></span>
                                <h2 class="fw-bold text-dark mb-4"><%= titulo %></h2>
                                
                                <h5 class="fw-bold text-secondary">¿Por qué es importante?</h5>
                                <p class="fs-5 text-muted mb-4"><%= explicacionFormada %></p>
                                
                                <div class="bg-white border rounded-3 p-3">
                                    <h6 class="fw-bold text-success mb-3">💡 Consejos prácticos para el alumno:</h6>
                                    <p class="text-secondary mb-0"><%= consejosAdicionales %></p>
                                </div>
                            </div>
            <%
                            break; // Ya lo encontramos, salimos del ciclo
                        }
                    }
                    
                    if (!encontrado) {
                        out.print("<div class='alert alert-warning text-center'>El recurso solicitado no existe o fue eliminado.</div>");
                    }
                    
                    con.close();
                } catch (Exception e) {
                    out.print("<div class='alert alert-danger text-center'>Error: " + e.getMessage() + "</div>");
                }
            } else {
                out.print("<div class='alert alert-danger text-center'>No se especificó ningún ID de recurso.</div>");
            }
        %>
        <div class="text-center mt-3">
            <a href="principal.jsp" class="btn btn-secondary px-4 shadow-sm">← Regresar al Dashboard</a>
        </div>
    </div>
</body>
</html>