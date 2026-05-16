package conexion;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionBD {
    public static Connection conectar() {
        Connection con = null;
        try {
            // Driver para MySQL
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Cambia 'plataforma_ia' si tu base de datos tiene otro nombre
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/plataforma_ia", "root", "");
            System.out.println("Conexión exitosa");
        } catch (Exception e) {
            System.out.println("Error de conexión: " + e.getMessage());
        }
        return con;
    }
}