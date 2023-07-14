var nombre = document.getElementById("inputNombre");
var apellido = document.getElementById("inputApellido");
var correo = document.getElementById("inputCorreo");
var dni = document.getElementById("inputDNI");
var inputCantidad = document.getElementById('inputCantidad');
var inputCategoria = document.getElementById('inputCategoria');
var totalApagar = document.getElementById('totalApagar');
var total = 0;

/* Modal */
var nombreCompra = document.getElementById("nombreCompra");
var apellidoCompra = document.getElementById("apellidoCompra");
var correoCompra = document.getElementById("correoCompra");
var dniCompra = document.getElementById("dniCompra");
var inputCantidadCompra = document.getElementById('inputCantidadCompra');
var inputCategoriaCompra = document.getElementById('inputCategoriaCompra');
var totalApagarCompras = document.getElementById('totalApagarCompras');
/* Modal end*/

const btnCompra = document.getElementById('compra-btn');
if (btnCompra !== null){
	btnCompra.addEventListener("click",validarFormulario);
}


const btnReset = document.getElementById('reset-btn');
if (btnReset !== null){
btnReset.addEventListener("click",resetearFormulario);
}

const modbtn = document.getElementById('modbtn');
modbtn.addEventListener("click",validarFormularioMod);

function validarFormulario(){

  if (contieneNumeros(nombre.value) || !nombre.value) {
    alert("Ingrese un nombre válido");
    nombre.focus();
    return false;
  }
  
  if (contieneNumeros(apellido.value) || !apellido.value) {
    alert("Ingrese un apellido válido");
    apellido.focus();
    return false;
  }
   
  if (!esCorreoValido(correo.value)) {
    alert("Ingrese una dirección de correo válida");
    correo.focus();
    return false;
  }
  
  if (!esDNIvalido(dni.value)){
	  alert("Ingrese un DNI válido");
	  dni.focus();
	  return false;
  }

  if (!esCantidadValida(inputCantidad.value)) {
    alert("Ingrese una cantidad de tickets válida");
    inputCantidad.focus();
    return false;
  }

  actualizarMontoTotal();
  mostrarModal();
  return true;
}

function contieneNumeros(input) {
  var numberRegex = /\d/;
  return numberRegex.test(input);
}

function esCorreoValido(email) {
  var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}

function esDNIvalido(dni) {
  var dniRegex = /^\d{1,8}(?:\.\d+)?$/;
  return dniRegex.test(dni);
}

function esCantidadValida(cantidad) {
  var cantidadRegex = /^[1-9]\d*$/;
  return cantidadRegex.test(cantidad);
}

function actualizarMontoTotal() {
  var cantidad = inputCantidad.value;
  var categoria = inputCategoria.value;
  var precioUnitario = 200;
  var descuento = 0;

  if (categoria === 'estudiante') {
    descuento = 0.2; 
  } else if (categoria === 'trainee') {
    descuento = 0.5; 
  } else {
    descuento = 0.85;
  }

  total = precioUnitario * descuento * cantidad;
  totalApagar.textContent = 'Total a Pagar $: ' + total;
}

function resetearFormulario() {
  document.getElementById("form").reset();
  totalApagar.textContent = 'Total a Pagar $: '; 
}

function mostrarModal(){
  document.getElementById('resumenModal').classList.add('show');
  document.getElementById('resumenModal').style.display = 'block';
  document.body.classList.add('modal-open');

  rellenarCamposModal();
}

function rellenarCamposModal(){
  nombreCompra.value = nombre.value;
  apellidoCompra.value = apellido.value;
  correoCompra.value = correo.value;
  dniCompra.value = dni.value;
  inputCantidadCompra.value = inputCantidad.value;
  inputCategoriaCompra.value = inputCategoria.value;
  totalApagarCompras.value = total;
}

/* cancelar Modal */
if (document.getElementById('cancelarButton') !== null) {
	document.getElementById('cancelarButton').addEventListener('click', function() {
 	document.getElementById('resumenModal').classList.remove('show');
  	document.getElementById('resumenModal').style.display = 'none';
  	document.body.classList.remove('modal-open');
});
}


function validarFormularioMod(){

  if (contieneNumeros(nombre.value) || !nombre.value) {
    alert("Ingrese un nombre válido");
    nombre.focus();
    return false;
  }
  
  if (contieneNumeros(apellido.value) || !apellido.value) {
    alert("Ingrese un apellido válido");
    apellido.focus();
    return false;
  }
   
  if (!esCorreoValido(correo.value)) {
    alert("Ingrese una dirección de correo válida");
    correo.focus();
    return false;
  }

	return true;
}