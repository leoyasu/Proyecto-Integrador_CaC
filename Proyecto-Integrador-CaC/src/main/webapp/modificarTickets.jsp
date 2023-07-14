<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.proyectointegrador.dao.personaDAOImpl" %>
<%@ page import="com.proyectointegrador.entidad.Persona" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="css/styleCompra.css">
    <style>
		.container-form-modificar .btn {
		  margin-top: 20px;
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
                        <a class="nav-link text-success" href="compra.html">Comprar tickets</a>
                      </li>
                  </ul>
                </div>
            </div>
        </nav>
    </header>
	
	<main>
		<div class="container">
		  <div class="row justify-content-center">
		    <div class="col-md-6">
		      <div class="container-form-modificar">
		        <h1 class="mt-5">Consultar Información de Tickets</h1>
		        <div id="primerFormCont">
		          <form method="post" id="primerForm" class="mt-4" action="modificarTicketsEnviado.jsp">
		            <div class="form-group">
		              <label for="dni">Ingresar DNI sin puntos:</label>
		              <input type="number" class="form-control" id="dniCompra" name="dniCompra" required>
		            </div>
		            <button type="submit" class="btn green-btn">Consultar</button>
		          </form>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
	</main>
    
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</body>
</html>