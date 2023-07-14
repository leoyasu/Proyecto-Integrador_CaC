package com.proyectointegrador.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

import com.proyectointegrador.entidad.Persona;
import com.proyectointegrador.config.Conexion;

public class personaDAOImpl implements personaDAO {
	
	private static final String DELETE = "DELETE FROM personas WHERE dni=?";
	private static final String FIND_ALL = "SELECT * FROM personas ORDER BY dni";
	private static final String FIND_BY_DNI = "SELECT * FROM personas WHERE dni=?";
	private static final String INSERT = "INSERT INTO personas(dni, nombre, apellido, correo) VALUES(?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE personas SET nombre=?, apellido=?, correo=? WHERE dni=?";
	
	public personaDAOImpl () {
		
	}
	
	@Override
	public boolean insert(Persona persona) {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = getConexion();
			stmt = conn.prepareStatement(INSERT);
			stmt.setInt(1, persona.getDni());
			stmt.setString(2, persona.getNombre());
			stmt.setString(3, persona.getApellido());
			stmt.setString(4, persona.getCorreo());
			
			int result = stmt.executeUpdate();
			
			if (result==0) {
				return false;
			} else {
				return true;
			}
		} catch (SQLException e) {
			// e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			close(stmt);
			close(conn);
		}
	}

	@Override
	public List<Persona> getAllPersonas() {
		Connection conn = null;
		PreparedStatement stmt = null;
		List<Persona> listaPersonas = new ArrayList<Persona>();
		
		try {
			conn = getConexion();
			stmt = conn.prepareStatement(FIND_ALL);
			
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				Persona persona = new Persona();
				persona.setDni(rs.getInt("dni"));
				persona.setNombre(rs.getString("nombre"));
				persona.setApellido(rs.getString("apellido"));
				persona.setCorreo(rs.getString("correo"));
				
				listaPersonas.add(persona);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(stmt);
			close(conn);
		}
		
		return listaPersonas;
	}

	@Override
	public Persona getPersonaByDni(int dni) {
		Connection conn = null;
		PreparedStatement stmt = null;
		Persona persona = null;
		
		try {
			conn = getConexion();
			stmt = conn.prepareStatement(FIND_BY_DNI);
			stmt.setInt(1, dni);
			
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
				persona = new Persona();
				persona.setDni(rs.getInt("dni"));
				persona.setNombre(rs.getString("nombre"));
				persona.setApellido(rs.getString("apellido"));
				persona.setCorreo(rs.getString("correo"));
			} 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(stmt);
			close(conn);
		}
		return persona;
	}

	@Override
	public boolean update(Persona persona) {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = getConexion();
			stmt = conn.prepareStatement(UPDATE);
			stmt.setInt(4, persona.getDni());
			stmt.setString(1, persona.getNombre());
			stmt.setString(2, persona.getApellido());
			stmt.setString(3, persona.getCorreo());
			
			 System.out.println(stmt.toString());
			
			int result = stmt.executeUpdate();
			
			if (result==0) {
				return false;
			} else {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			close(stmt);
			close(conn);
		}
	}

	@Override
	public boolean delete(int dni) {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = getConexion();
			stmt = conn.prepareStatement(DELETE);
			stmt.setInt(1, dni);
			
			int result = stmt.executeUpdate();
			
			if (result==0) {
				return false;
			} else {
				return true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(stmt);
			close(conn);
		}
		return false;
	}
	
	private Connection getConexion() throws SQLException{
		Connection conn;
		conn = Conexion.getInstancia().getConexion();
		return conn;
	}
	
	private static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
	}

	private static void close(PreparedStatement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
		}
	}
}
