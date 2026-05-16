<%@page import="java.sql.*, conexion.ConexionBD"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Recursos de IA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-dark bg-dark px-4 shadow-sm">
        <a class="navbar-brand" href="#">Plataforma IA - Espacio de Aprendizaje Escolar</a>
        <a class="btn btn-danger btn-sm" href="index.jsp">Cerrar Sesión</a>
    </nav>
    
    <div class="container mt-5">
        <div class="mb-4">
            <h2>Plataforma de Uso Responsable de IA Generativa</h2>
            <p class="text-muted">Aprende a usar la Inteligencia Artificial de forma divertida, segura y correcta en tu escuela.</p>
        </div>
        <hr>
        
        <div class="row mt-4">
            <%
                try {
                    // Nos conectamos a la base de datos
                    Connection con = ConexionBD.conectar();
                    Statement st = con.createStatement();
                    // Consultamos los lineamientos escolares ingresados en MySQL
                    ResultSet rs = st.executeQuery("SELECT * FROM recursos_ia");
                    
                    // Si la tabla está vacía, muestra un aviso amigable
                    if (!rs.isBeforeFirst()) {
                        out.print("<div class='col-12 text-center'><p class='alert alert-info'>¡Hola! Aún no hay consejos publicados para este ciclo escolar.</p></div>");
                    }
                    
                    // Recorremos cada registro real de la base de datos
                    while(rs.next()) {
                        String id = rs.getString(1); // Recupera el ID automáticamente
                        String titulo = rs.getString("titulo");
                        
                        // Configuración visual de colores según el tipo de lección escolar
                        String tipoBadge = "bg-primary";
                        String contornoCard = "border-primary";
                        
                        if (titulo.contains("Privacidad")) {
                            tipoBadge = "bg-danger";
                            contornoCard = "border-danger";
                        } else if (titulo.contains("tarea") || titulo.contains("Práctica")) {
                            tipoBadge = "bg-success";
                            contornoCard = "border-success";
                        } else if (titulo.contains("supertutor") || titulo.contains("dinero") || titulo.contains("Calidad")) {
                            tipoBadge = "bg-warning text-dark";
                            contornoCard = "border-warning";
                        }
            %>
            <div class="col-md-6 col-lg-4 mb-4">
                <div class="card h-100 shadow-sm <%= contornoCard %>">
                    <div class="card-body d-flex flex-column justify-content-between">
                        <div>
                            <span class="badge <%= tipoBadge %> mb-2">Lección #<%= id %></span>
                            <h5 class="card-title fw-bold text-dark"><%= titulo %></h5>
                            <p class="card-text text-secondary mt-2 small">
                                Haz clic en el botón de abajo para descubrir ejemplos prácticos y aprender a usar este superpoder digital.
                            </p>
                        </div>
                        
                        <div class="mt-3 text-end">
                            <a href="detalle.jsp?id=<%= id %>" class="btn btn-outline-primary btn-sm px-3">
                                Leer detalle →
                            </a>
                        </div>
                        
                    </div>
                </div>
            </div>
            <%
                    }
                    con.close();
                } catch(Exception e) {
                    out.print("<div class='col-12'><p class='text-danger'>Error al cargar recursos: " + e.getMessage() + "</p></div>");
                }
            %>
        </div>
    </div>
</body>
</html>