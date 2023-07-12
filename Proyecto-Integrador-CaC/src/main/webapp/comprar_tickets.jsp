<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.proyectointegrador.dao.personaDAOImpl" %>
<%@ page import="com.proyectointegrador.dao.ticketDAOImpl" %>
<%@ page import="com.proyectointegrador.entidad.Persona" %>
<%@ page import="com.proyectointegrador.entidad.Ticket" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	String nombre = request.getParameter("nombreCompra");
	String apellido = request.getParameter("apellidoCompra");
	String correo = request.getParameter("correoCompra");
	String dni = request.getParameter("dniCompra");
	String cantidad = request.getParameter("inputCantidadCompra");
	String categoria = request.getParameter("inputCategoriaCompra");
	String monto = request.getParameter("totalApagarCompras");
	
	Persona persona = new Persona();
	persona.setDni(Integer.parseInt(dni));
	persona.setNombre(nombre);
	persona.setApellido(apellido);
	persona.setCorreo(correo);
	
	personaDAOImpl personaDAOimpl = new personaDAOImpl();
	personaDAOimpl.insert(persona);
	
	Ticket ticket = new Ticket();
	ticket.setDni(Integer.parseInt(dni));
	ticket.setCantidad(Integer.parseInt(cantidad));
    ticket.setCategoria(categoria);
    Date currentDate = new Date();
    Timestamp timestamp = new Timestamp(currentDate.getTime());
    ticket.setFecha(timestamp);
	ticket.setMonto(Integer.parseInt(monto));
	ticket.setEstado(true);
	
	ticketDAOImpl ticketDAOImpl = new ticketDAOImpl();
	ticketDAOImpl.insert(ticket);
%>
	
</body>
</html>