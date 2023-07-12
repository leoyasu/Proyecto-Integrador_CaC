<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.proyectointegrador.dao.personaDAO" %>
<%@ page import="com.proyectointegrador.dao.ticketDAO" %>
<%@ page import="com.proyectointegrador.entidad.Persona" %>
<%@ page import="com.proyectointegrador.entidad.Ticket" %> 
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
%>
	
</body>
</html>