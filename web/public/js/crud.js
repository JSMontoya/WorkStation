/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var tablaCurso, tablaCategoriaCurso, tablaFicha, tablaSeminario;
var tablas = $('.tabla').DataTable({
    "language": {
        "url": "public/lang/Spanish.json"
    }
});

function editar() {
    var tipo;
    $('.table tbody').on('click', 'tr', function () {
        tipo = $(this).data('tipo');
        if (tipo === 'categoria curso') {
            var rowData = tablaCategoriaCurso.row(this).data();
            categoriaCurso.editar(rowData);
            $('#tblCategoriaCursos tbody').off();
        }
        else if (tipo === 'categoria articulo') {
            var rowData = tablas.table('#tblCategoriaArticulos').row(this).data();
            $('#miPopupCategoriaArticulo').find('#idCategoriaArticulo').attr('value', rowData[0]);
            $('#miPopupCategoriaArticulo').find('#txtNombreCategoriaArticulo').attr('value', rowData[1]);
            $('#miPopupCategoriaArticulo').find('#btnCategoriaArticulo').attr('value', 'Editar');
            $('#miPopupCategoriaArticulo').modal('show');
            $('#tblCategoriaArticulos tbody').off();
        }
        else if (tipo === 'seminario') {
            var rowData = tablas.table('#tblSeminarios').row(this).data();
            $('#miPopupSeminario').find('#idSeminario').attr('value', rowData[0]);
            $('#miPopupSeminario').find('#txtNombreSeminario').attr('value', rowData[1]);
            $('#miPopupSeminario').find('#txtDuracion').attr('value', rowData[2]);
            $('#miPopupSeminario').find('#ddlEstadosemiario').attr('value', rowData[3]);
            $('#miPopupSeminario').find('#btnSeminario').attr('value', 'Editar');
            $('#miPopupSeminario').modal('show');
            $('#tblSeminarios tbody').off();
        }
        else if (tipo === 'articulo') {
            var rowData = tablas.table('#tblArticulos').row(this).data();
            $('#miPopupArticulo').find('#idArticulo').attr('value', rowData[0]);
            $('#miPopupArticulo').find('#txtNombreArticulo').attr('value', rowData[1]);
            $('#miPopupArticulo').find('#txtPrecioArticulo').attr('value', rowData[2]);
            $('#miPopupArticulo').find('#txtCantidadArticulo').attr('value', rowData[3]);
            $('#miPopupArticulo').find('#idCategoriaArticulo').attr('value', rowData[4]);
            $('#miPopupArticulo').find('#btnArticulo').attr('value', 'Editar');
            $('#miPopupArticulo').modal('show');
            $('#tblArticulos tbody').off();
        }
        else if (tipo === 'ficha') {
            var rowData = tablas.table('#tblFichas').row(this).data();
            $('#miPopupFicha').find('#idFicha').attr('value', rowData[0]);
            $('#miPopupFicha').find('#idCursoFicha').attr('value', rowData[1]);
            $('#miPopupFicha').find('#txtCupos').attr('value', rowData[2]);
            $('#miPopupFicha').find('#txtPrecioFicha').attr('value', rowData[3]);
            $('#miPopupFicha').find('#dateFechaFicha').attr('value', rowData[4]);
            $('#miPopupFicha').find('#btnFicha').attr('value', 'Editar');
            $('#miPopupFicha').modal('show');
            $('#tblFichas tbody').off();
        }
        if (tipo === 'empresa') {
            var rowData = tablas.table('#tblEmpresas').row(this).data();
            $('#miPopupEmpresa').find('#txtNitEmpresa').attr('value', rowData[0]).attr('readonly', true);
            $('#miPopupEmpresa').find('#txtNombreEmpresa').attr('value', rowData[1]);
            $('#miPopupEmpresa').find('#txtDireccionEmpresa').attr('value', rowData[2]);
            $('#miPopupEmpresa').find('#txtNombreContacto').attr('value', rowData[3]);
            $('#miPopupEmpresa').find('#txtTelefonoContacto').attr('value', rowData[4]);
            $('#miPopupEmpresa').find('#txtEmailContacto').attr('value', rowData[5]);
            $('#miPopupEmpresa').find('#btnEmpresa').attr('value', 'Editar');
            $('#miPopupEmpresa').modal('show');
            $('#tblEmpresa tbody').off();
        }
    });
}
;
$('#registrarCategoriaArticulo').on('click', function () {
    $('#btnCategoriaArticulo').attr('value', 'Registrar');
    $('#txtNombreCategoriaArticulo').attr('value', ' ');
    $('#miPopupCategoriaArticulo').modal('show');
});
$('#registrarSeminario').on('click', function () {
    $('#btnSeminario').attr('value', 'Registrar');
    $('#txtNombreSeminario').attr('value', ' ');
    $('#txtDuracion').attr('value', ' ');
    $('#ddlEstadosemiario').attr('value', ' ');
    $('#miPopupSeminario').modal('show');
});
$('#registrarAbono').on('click', function () {
    $('#btnAbono').attr('value', 'Registrar');
    $('#txtIdCredito').attr('value', ' ');
    $('#txtValorAbono').attr('value', ' ');
    $('#dateFechaPago').attr('value', ' ');
    $('#miPopupAbono').modal('show');
});

var curso = {
    myAjax: function (accion, id, aux) {
        var form = $('#formCurso');
        $(form).off();
        $(form).on('submit', function () {
            $.ajax({
                type: $(form).attr('method'),
                url: $(form).attr('action'),
                data: $(form).serialize() + '&action=' + accion + '&id=' + id,
                success: function (data) {
                    if (accion == 'Consultar') {
                        if (aux == 'Editar') {
                            curso.editar(data);
                        } else
                            curso.consultar(data);
                    }
                    else if (accion == 'Registrar' || accion == 'Editar') {
                        $('#miPopupCurso').modal('hide');
                        mensaje(data);
                        curso.actualizarTabla();
                    }
                    else if (accion == 'Estado') {
                        mensaje(data);
                        curso.actualizarTabla();
                    }
                    if (accion === 'getOptionsCursos') {
                        curso.cargarOpciones(data);
                    }
                }
            });
            $(form).off();
            return false;
        });
        if (accion === 'Estado' || accion === 'Consultar' || accion === 'getOptionsCursos') {
            $(form).submit();
        }
    },
    consultar: function (data) {
        limpiar("#formCurso");
        $('#miPopupCurso').find('#idCurso').val(data['idCurso']);
        $('#miPopupCurso').find('#ddlCategoria option').prop('selected', false).filter('[value="' + data['idtblCategoriaCurso'] + '"]').prop('selected', true);
        $('#miPopupCurso').find('#txtNombreCurso').val(data['nombreCurso']);
        $('#miPopupCurso').find('#dateDuracion').val(data['duracionCurso']);
        $('#miPopupCurso').find('#txtDescripcionCurso').val(data['descripcionCurso']);
        $('#miPopupCurso').find('#ddlEstado option').prop('selected', false).filter('[value="' + data['estadoCurso'] + '"]').prop('selected', true);
        $('#miPopupCurso').find('#btnCurso').attr('type', 'hidden').attr('disabled', true);
        $('#miPopupCurso').modal('show');
    },
    registrar: function () {
        limpiar("#formCurso");
        $('#miPopupCurso').find('#btnCurso').attr('type', 'submit').attr('value', 'Registrar').attr('disabled', false);
        $('#miPopupCurso').modal('show');
    },
    editar: function (data) {
        curso.consultar(data);
        $('#miPopupCurso').find('#btnCurso').attr('type', 'submit').attr('value', 'Editar').attr('disabled', false);
    },
    cargar: function () {
        curso.myAjax('getOptionsCursos');
        tablaCurso = $('#tblCursos').DataTable({
            "ajax": {
                "url": "ControllerCurso",
                "type": "POST",
                "data": {
                    action: 'Enlistar'
                }
            }, "language": {
                "url": "public/lang/Spanish.json"
            }
        });
    },
    actualizarTabla: function () {
        curso.myAjax('getOptionsCursos');
        tablaCurso.ajax.reload();
    },
    cargarOpciones: function (data) {
        $('#miPopupFicha').find('#idCursoFicha').empty();
        $('#miPopupFicha').find('#idCursoFicha').append(data);
    }
};

var categoriaCurso = {
    myAjax: function (accion) {
        var form = $('#form_categoriaCurso');
        $(form).off();
        $(form).on('submit', function () {
            $.ajax({
                type: $(form).attr('method'),
                url: $(form).attr('action'),
                data: $(form).serialize() + '&action=' + accion,
                success: function (data) {
                    if (accion === 'getOptionsCategorias') {
                        categoriaCurso.cargarOpciones(data);
                    } else if (accion !== 'getOptionsCategorias') {
                        categoriaCurso.actualizarTabla();
                    }
                    $('#miPopupCategoriaCurso').modal('hide');
                }
            });
            $(form).off();
            return false;
        });
        if (accion === 'getOptionsCategorias') {
            $(form).submit();
        }
    },
    registrar: function () {
        limpiar('#form_categoriaCurso');
        $('#miPopupCategoriaCurso').find('#btnCategoriaCurso').attr('value', 'Registrar');
        $('#miPopupCategoriaCurso').modal('show');
    },
    editar: function (tr) {
        var data = tablaCategoriaCurso.row(tr).data();
        $('#miPopupCategoriaCurso').find('#idCategoriaCurso').val(data[0]);
        $('#miPopupCategoriaCurso').find('#txtNombreCategoriaCurso').val(data[1]);
        $('#miPopupCategoriaCurso').find('#btnCategoriaCurso').val('Editar');
        $('#miPopupCategoriaCurso').modal('show');
    },
    cargar: function () {
        categoriaCurso.myAjax('getOptionsCategorias');
        tablaCategoriaCurso = $('#tblCategoriaCursos').DataTable({
            "ajax": {
                "url": "ControllerCategoriaCurso",
                "type": "POST",
                "data": {
                    action: 'Enlistar'
                }
            },
            "language": {
                "url": "public/lang/Spanish.json"
            }
        });
    },
    actualizarTabla: function () {
        categoriaCurso.myAjax('getOptionsCategorias');
        tablaCategoriaCurso.ajax.reload();
    },
    cargarOpciones: function (data) {
        $('#miPopupCurso').find('#ddlCategoria').empty();
        $('#miPopupCurso').find('#ddlCategoria').append(data);
    }
};

var ficha = {
    myAjax: function (accion, id) {
        var form = $('#formFicha');
        $(form).off();
        $(form).on('submit', function () {
            $.ajax({
                type: $(form).attr('method'),
                url: $(form).attr('action'),
                data: $(form).serialize() + '&action=' + accion + '&id=' + id,
                success: function (data) {
                    ficha.actualizarTabla();
                    $('#miPopupFicha').modal('hide');
                    if (accion == 'Estado' || accion == 'Editar') {
                        mensaje(data);
                    }
                }
            });
            $(form).off();
            return false;
        });
        if (accion === 'Estado') {
            $(form).submit();
        }
    },
    registrar: function () {
        limpiar('#formFicha');
        $('#miPopupFicha').find('#btnFicha').attr('value', 'Registrar');
        $('#miPopupFicha').modal('show');
    },
    editar: function (tr, estado, id) {
        var data = tablaFicha.row(tr).data();
        $('#miPopupFicha').find('#idFicha').val(data[0]);
        $('#miPopupFicha').find('#idCursoFicha option').prop('selected', false).filter('[value="' + id + '"]').prop('selected', true);
        $('#miPopupFicha').find('#txtCupos').val(data[2]);
        $('#miPopupFicha').find('#txtPrecioFicha').val(data[3]);
        $('#miPopupFicha').find('#dateFechaFicha').val(data[4]);
        $('#miPopupFicha').find('#estadoFicha option').prop('selected', false).filter('[value="' + estado + '"]').prop('selected', true);
        $('#miPopupFicha').find('#btnFicha').val('Editar');
        $('#miPopupFicha').modal('show');
    },
    cargar: function () {
        tablaFicha = $('#tblFichas').DataTable({
            "ajax": {
                "url": "ControllerFicha",
                "type": "POST",
                "data": {
                    action: 'Enlistar'
                }
            },
            "language": {
                "url": "public/lang/Spanish.json"
            }
        });
    },
    actualizarTabla: function () {
        tablaFicha.ajax.reload();
    }
};

var seminario = {
    myAjax: function (accion, id) {
        var form = $('#formSeminario');
        $(form).off();
        $(form).on('submit', function () {
            $.ajax({
                type: $(form).attr('method'),
                url: $(form).attr('action'),
                data: $(form).serialize() + '&action=' + accion + '&id=' + id,
                success: function (data) {
                    seminario.actualizarTabla();
                    $('#miPopupSeminario').modal('hide');
                    if (accion == 'Estado' || accion == 'Editar') {
                        mensaje(data);
                    }
                }
            });
            $(form).off();
            return false;
        });
        if (accion === 'Estado') {
            $(form).submit();
        }
    },
    registrar: function () {
        limpiar('#formSeminario');
        $('#miPopupSeminario').find('#btnSeminario').attr('value', 'Registrar');
        $('#miPopupSeminario').modal('show');
    },
    editar: function (tr, estado) {
        var data = tablaSeminario.row(tr).data();
        $('#miPopupSeminario').find('#idSeminario').val(data[0]);
        $('#miPopupSeminario').find('#txtNombreSeminario').val(data[1]);
        $('#miPopupSeminario').find('#txtDuracion').val(data[2]);
        $('#miPopupSeminario').find('#ddlEstadosemiario option').prop('selected', false).filter('[value="' + estado + '"]').prop('selected', true);
        $('#miPopupSeminario').find('#btnSeminario').val('Editar');
        $('#miPopupSeminario').modal('show');
    },
    cargar: function () {
        tablaSeminario = $('#tblSeminarios').DataTable({
            "ajax": {
                "url": "ControllerSeminario",
                "type": "POST",
                "data": {
                    action: 'Enlistar'
                }
            },
            "language": {
                "url": "public/lang/Spanish.json"
            }
        });
    },
    actualizarTabla: function () {
        tablaSeminario.ajax.reload();
    }
};

var abono = {
    myAjax: function (accion, id, aux) {
        var form = $('#formAbono');
        $(form).on('submit', function () {
            $.ajax({
                type: $(form).attr('method'),
                url: $(form).attr('action'),
                data: $(form).serialize() + '&action=' + accion + '&id=' + id,
                success: function (data) {
                    if (accion == 'Consultar') {
                        if (aux == 'Editar') {
                            abono.editar(data);
                        } else
                            abono.consultar(data);
                    }
                    else if (accion == 'Registrar' || accion == 'Editar') {
                        $('#miPopupAbono').modal('hide');
                        abono.mensaje(data);
                        abono.actualizarTabla();
                    }
                    else if (accion == 'Estado') {
                        abono.mensaje(data);
                        abono.actualizarTabla();
                    }
                }
            });
            $(form).off();
            return false;
        });
        if (accion === 'Estado' || accion === 'Consultar') {
            $(form).submit();
        }
    },
    consultar: function (data) {
        limpiar("#formAbono");
        $('#miPopupAbono').find('#idAbono').val(data['idAbono']);
        $('#miPopupAbono').find('#txtIdCredito').val(data['idCredito']);
        $('#miPopupAbono').find('#txtValorAbono').val(data['valorAbono']);
        $('#miPopupAbono').find('#dateFechaPago').val(data['fechaPago']);
        $('#miPopupAbono').find('#btnAbono').attr('type', 'hidden').attr('disabled', true);
        $('#miPopupAbono').modal('show');
    },
    registrar: function () {
        limpiar("#formAbono");
        $('#miPopupAbono').find('#btnAbono').attr('type', 'submit').attr('value', 'Registrar').attr('disabled', false);
        $('#miPopupAbono').modal('show');
    },
    editar: function (data) {
        abono.consultar(data);
        $('#miPopupAbono').find('#btnAbono').attr('type', 'submit').attr('value', 'Editar').attr('disabled', false);
    },
    mensaje: function (data) {
        $.notify(data['mensaje'], data['tipo']);
    },
    cargar: function () {
        tablaAbono = $('#tblAbono').DataTable({
            "ajax": {
                "url": "ControllerAbono",
                "type": "POST",
                "data": {
                    action: 'Enlistar'
                }
            }, "language": {
                "url": "public/lang/Spanish.json"
            }
        });
    },
    actualizarTabla: function () {
        tablaAbono.ajax.reload();
    }
};

function limpiar(miForm) {
    $(':input', miForm).each(function () {
        var type = this.type;
        var tag = this.tagName.toLowerCase();
        if (type == 'text' || type == 'password' || tag == 'textarea' || type == 'number' || type == 'hidden' || type == 'date')
            this.value = "";
        else if (type == 'checkbox' || type == 'radio')
            this.checked = false;
        else if (tag == 'select')
            this.selectedIndex = -1;
        else if (false)
            this.value = 0;
    });
}
function mensaje(data) {
    $.notify(data['mensaje'], data['tipo']);
}
ficha.cargar();
categoriaCurso.cargar();
curso.cargar();
abono.cargar();
//credito.cargar()
