<%@page import="java.sql.*, conexion.ConexionBD"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Lógica de validación dentro del mismo archivo
    String email = request.getParameter("txtEmail");
    String pass = request.getParameter("txtPass");
    
    if (email != null && pass != null) {
        try {
            Connection con = ConexionBD.conectar();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM usuarios WHERE correo=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                response.sendRedirect("principal.jsp");
            } else {
                out.print("<script>alert('Datos incorrectos');</script>");
            }
            con.close();
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - Plataforma IA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center vh-100">
    <div class="container text-center mt-5 bg-white p-4 rounded shadow" style="max-width: 400px;">
        <h3 class="mb-3">Acceso al Sistema</h3>
        <form action="index.jsp" method="POST"> <%-- SE LLAMA A SÍ MISMO --%>
            <input type="email" name="txtEmail" class="form-control mb-3" placeholder="Email" required>
            <input type="password" name="txtPass" class="form-control mb-3" placeholder="Clave" required>
            <button type="submit" class="btn btn-primary w-100">Ingresar</button>
        </form>
    </div>
</body>
</html>