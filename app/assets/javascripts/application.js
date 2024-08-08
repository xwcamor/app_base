// Requiere jQuery y otros scripts
//= require jquery
//= require rails-ujs
//= require cocoon

// Configuración inicial de eventos y componentes
document.addEventListener("DOMContentLoaded", function() {
  initializeComponents();
});

function initializeComponents() {
  configureParsley();
  initializeModalComponents();
  handleFlashMessages();

  //$('#main_modal').on('hidden.bs.modal', handleModalHidden);
  //$('#main_modal').on('shown.bs.modal', handleModalShown);
  //$('#main_modal').on('hide.bs.modal', handleModalHide);

  $(document).on('click', '.btn-close', handleCloseClick);
  $(document).on('click', '.btn-close-form', handleCloseClick);
}

// Configura Parsley para usar el idioma del usuario
function configureParsley() {
  window.Parsley.setLocale(userLanguage);
}

// Inicializa componentes del modal
function initializeModalComponents() {
  $('#modal select').select2({
    dropdownParent: $('#modal')
  });

  var $form = $('#main_form');
  if ($form.length > 0) {
    $form.parsley().on('field:validated', function(field) {
      if (field.isValid()) {
        field.$element.removeClass('parsley-error').addClass('parsley-success');
      } else {
        field.$element.removeClass('parsley-success').addClass('parsley-error');
      }
    });
  }
}

// Eventos adjuntos a nuevos campos añadidos por Cocoon
$(document).on('cocoon:after-insert', function(e, insertedItem) {
  attachEventsToField(insertedItem);
  updateUnitPriceAndTotalPrice(insertedItem);
  updateTotal();
  $(insertedItem).find('select').select2({
    dropdownParent: $('#modal')
  });
});

// Maneja los mensajes flash usando SweetAlert
function handleFlashMessages() {
  const flashAlert = document.getElementById('flash-alert');
  if (flashAlert) {
    Swal.fire({
      icon: flashAlert.dataset.type,
      title: flashAlert.dataset.message
    });
  }
}

// Maneja el evento cuando el modal es ocultado
function handleModalHidden() {
  $('#modal').html(''); // Limpia el contenido del modal
  $('body').removeClass('modal-open'); // Remover clase que evita scroll
  $('.modal-backdrop').remove(); // Eliminar todos los backdrops
  $("#main_modal").removeAttr('style'); // Restablecer el estilo del modal
}

// Maneja el evento cuando el modal es mostrado
function handleModalShown() {
  $('body').addClass('modal-open'); // Asegurarse de que el cuerpo del documento está listo para mostrar el modal
  initializeModalComponents();
}

// Maneja el evento cuando el modal se está ocultando
function handleModalHide() {
  $('body').removeClass('modal-open'); // Remover clase que evita scroll
  $('.modal-backdrop').remove(); // Eliminar todos los backdrops
}

// Maneja el clic en los botones de cerrar
function handleCloseClick() {
  setTimeout(function() {
    $('.modal-backdrop').remove();
    $('body').removeClass('modal-open');
    $('#modal').html(''); // Limpia el contenido del modal
    $("#main_modal").removeAttr('style'); // Restablecer el estilo del modal
  }, 1);
}
