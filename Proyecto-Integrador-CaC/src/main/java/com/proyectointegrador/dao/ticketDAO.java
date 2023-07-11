package com.proyectointegrador.dao;

import java.util.List;

import com.proyectointegrador.entidad.Ticket;

public interface ticketDAO {
	
	boolean insert(Ticket ticket);
	List<Ticket> getAllTickets();
	Ticket getTicketByDNI(int dni);
    boolean update(Ticket ticket);
    boolean delete(int id);
}
