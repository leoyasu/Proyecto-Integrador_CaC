<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.proyectointegrador.dao.personaDAOImpl" %>
<%@ page import="com.proyectointegrador.entidad.Persona" %>
<%@ page import="com.proyectointegrador.entidad.Ticket" %>
<%@ page import="com.proyectointegrador.dao.ticketDAOImpl" %>
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
                        <a class="nav-link">Conviértete en orador</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link text-success">Comprar tickets</a>
                      </li>
                  </ul>
                </div>
            </div>
        </nav>
    </header>
	
	<main>
			
		<%
			String dniCompra = request.getParameter("dniCompra");
			int dni = Integer.parseInt(dniCompra);
			personaDAOImpl personaDAOimpl = new personaDAOImpl();
			Persona persona = personaDAOimpl.getPersonaByDni(dni);
			
			if (persona==null) {
				%>
				<h1>DNI no encontrado!</h1> 
  				<button type="button" onclick="redirigirOrigen()" class="btn btn-danger">Volver</button>
				<%
			} else {
				
				ticketDAOImpl ticketDAOImpl = new ticketDAOImpl();
				Ticket ticket = ticketDAOImpl.getTicketByDNI(dni);
				
				%>
				<h1>Datos del Ticket:</h1>
				<div id="segundoForm">	        
	           	<form method="post" action="ticketModificado.jsp" class="mt-4">
		           <div class="row justify-content-center">
		             <div class="col-sm-4 mb-3">
		              	<label for="inputNombre">Nombre:</label>
		               <input type="text" class="form-control" name ="inputNombre" class="form-control" id="inputNombre" value="<%= persona.getNombre() %>" />
		             </div>
		             <div class="col-sm-4 mb-3">
		             <label for="inputApellido">Apellido:</label>
		               <input type="text" class="form-control" name ="inputApellido"  class="form-control" id="inputApellido" value="<%= persona.getApellido() %>"/>
		             </div>
		           </div>
		           <div class="row justify-content-center">
		             <div class="col-sm-4 mb-3">
		             	<label for="inputCorreo">Correo:</label>
		               <input type="email" id="inputCorreo" class="form-control" name ="inputCorreo"  value="<%= persona.getCorreo() %>">
		             </div>
		             <div class="col-sm-4 mb-3">
		             <label for="inputDNI">DNI no modificable:</label>
		               <input type="number" id="inputDNI" name="inputDNI" class="form-control" readonly value="<%= persona.getDni() %>"/>
		             </div>
		             <div class="row justify-content-center">
			              <div class="col-sm-4 mb-3">
			                <label for="inputCantidad">Cantidad no modificable:</label>
			                <input type="number" id="inputCantidad" class="form-control" readonly value="<%= ticket.getCantidad() %>">
			              </div>
			              <div class="col-sm-4 mb-3">
			                <label for="inputCategoria">Categoria no modificable:</label>
			                <input type="text" id="inputCategoria" class="form-control" readonly value="<%= ticket.getCategoria() %>"/>
			              </div>
			          </div>
		            <div class="row justify-content-center">
			            <div class="col-sm-4 mb-3">
			                <label for="total">Fecha:</label>
			                <input type="text" style="text-align:center;" id="fecha" class="form-control" readonly value="<%= ticket.getFecha() %>"/>
			              </div>
		              <div class="col-sm-4 mb-3">
		                <label for="total">Monto total:</label>
		                <input type="text" style="text-align:center;" id="totalApagarMonto" class="form-control" readonly value="<%= ticket.getMonto() %>"/>
		              </div>
		             </div>
		            </div>
		           <div class="row justify-content-center">
			           <div class="col-sm-3">
			          	 <button type="button" onclick="redirigirOrigen()" class="btn btn-block green-btn w-100">Volver</button>  
			           </div>
			             <div class="col-sm-3">
			               <button type="submit" id="modbtn" class="btn btn-block green-btn w-100">Modificar</button>
			             </div>
		           </div>
		        </form>
		        <div style="margin: 20px;" align="center" id="bajaTicket">
		        	<form id="formBaja" action="bajaTickets.jsp" method="post">
						<div class="col-sm-3">
						<input type="hidden" id="inputDNI2" name="inputDNI2" class="form-control" readonly value="<%= persona.getDni() %>"/>
							<button type="submit" id="bajabtn" class="btn btn-secondary">Botón de arrepentimiento</button>
				        </div>  
					</form>
		        </div>
	        </div> <% 
			}	
		%>
	</main>
	
	<footer class="footer text-light py-3">
        <div class="container justify-content-center">
          <div class="row">
            <div class="col-12">
              <ul class="list-inline mb-0 d-flex">
                <li class="list-inline-item"><a href="#">Preguntas frecuentes</a></li>
                <li class="list-inline-item"><a href="#">Contáctanos</a></li>
                <li class="list-inline-item"><a href="#">Prensa</a></li>
                <li class="list-inline-item"><a href="#">Conferencias</a></li>
                <li class="list-inline-item"><a href="#">Términos y condiciones</a></li>
                <li class="list-inline-item"><a href="#">Privacidad</a></li>
                <li class="list-inline-item"><a href="#">Estudiantes</a></li>
              </ul>
            </div>
          </div>
        </div>
    </footer>
    <script src="./js/tickets.js"></script>
    <script>
    function redirigirOrigen() {
        window.location.href = "modificarTickets.jsp";
    }
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>