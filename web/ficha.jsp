<%-- 
    Document   : ficha
    Created on : 23-oct-2014, 12:13:45
    Author     : Administrador
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% if (session.getAttribute("usuario")==null) {
   response.sendRedirect("index.jsp");
}; %>
<!DOCTYPE html>
<html>
    <head>
        <title>WorkStation</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="public/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="public/css/stylesheet.css">
        <script type="text/javascript" src="public/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="public/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="public/js/javascript.js"></script>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/superior.jspf" %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">

                    <form id="form_Maestros" action="ControllerCurso" method="POST">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    Gestion de Fichas
                                </h3>
                            </div>
                            <div class="panel-body">

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="idCurso">
                                                Curso
                                            </label>
                                            <select name="idCurso" id="ddlEstado" class="form-control" required>
                                                <option value="0">Seleccionar... </option>
                                                <option value="1">Oleo</option>
                                                <option value="2">Patchwork</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="txtCupos">
                                                Cupos disponibles
                                            </label>
                                            <input name="txtCupos" id="txtCupos" class="form-control" placeholder="Ejm: 15" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label for="txtPrecio">
                                                Precio
                                            </label>
                                            <input name="txtPrecio" id="txtPrecio" type="number" class="form-control" placeholder="Ejm: 500000" required>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" value="" id="fecha" name="fecha">
                            </div>
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input class="btn btn-default btn-block" type="submit" name="action" value="Añadir">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input class="btn btn-primary btn-block" type="submit" name="action" value="Editar">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-8">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="active">
                            <a href="#cursos" role="tab" data-toggle="tab">Listado de Fichas</a>
                        </li>
                        <li class="pull-right">
                            <input type="submit" class="btn glyphicon-search" value="Buscar"/>
                        </li>
                        <li class="pull-right">
                            <input type="search" value="Lorem Ipsum" class="form-control" />
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="cursos">
                            <table id="example" class="table table-hover" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-center">Código</th>
                                        <th class="text-center">Curso</th>
                                        <th class="text-center">Cupos Disponibles</th>
                                        <th class="text-center">Precio</th>
                                        <th class="text-center">Fecha</th>
                                        <th class="text-center">Estado</th>                                        
                                        <th class="text-center">Editar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">00001</td>
                                        <td class="text-center">PatchWork</td>
                                        <td class="text-center">21</td>
                                        <td class="text-center">300.000</td>                                        
                                        <td class="text-center">15-sep-1984</td>
                                        <td class="text-center"><a class="btn-sm btn-success btn-block " href="javascript:void(0)"  onclick="add('Estado')">
                                                <span class="glyphicon glyphicon-ok"></span></a>
                                        </td>
                                        <td class="text-center"><a class="btn-sm btn-primary btn-block " href="javascript:void(0)"  onclick="add('Estado')">
                                                <span class="glyphicon glyphicon-pencil"></span></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">00002</td>
                                        <td class="text-center">Oleo</td>
                                        <td class="text-center">15</td>
                                        <td class="text-center">250.000</td>
                                        <td class="text-center">17-oct-2014</td>                                        
                                        <td class="text-center"><a class="btn-sm btn-danger btn-block " href="javascript:void(0)"  onclick="add('Estado')">
                                                <span class="glyphicon glyphicon-remove"></span></a>
                                        </td>
                                        <td class="text-center"><a class="btn-sm btn-primary btn-block " href="javascript:void(0)"  onclick="add('Estado')">
                                                <span class="glyphicon glyphicon-pencil"></span></a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
