<%-- 
    Document   : matricula
    Created on : 23-oct-2014, 12:13:22
    Author     : Administrador
--%>
<%@page import="Controller.ControllerCliente"%>
<%@page import="Controller.ControllerLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!--
        Cabeza del documento
        Aqui se encuentran importadas las librerias en el siguiente orden:
        Primero importe bootstrap.min.css que es la que le da el responsive.
        Stylesheet.css son personalizaciones, en ella se pueden cambiar los colores de botones y demas.
        jquery contiene una libreria javascript que permite darle efectos a la pagina y algunas validaciones.
        bootstrap.min.js tiene metodos jquery para darle vida y movilidad a la pagina.
        javascript.js son librerias propias para darle algunos eventos a los botones.
    -->    
    <head>       
        <title>WorkStation</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="public/css/stylesheet.css">
        <link rel="stylesheet" type="text/css" href="public/css/bootstrap.min.css">
        <link href="public/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <%@include file="WEB-INF/jspf/superior.jspf" %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4 ">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                Formulario de Estudiante
                            </h3>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input data-toggle="modal" class="btn btn-default btn-block" type="button" data-target="#miPopupEstudiante" data-dismiss="modal" name="regEstudiante" value="Registrar Estudiante">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="panel-group" id="accordion">
                                            <div class="panel panel-default">
                                                <input type="button" class="btn btn-default btn-block" data-toggle="collapse" value="Consultar Estudiante" data-parent="#accodion" href="#collapseConsultaEstudiante"/>                                                           
                                            </div>
                                        </div>
                                        <div class="panel-collapse collapse" id="collapseConsultaEstudiante">
                                            <div class="panel-body">
                                                <form action="ControllerEstudiante" method="POST">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label for="ddlIdentificacion">
                                                                    Tipo de Identificación
                                                                </label>
                                                                <select name="ddlIdentificacion" id="ddlIdentificacion" class="form-control" required>
                                                                    <option value="">Seleccionar...</option>
                                                                    <option value="CC" > Cedula </option>
                                                                    <option value="CE" > Cedula Extranjeria </option>
                                                                    <option value="TI" > Tarjeta de Identidad </option>
                                                                    <option value="RC" > Registro Civil </option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label for="txtIdentificacion">
                                                                    Numero de Identificación
                                                                </label>
                                                                <input name="txtIdentificacion" id="txtIdentificacion" type="text" class="form-control" placeholder="Ejm: 1017225673" required>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <button type="button" class=" btn btn-default btn-block" >
                                                                    <span class="glyphicon glyphicon-search "></span>
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="panel-footer">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-8">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="active">
                            <a href="#estudiantes" role="tab" data-toggle="tab">Listado de Estudiantes</a>
                        </li>
                        <li>
                            <a href="#matriculas" role="tab" data-toggle="tab">Listado de Matriculas</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="estudiantes">
                            <table id="tblEstudiantes" class="table table-hover" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-center">Tipo Documento</th>
                                        <th class="text-center">Documento</th>
                                        <th class="text-center">Nombres</th>
                                        <th class="text-center">Genero</th>
                                        <th class="text-center">Beneficiario</th>
                                        <th class="text-center">Consultar</th>
                                        <th class="text-center">Editar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane" id="matriculas">
                            <table id="tblMatriculas" class="table table-hover tabla" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-center">Código</th>
                                        <th class="text-center">Cliente</th>
                                        <th class="text-center">Curso</th>
                                        <th class="text-center">Fecha Inicio</th>
                                        <th class="text-center">Fecha Fin</th>
                                        <th class="text-center">Estado</th>
                                        <th class="text-center">Editar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!--tr>
                                        <td class="text-center">0001</td>
                                        <td class="text-center">1017225673</td>
                                        <td class="text-center">Oleo</td>
                                        <td class="text-center">11/01/2015</td>
                                        <td class="text-center">11/04/2015</td>
                                        <td class="text-center"><a class="btn-sm btn-success btn-block " href="javascript:void(0)"  onclick="add("Estado")>
                                                                   <span class="glyphicon glyphicon-ok"></span></a>
                                        </td>
                                        <td class="text-center"><a class="btn-sm btn-primary btn-block " href="javascript:void(0)"  onclick="add("Estado")>
                                                                   <span class="glyphicon glyphicon-pencil"></span></a>
                                        </td>
                                    </tr-->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--Emergente de Matricular-->
        <div class="modal" id="matricular">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <form action="ControllerEstudiante" method="POST">
                                    <div class="panel">
                                        <div class="panel-heading estilo2">
                                            <h3 class="panel-title">
                                                Matricular Estudiante
                                                <button type="button" id="cerrar1" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            </h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <div class="form-group">
                                                        <label for="txtNombre">
                                                            Nombres: 
                                                        </label>
                                                        <label id="txtNombre">Juan Sebastian Montoya Montoya</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <div class="form-group">
                                                        <label for="radioBtn2">
                                                            Estado de Matricula: 
                                                        </label>
                                                        <div id="radioBtn2" class="btn-group">
                                                            <a id="radio2" class="btn btn-success btn-sm active" data-toggle="radioEstado" data-title="Y">Activo</a>
                                                            <a id="radio2" class="btn btn-danger btn-sm notActive" data-toggle="radioEstado" data-title="N">Inactivo</a>
                                                        </div>
                                                        <input type="hidden" name="radioEstado" id="radioEstado">
                                                    </div>
                                                </div>
                                            </div>                                            
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtTelefono">
                                                            Telefono: 
                                                        </label>
                                                        <label id="txtTelefono">5861529</label>                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtCelular">
                                                            Celular: 
                                                        </label>
                                                        <label id="txtCelular">3218016237</label>                                                        
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtCorreo">
                                                            Email: 
                                                        </label>
                                                        <label id="txtCorreo">jsmontoya37@misena.edu.co</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtDireccion">
                                                            Dirección: 
                                                        </label>
                                                        <label id="txtDireccion">Cll 24 # 65 e 25</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="dateFechaNaciemiento">
                                                            Fecha de Nacimiento: 
                                                        </label>
                                                        <label id="dateFechaNaciemiento">03/11/1994</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="ddlIdentificacion">
                                                            Tipo de Documento: 
                                                        </label>
                                                        <label id="ddlIdentificacion">Cedula</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtIdentificacion">
                                                            Numero de Identificación: 
                                                        </label>
                                                        <label id="txtIdentificacion">1017225673</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    No se encuentra matriculado
                                                </div>
                                                <div class="col-md-6">
                                                    <input class="btn btn-primary btn-block" type="button"  data-toggle="modal" data-target="#asignarFicha" value="Matricular">
                                                </div>

                                            </div>
                                        </div>

                                        <div class="panel-footer">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input  class="btn btn-default btn-block" type="submit" name="action" value="Aceptar">
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input class="btn btn-primary btn-block" type="button" data-dismiss="modal" name="cerrar" value="Cerrar">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Emergente de Acudiente-->
        <div class="modal" id="miPopup">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <form>
                                    <div class="panel">
                                        <div class="panel-heading estilo2">
                                            <h3 class="panel-title">
                                                Ingresar Acudiente<button type="button" id="cerrar1" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            </h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtNombre">
                                                            Nombres
                                                        </label>
                                                        <input name="txtNombre" id="txtNombre" type="text" class="form-control" placeholder="Ejm: Juan Sebastian" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtApellido">
                                                            Apellidos
                                                        </label>
                                                        <input name="txtApellido" id="txtApellido" type="text" class="form-control" placeholder="Ejm: Montoya Montoya" required>
                                                    </div>
                                                </div>
                                            </div>                                            
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtDireccion">
                                                            Telefono
                                                        </label>
                                                        <input name="txtDireccion" id="txtDireccion" type="text" class="form-control" placeholder="Ejm: Calle 24 # 65 e 25" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtDireccion">
                                                            Correo Electronico
                                                        </label>
                                                        <input name="txtDireccion" id="txtDireccion" type="text" class="form-control" placeholder="Ejm: Calle 24 # 65 e 25" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtDireccion">
                                                            Dirección
                                                        </label>
                                                        <input name="txtDireccion" id="txtDireccion" type="text" class="form-control" placeholder="Ejm: Calle 24 # 65 e 25" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="dateFechaNaciemiento">
                                                            Fecha de Nacimiento
                                                        </label>
                                                        <input name="dateFechaNaciemiento" id="dateFechaNaciemiento" type="date" class="form-control" placeholder="Ejm: 10/10/2014" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="ddlIdentificacion">
                                                            Tipo de Identificación
                                                        </label>
                                                        <select name="ddlIdentificacion" id="ddlIdentificacion" class="form-control" required>
                                                            <option value="">Seleccionar...</option>
                                                            <option value="0" > Cedula </option>
                                                            <option value="1" > Cedula Extranjeria </option>
                                                            <option value="3" > Tarjeta de Identidad </option>
                                                            <option value="4" > Registro Civil </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtIdentificacion">
                                                            Numero de Identificación
                                                        </label>
                                                        <input name="txtIdentificacion" id="txtIdentificacion" type="text" class="form-control" placeholder="Ejm: 1017225673" required>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel-footer">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input  class="btn btn-default btn-block" type="submit" name="action" value="Añadir">
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input class="btn btn-primary btn-block" type="button" data-dismiss="modal" name="cerrar" value="Cancelar">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Emergente de Asignar Ficha-->
        <div class="modal" id="asignarFicha">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <form>
                                    <div class="panel">
                                        <div class="panel-heading estilo2">
                                            <h3 class="panel-title">
                                                Matricular Estudiante
                                                <button type="button" id="cerrar1" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                                            </h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtIdentificacion">
                                                            Estudiante
                                                        </label>
                                                        <label id="txtIdentificacion">CC: 1017225673</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtIdentificacion">
                                                            Ficha:
                                                        </label>
                                                        <select name="ddlEstado" id="ddlEstado" class="form-control" required>
                                                            <option value="1">Seleccione...</option>
                                                            <option value="1">629256</option>
                                                            <option value="1">651848</option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="dateFechaNaciemiento">
                                                            Fecha de Inicio;
                                                        </label>
                                                        <label id="dateFechaNaciemiento">03/11/1994</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="ddlIdentificacion">
                                                            Fecha Fin: 
                                                        </label>
                                                        <label id="ddlIdentificacion">10/12/2014</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group">
                                                    <label for="radioBtn2">
                                                        Genero: 
                                                    </label>
                                                    <label id="ddlIdentificacion">Masculino</label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel-footer">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input  class="btn btn-default btn-block" type="submit" name="action" value="Aceptar">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input class="btn btn-primary btn-block" type="button" data-dismiss="modal" name="cerrar" value="Cerrar">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Emergete de Estudiante -->
        <div class="modal" id="miPopupEstudiante">
            <div class="modal-dialog ">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <form id="form_estudiante" class="" action="ControllerEstudiante" method="POST">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h3 class="panel-title">
                                                Formulario de Estudiante
                                            </h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="ddlIdentificacion">
                                                            Tipo de Identificación
                                                        </label>
                                                        <select name="ddlIdentificacion" id="ddlIdentificacion" class="form-control" required>
                                                            <option value="">Seleccionar...</option>
                                                            <option value="CC" > Cedula </option>
                                                            <option value="CE" > Cedula Extranjeria </option>
                                                            <option value="TI" > Tarjeta de Identidad </option>
                                                            <option value="RC" > Registro Civil </option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtIdentificacion">
                                                            Numero de Identificación
                                                        </label>
                                                        <input name="txtIdentificacion" id="txtIdentificacion" type="text" class="form-control" placeholder="Ejm: 1017225673" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtNombre">
                                                            Nombres
                                                        </label>
                                                        <input name="txtNombre" id="txtNombre" type="text" class="form-control" placeholder="Ejm: Juan Sebastian" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtApellido">
                                                            Apellidos
                                                        </label>
                                                        <input name="txtApellido" id="txtApellido" type="text" class="form-control" placeholder="Ejm: Montoya Montoya" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="radioGenero">
                                                            Genero: 
                                                        </label>
                                                            <label class="radio-inline"><input type="radio" name="radioGenero" id="radioGenero" class="radio-inline" value="0">Femenino</label>
                                                            <label class="radio-inline"><input type="radio" name="radioGenero" id="radioGenero" class="radio-inline" value="1">Masculino</label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="dateFechaNacimiento">
                                                            Fecha de Nacimiento
                                                        </label>
                                                        <input name="dateFechaNacimiento" id="dateFechaNacimiento" type="date" class="form-control" placeholder="Ejm: 10/10/2014" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtDireccion">
                                                            Dirección
                                                        </label>
                                                        <input name="txtDireccion" id="txtDireccion" type="text" class="form-control" placeholder="Ejm: Calle 24 # 65 e 25" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtTelefono">
                                                            Telefono
                                                        </label>
                                                        <input name="txtTelefono" id="txtTelefono" type="text" class="form-control" placeholder="Ejm: 5 65 85 45" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtCelular">
                                                            Celular
                                                        </label>
                                                        <input name="txtCelular" id="txtCelular" type="number" class="form-control" placeholder="Ejm: 321 801 62 37">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtCorreo">
                                                            Correo Electronico
                                                        </label>
                                                        <input name="txtCorreo" id="txtCorreo" type="email" class="form-control" placeholder="Ejm: juansmm@outlook.com" required>
                                                    </div>
                                                </div>
                                            </div>                             
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="radioBeneficiario">
                                                            Beneficiario: 
                                                        </label>
                                                        <label class="radio-inline"><input type="radio" name="radioBeneficiario" id="radioBeneficiario" class="radio-inline" value="1">Si</label>
                                                        <label class="radio-inline"><input type="radio" name="radioBeneficiario" id="radioBeneficiario" class="radio-inline" value="0">No</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input class="btn btn-default btn-block" type="submit" name="action" value="Registrar">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <input class="btn btn-primary btn-block" type="submit" name="action" value="Editar">
                                            </div>
                                        </div>
                                    </div>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<%@include file="WEB-INF/jspf/imports.jspf" %>
</html>

