import "bootstrap";
import "jquery";


if ($("#btn-sign-in")) {
  $('#modal-window').modal({
    backdrop: 'static',
    keyboard: false
  });
  $('#btn-sign-in').click();
}


