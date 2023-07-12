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
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styleCompra.css">
    <title>Codo a Codo</title>
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
	boolean personaInsertSuccess = personaDAOimpl.insert(persona);
	
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
	boolean ticketInsertSuccess = ticketDAOImpl.insert(ticket);
%>

	<header>
        <nav class="navbar navbar-expand-lg bg-dark navbar-dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="index.html">
                    <img src="assets/images/codoacodo.png"alt="Logo" width="150"  class="d-inline-block align-text-center">
                    Conf BsAs
                </a>              
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar" aria-controls="navbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbar" >
                  <ul class="navbar-nav ">
                      <li class="nav-item">
                        <a class="nav-link active" href="index.html" aria-current="page" href="#">La conferencia</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">Los oradores</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#">El lugar y la fecha</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link">Convi�rtete en orador</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link text-success">Comprar tickets</a>
                      </li>
                  </ul>
                </div>
            </div>
        </nav>
    </header>
	
	<main style="margin-top: 172px;">
	    <div class="container">
	        <% if (personaInsertSuccess && ticketInsertSuccess) { %>
	        <div id="alertInsert" class="alert alert-success text-center" role="alert">
	            <p>Los tickets han sido comprados con �xito!</p>
	        </div>
	        <% } else { %>
	        <div id="alertInsert" class="alert alert-danger text-center" role="alert">
	            <p>Hubo un error en la compra de tickets. Revise sus datos.</p>
	        </div>
	        <% } %>
	    </div>
	</main>
    
	<footer class="footer fixed-bottom text-light py-3">
        <div class="container justify-content-center">
          <div class="row">
            <div class="col-12">
              <ul class="list-inline mb-0 d-flex">
                <li class="list-inline-item"><a href="#">Preguntas frecuentes</a></li>
                <li class="list-inline-item"><a href="#">Cont�ctanos</a></li>
                <li class="list-inline-item"><a href="#">Prensa</a></li>
                <li class="list-inline-item"><a href="#">Conferencias</a></li>
                <li class="list-inline-item"><a href="#">T�rminos y condiciones</a></li>
                <li class="list-inline-item"><a href="#">Privacidad</a></li>
                <li class="list-inline-item"><a href="#">Estudiantes</a></li>
              </ul>
            </div>
          </div>
        </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>