var form = document.getElementById("myForm");
var nombre = document.getElementById("inputNombre");
var apellido = document.getElementById("inputApellido");
var correo = document.getElementById("inputCorreo");
var inputCantidad = document.getElementById('inputCantidad');
var inputCategoria = document.getElementById('inputCategoria');
var totalApagar = document.getElementById('totalApagar');
var total = 0;

/* Modal */
var nombreCompra = document.getElementById("nombreCompra");
var apellidoCompra = document.getElementById("apellidoCompra");
var correoCompra = document.getElementById("correoCompra");
var inputCantidadCompra = document.getElementById('inputCantidadCompra');
var inputCategoriaCompra = document.getElementById('inputCategoriaCompra');
var totalApagarCompras = document.getElementById('totalApagarCompras');
/* Modal end*/

const btnCompra = document.getElementById('compra-btn');
btnCompra.addEventListener("click",validarFormulario);

const btnReset = document.getElementById('reset-btn');
btnReset.addEventListener("click",resetearFormulario);

function validarFormulario(){

  if (contieneNumeros(nombre.value)) {
    alert("Nombre no debe contener números");
    nombre.focus();
    return false;
  } else if (contieneNumeros(apellido.value)) {
    alert("Apellido no debe contener números");
    apellido.focus();
    return false;
  }

  if (!esCorreoValido(correo.value)) {
    alert("Ingrese una dirección de correo válida");
    correo.focus();
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

function esCorreoValido(email) {
  var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(email);
}

function contieneNumeros(input) {
  var numberRegex = /\d/;
  return numberRegex.test(input);
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
  nombreCompra.textContent = nombre.value;
  apellidoCompra.textContent = apellido.value;
  correoCompra.textContent = correo.value;
  inputCantidadCompra.textContent = inputCantidad.value;
  inputCategoriaCompra.textContent = inputCategoria.value;
  totalApagarCompras.textContent = '$'+total;
}

/* cancelar Modal */
document.getElementById('cancelarButton').addEventListener('click', function() {
  document.getElementById('resumenModal').classList.remove('show');
  document.getElementById('resumenModal').style.display = 'none';
  document.body.classList.remove('modal-open');
});