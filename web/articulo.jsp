<%-- 
    Document   : articulo
    Created on : 23-oct-2014, 12:13:31
    Author     : Administrador
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="WEB-INF/jspf/header.jspf" %>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                Gestión de Artículos
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input class="btn btn-default btn-block" type="button" onclick="articulo.registrar()" value="Registrar Artículo">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input class="btn btn-default btn-block" type="button" onclick="categoriaArticulo.registrar()" value="Registrar Categoría">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <ul class="nav nav-tabs" role="tablist">
                <li class="active">
                    <a href="#articulos" role="tab" data-toggle="tab">Listado de Artículos</a>
                </li>
                <li>
                    <a href="#categorias" role="tab" data-toggle="tab">Listado de Categorías</a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="articulos">
                    <table id="tblArticulos" class="table table-responsive table-hover" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th class="text-center">Código</th>
                                <th class="text-center">Categoría</th>
                                <th class="text-center">Descripción</th>
                                <th class="text-center">Cantidad</th>                                        
                                <th class="text-center">Precio Compra</th>
                                <th class="text-center">Precio Venta</th>
                                <th class="text-center">Editar</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
                <div class="tab-pane fade" id="categorias">
                    <table id="tblCategoriaArticulos" class="table table-responsive table-hover" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th class="text-center">Código</th>
                                <th class="text-center">Nombre</th>
                                <th class="text-center">Editar</th>
                            </tr>
                        </thead>
                        <tbody> 
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="WEB-INF/jspf/modalArticulo.jspf" %>
<%@include file="WEB-INF/jspf/modalCategoriaArticulo.jspf" %>
<%@include file="WEB-INF/jspf/footer.jspf" %>
