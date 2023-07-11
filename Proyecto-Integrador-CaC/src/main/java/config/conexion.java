package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexion {
	private static final String CONTROLADOR = "com.mysql.cj.jdbc.Driver";
	private static final String URL = "jdbc:mysql://localhost:3306/cac";
	private static final String USUARIO = "root";
	private static final String PASS = "";
	
	static {
			try {
				Class.forName(CONTROLADOR);
			} catch (ClassNotFoundException e) {
				System.out.println("Error al establecer al cargar el controlador");
				e.printStackTrace();
			}
	}
	
	public Connection conectar() {
		
		Connection conexion = null;
		
		try {
			conexion = DriverManager.getConnection(URL, USUARIO , PASS);
			System.out.println("Se establecio la conexión");
		} catch (SQLException e) {
			System.out.println("Error al cargar la conexión");
			e.printStackTrace();
		}
		return conexion;
	}
}
