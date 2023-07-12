package com.proyectointegrador.entidad;

import java.sql.Timestamp;

public class Ticket {
	private int ticketId;
    private int dni;
    private int cantidad;
    private String categoria;
    private Timestamp fecha;
    private int monto;
    private boolean estado;
    
    public Ticket () {
    	
    }
    
	public Ticket(int ticketId, int dni, int cantidad, String categoria, Timestamp fecha, int monto, boolean estado) {
		this.ticketId = ticketId;
		this.dni = dni;
		this.cantidad = cantidad;
		this.categoria = categoria;
		this.fecha = fecha;
		this.monto = monto;
		this.estado = estado;
	}

	public int getTicketId() {
		return ticketId;
	}

	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}

	public int getDni() {
		return dni;
	}

	public void setDni(int dni) {
		this.dni = dni;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public Timestamp getFecha() {
		return fecha;
	}

	public void setFecha(Timestamp fecha) {
		this.fecha = fecha;
	}

	public int getMonto() {
		return monto;
	}

	public void setMonto(int monto) {
		this.monto = monto;
	}

	public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}
}
