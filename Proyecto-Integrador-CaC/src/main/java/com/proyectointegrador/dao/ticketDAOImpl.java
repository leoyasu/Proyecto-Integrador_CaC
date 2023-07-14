package com.proyectointegrador.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.proyectointegrador.config.Conexion;
import com.proyectointegrador.entidad.Ticket;

public class ticketDAOImpl implements ticketDAO{

	private static final String DELETE = "DELETE FROM tickets WHERE dni=?";
	private static final String FIND_ALL = "SELECT * FROM tickets ORDER BY ticket_id";
	private static final String FIND_BY_DNI = "SELECT * FROM tickets WHERE dni=?";
	private static final String INSERT = "INSERT INTO tickets(dni, cantidad, categoria, fecha,"
			+ "monto,estado) VALUES(?, ?, ?, ?, ? ,?)";
	private static final String UPDATE = "UPDATE tickets SET dni=?, cantidad=?, categoria=?, "
			+ "fecha=?, monto=?, estado=? WHERE dni=?";
	
	public ticketDAOImpl () {
		
	}
	
	@Override
	public boolean insert(Ticket ticket) {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = getConexion();
			stmt = conn.prepareStatement(INSERT);
			stmt.setInt(1, ticket.getDni());
			stmt.setInt(2, ticket.getCantidad());
			stmt.setString(3, ticket.getCategoria());
			stmt.setTimestamp(4, ticket.getFecha());
			stmt.setInt(5, ticket.getMonto());
			stmt.setBoolean(6, ticket.isEstado());
			
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
	public List<Ticket> getAllTickets() {
		Connection conn = null;
		PreparedStatement stmt = null;
		List<Ticket> listaPersonas = new ArrayList<Ticket>();
		
		try {
			conn = getConexion();
			stmt = conn.prepareStatement(FIND_ALL);
			
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				Ticket ticket = new Ticket();
				ticket.setTicketId(rs.getInt("ticket_id "));
				ticket.setDni(rs.getInt("dni"));
				ticket.setCantidad(rs.getInt("cantidad"));
                ticket.setCategoria(rs.getString("categoria"));
				ticket.setFecha(rs.getTimestamp("fecha"));
				ticket.setMonto(rs.getInt("monto"));
				ticket.setEstado(rs.getBoolean("estado"));
				
				listaPersonas.add(ticket);
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
	public Ticket getTicketByDNI(int dni) {
		Connection conn = null;
		PreparedStatement stmt = null;
		Ticket ticket = null;
		
		try {
			conn = getConexion();
			stmt = conn.prepareStatement(FIND_BY_DNI);
			stmt.setInt(1, dni);
			
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
				ticket = new Ticket();
				ticket.setDni(rs.getInt("dni"));
				ticket.setCantidad(rs.getInt("cantidad"));
				ticket.setCategoria(rs.getString("categoria"));
				ticket.setFecha(rs.getTimestamp("fecha"));
				ticket.setMonto(rs.getInt("monto"));
				ticket.setEstado(rs.getBoolean("estado"));
			} 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(stmt);
			close(conn);
		}
		return ticket;
	}

	@Override
	public boolean update(Ticket ticket) {
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = getConexion();
			stmt = conn.prepareStatement(UPDATE);
			stmt.setInt(1, ticket.getDni());
			stmt.setInt(2, ticket.getCantidad());
			stmt.setString(3, ticket.getCategoria());
			stmt.setTimestamp(4, ticket.getFecha());
			stmt.setInt(5, ticket.getMonto());
			stmt.setBoolean(6, ticket.isEstado());
			
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
