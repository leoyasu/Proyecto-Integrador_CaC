<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <style>
		#footer {
		position: relative;
		} 
	</style>
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
		int dni = Integer.parseInt(request.getParameter("inputDNI2"));
		
		personaDAOImpl personaDAOimpl = new personaDAOImpl();
		ticketDAOImpl ticketDAOImpl = new ticketDAOImpl();
		
		if (ticketDAOImpl.delete(dni) && personaDAOimpl.delete(dni)) {
			%>
				<div style="margin-top: 150px;" class="container">
				  <div class="row justify-content-center">
				    <div class="col-md-6 text-center">
				      <h1>Cancelación tickets exitosa!</h1>
				      <button type="button" onclick="redirigirOrigen()" class="btn green-btn">Volver</button>
				    </div>
				  </div>
				</div> 
			<%
		} else {
			%> <div style="margin-top: 150px;" class="container">
				  <div class="row justify-content-center">
				    <div class="col-md-6 text-center">
				      <h1>Cancelación no tickets exitosa. Revise sus datos!</h1>
				      <button type="button" onclick="redirigirOrigen()" class="btn btn-danger">Volver</button>
				    </div>
				  </div>
				</div>  
			<% 
		}
		%>
	</main>
	
	<div id="footer">
		<footer class="footer fixed-bottom text-light py-3">
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
	</div>
    <script>
    function redirigirOrigen() {
        window.location.href = "modificarTickets.jsp";
    }
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>