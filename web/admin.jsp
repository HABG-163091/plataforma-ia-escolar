<%@page import="java.sql.*, conexion.ConexionBD"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // REQUISITO DE RÚBRICA: Uso de ARREGLOS en Java
    String[] coloresArreglo = {"bg-primary", "bg-success", "bg-danger", "bg-info text-dark", "bg-dark"};
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Administración - Plataforma IA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-dark bg-dark px-4 shadow-sm">
        <a class="navbar-brand" href="#">Plataforma IA - Panel de Administración</a>
        <a class="btn btn-outline-light btn-sm" href="index.jsp">Cerrar Sesión</a>
    </nav>

    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2>Gestión de Contenido</h2>
                <p class="text-muted">Mantenimiento de normativas y recursos de IA</p>
            </div>
            <button class="btn btn-success fw-bold shadow-sm">
                + Registrar Nuevo Lineamiento
            </button>
        </div>
        
        <div class="card shadow">
            <div class="card-body p-0">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-dark">
                        <tr>
                            <th class="ps-4">ID</th>
                            <th>Título del Recurso</th>
                            <th>Etiqueta</th>
                            <th class="text-end pe-4">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            try {
                                Connection con = ConexionBD.conectar();
                                Statement st = con.createStatement();
                                ResultSet rs = st.executeQuery("SELECT * FROM recursos_ia");
                                
                                int contador = 0; 
                                
                                while(rs.next()) {
                                    // CORRECCIÓN: Usamos el índice 1 para jalar la llave primaria automáticamente
                                    String id = rs.getString(1);
                                    String titulo = rs.getString("titulo");
                                    
                                    String colorActual = coloresArreglo[contador % coloresArreglo.length];
                                    contador++;
                        %>
                        <tr>
                            <td class="ps-4 fw-bold"><%= id %></td>
                            <td><%= titulo %></td>
                            <td><span class="badge <%= colorActual %>">Normativa IA</span></td>
                            <td class="text-end pe-4">
                                <button class="btn btn-primary btn-sm me-1">Editar</button>
                                <button class="btn btn-danger btn-sm">Eliminar</button>
                            </td>
                        </tr>
                        <%
                                }
                                con.close();
                            } catch(Exception e) {
                                out.print("<tr><td colspan='4' class='text-center text-danger'>Error: " + e.getMessage() + "</td></tr>");
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>