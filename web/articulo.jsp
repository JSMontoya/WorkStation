<%-- 
    Document   : articulo
    Created on : 23-oct-2014, 12:13:31
    Author     : Administrador
--%>

<%@page import="Controller.ControllerCategoriaArticulo"%>
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
        <script type="text/javascript" src="public/js/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="public/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="public/js/javascript.js"></script>
    </head>
    <body>
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
                                                Ingresar Categoria
                                                <button type="button" id="cerrar1" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                            </h3>
                                        </div>
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="txtNombre">
                                                            Nombre
                                                        </label>
                                                        <input name="txtNombre" id="txtNombre" type="text" class="form-control" placeholder="Ejm: Vinilos" required>
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

        <nav class="navbar navbar-inverse" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a target="_blank" href="#" class="navbar-brand">WorkStation</a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a href="index2.jsp">Inicio</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Administrar Matriculas y Empresas
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="matricula.jsp">Gestion de Matriculas</a></li>
                            <li><a href="empresa.jsp">Gestion de Empresas</a></li>                     
                        </ul>
                    </li> 
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Administrar Fichas, Cursos y Seminarios
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="curso.jsp">Gestion de Cursos y Seminarios</a></li>
                            <li><a href="ficha.jsp">Gestion de Fichas</a></li>
                        </ul>
                    </li> 
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Compras y Ventas
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu active">
                            <li class="active"><a href="articulo.jsp">Gestion de Articulos</a></li>
                            <li><a href="caja.jsp">Caja registradora</a></li>
                        </ul>
                    </li> 
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Opciones
                            <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Link 2</a></li>
                        </ul>
                    </li>              
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user"></span> 
                            <strong>Stella</strong>
                            <span class="glyphicon glyphicon-chevron-down"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li>
                                <div class="navbar-login">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <p class="text-center">
                                                <span class="glyphicon glyphicon-user icon-size"></span>
                                            </p>
                                        </div>
                                        <div class="col-lg-8">
                                            <p class="text-left"><strong>Nombre Apellido</strong></p>
                                            <p class="text-left small">Stellarte@email.com</p>
                                            <p class="text-left">
                                                <a href="#" class="btn btn-primary btn-block btn-sm">Actualizar Datos</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="navbar-login navbar-login-session">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <p>
                                                <a href="#" class="btn btn-danger btn-block">Cerrar Sesion</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-4">
                    <div class="panel-group" id="accordion">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                        Gestion de Articulos
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in">

                                <form id="form_articulo" action="ControllerArticulo" method="POST">

                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="txtNombre">
                                                        Nombre Articulo:
                                                    </label>
                                                    <input name="txtNombre" id="txtNombre" type="text" class="form-control" placeholder="Ejm: Vinilo Rojo" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="txtPrecio">
                                                        Precio:
                                                    </label>
                                                    <input name="txtPrecio" id="txtPrecio" type="number" class="form-control" placeholder="Ejm: 10000" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="txtCantidad">
                                                        Cantidad disponible:
                                                    </label>
                                                    <input name="txtCantidad" id="txtCantidad" type="text" class="form-control" placeholder="Ejm: 30" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="idCategoria">
                                                        Categoria:
                                                    </label>
                                                    <select name="idCategoria" id="ddlEstado" class="form-control" required>
                                                        <option value="1">Pinceles</option>
                                                        <option value="0">Vinilos</option>
                                                        <option value="2">Agregar una nueva...</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input data-toggle="modal" id="boton" class="btn btn-default btn-block" type="submit" name="action" value="Añadir">
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
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                        Gestion de Categorias
                                    </a>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse">
                                <form id="form_categoria" class="" action="ControllerCategoriaArticulos" method="POST">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="txtNombre">
                                                        Nombre
                                                    </label>
                                                    <input name="txtNombre" id="txtNombre" type="text" class="form-control" placeholder="Ejm: Vinilos" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer">
                                        <div class="row">
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
                <div class="col-md-8">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="active">
                            <a href="#articulos" role="tab" data-toggle="tab">Listado de Articulos</a>
                        </li>
                        <li>
                            <a href="#categorias" role="tab" data-toggle="tab">Listado de Categorias</a>
                        </li>
                        <li class="pull-right">
                            <input type="submit" class="btn glyphicon-search" value="Buscar"/>
                        </li>
                        <li class="pull-right">
                            <input type="search" value="Vinilos" class="form-control" />
                        </li>

                        <li class="pull-right">

                            <select class="form-control">
                                <option>Codigo</option>
                                <option>Nombre</option>
                            </select>
                        </li>
                        <li class="pull-right">
                            Buscar por:
                        </li>

                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="articulos">
                            <table id="tblArticulos" class="table table-hover" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-center">Codigo</th>
                                        <th class="text-center">Categoria</th>
                                        <th class="text-center">Nombre</th>
                                        <th class="text-center">Descripcion</th>
                                        <td class="text-center">Cantidad</td>                                        
                                        <th class="text-center">Precio</th>
                                        <th class="text-center">Editar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">00001</td>
                                        <td class="text-center">Vinilos</td>
                                        <td class="text-center">Vinilo Azul Mediano</td>
                                        <td class="text-center">Vinilo en agua Azul 200 ml, ideal para madera</td>
                                        <td class="text-center">30</td>
                                        <td class="text-center">1200</td>
                                        <td class="text-center"><a class="btn-sm btn-primary btn-block " href="javascript:void(0)"  onclick="add('Estado')">
                                                <span class="glyphicon glyphicon-pencil"></span></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">00002</td>
                                        <td class="text-center">Pinceles</td>
                                        <td class="text-center">Pincel 3/4"</td>
                                        <td class="text-center">Pincel con grosor de 3/4" pensado para vinilos de agua</td>
                                        <td class="text-center">50</td>                                        
                                        <td class="text-center">1200</td>
                                        <td class="text-center"><a class="btn-sm btn-primary btn-block " href="javascript:void(0)"  onclick="add('Estado')">
                                                <span class="glyphicon glyphicon-pencil"></span></a>
                                        </td>
                                    </tr>



                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane" id="categorias">
                            <table id="tblCategorias" class="table table-hover" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-center">Código</th>
                                        <th class="text-center">Nombre</th>
                                        <th class="text-center">Editar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">001</td>                                        
                                        <td class="text-center">Vinilos</td>
                                        <td class="text-center"><a class="btn-sm btn-primary btn-block " href="javascript:void(0)"  onclick="add("Estado")">
                                                                   <span class="glyphicon glyphicon-pencil"></span></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-center">002</td>         
                                        <td class="text-center">Pinceles</td>
                                        <td class="text-center"><a class="btn-sm btn-primary btn-block " href="javascript:void(0)"  onclick="add("Estado")">
                                                                   <span class="glyphicon glyphicon-pencil"></span></a>
                                        </td>
                                    </tr>   
                                    <%
                                        Controller.ControllerCategoriaArticulo controllerCategoriaArticulo = new ControllerCategoriaArticulo();
                                        out.print(controllerCategoriaArticulo.getTablecategoriaarticulo());
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
