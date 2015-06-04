


<%-- 
    Document   : caja
    Created on : 23-oct-2014, 12:19:52
    Author     : Sebastian, David, Lorenzo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="WEB-INF/jspf/header.jspf" %>

<!--
Este contenedor tiene el contenido de la pagina, en este caso un accordion que contendrá 
un par de paneles, uno para la gestión de Compras, otro para la gestion de Ventas.
-->

<div class="container-fluid" style="height: 100%">
    <div class="row">
        <div class="col-md-3" style="height: 100%">
            <div class="panel-group" id="accordion">
                <!--Gestión de Compras-->
                <div class="panel panel-default">
                    <!--
                    Aqui el botón que desplegara la gestion de Compras
                    -->
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a id="btnGestionCompras" role="tab" data-toggle="tab" href="javascript:void(0)" data-target="#tabListas">
                                Gestión de Compras 
                            </a>
                        </h4>
                    </div>
                </div>
                <!--Gestión de Ventas-->
                <div class="panel panel-default">
                    <!--
                    Aqui el boton que desplegara la gestión Ventas
                    -->
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a id="btnGestionVentas" role="tab" data-toggle="tab" href="javascript:void(0)" data-target="#tabListas">
                                Gestión de Ventas
                            </a>
                        </h4>
                    </div>
                </div>
                <!--Gestión de abonos-->
                <div class="panel panel-default">
                    <!--
                    Aqui el boton que desplegara la gestión de Abonos
                    -->
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a id="btnGestionVentas" role="tab" data-toggle="tab" href="javascript:void(0)" data-target="#tabListas">
                                Gestión de Abonos
                            </a>
                        </h4>
                    </div>
                </div>
                <!--Gestión de créditos-->
                <div class="panel panel-default">
                    <!--
                    Aqui el boton que desplegara la gestión de créditos
                    -->
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a id="btnGestionCredito" role="tab" data-toggle="tab" href="javascript:void(0)" data-target="#tabListas">
                                Gestión de Créditos
                            </a>
                        </h4>
                    </div>
                </div>
                <!-- Gestion de Diario de Caja-->
                <div class="panel panel-default">
                    <!--
                    Aquí el botón que desplegara la gestión Diario de Caja
                    -->
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour">
                                Gestión de Diario de Caja
                            </a>
                        </h4>
                    </div>
                    <!--
                    Aquí el contenido de la gestión de Diario de Caja, en este caso un boton para registrar  Movimientos diarios
                    
                    -->                              
                    <div id="collapseFour" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input data-toggle="modal" class="btn btn-default btn-block" type="button" data-target="#miPopupDiario" data-dismiss="modal" name="regDiario" value="Registrar Diario">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="contenedor" class="col-md-9">
            <div class="tab-content" id="contenidoDinamico" data-actual="listas" style="height: 100%">
                <div role="tabpanel" class="tab-pane fade in active" id="tabListas" style="height: 100%">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="active">
                            <a href="#compra" role="tab" data-toggle="tab">Listado de Compras</a>
                        </li>
                        <li>
                            <a href="#ventas" role="tab" data-toggle="tab">Listado de Ventas</a>
                        </li>
                        <li>
                            <a href="#abonos" role="tab" data-toggle="tab">Listado de Abonos</a>                            
                        </li>                            
                        <li>
                            <a href="#creditos" role="tab" data-toggle="tab">Listado de Créditos</a>                            
                        </li>                            
                        <li>
                            <a href="#diario" role="tab" data-toggle="tab">Diario de caja</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="compra">
                            <table id="tblCompra" class="table table-responsive table-hover" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-center">Factura Proveedor</th>
                                        <th class="text-center">Nombre Proveedor</th>
                                        <th class="text-center">Fecha de Compra</th>
                                        <th class="text-center">Total Compra</th>
                                        <th class="text-center">Consultar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="ventas">
                            <table id="tblVentas" class="table table-responsive table-hover" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-center">Número Venta</th>
                                        <th class="text-center">Fecha</th>
                                        <th class="text-center">Cedula Cliente</th>
                                        <th class="text-center">Nombre Cliente</th>
                                        <th class="text-center">Total </th>                                
                                        <th class="text-center">Consultar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="abonos">
                            <table id="tblAbono" class="table table-responsive table-hover" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-center">Id. Abono</th>
                                        <th class="text-center">Id. Crédito</th>
                                        <th class="text-center">Valor Abono ($)</th>                                
                                        <th class="text-center">Fecha Pago</th>                                        
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="creditos">
                            <table id="tblCreditos" class="table table-responsive table-hover" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-center">Id. Crédito</th>
                                        <th class="text-center">Documento</th>
                                        <th class="text-center">Fecha inicio</th>
                                        <th class="text-center">Saldo inicial ($)</th>
                                        <th class="text-center">Saldo actual ($)</th>
                                        <th class="text-center">Estado</th>                                
                                        <th class="text-center">Detalle</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade" id="diario">
                            <table id="tblDiario" class="table table-hover tabla" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-center">Código</th>
                                        <th class="text-center">Total Compras</th>
                                        <th class="text-center">Total Ventas</th>
                                        <th class="text-center">Fecha</th>
                                        <th class="text-center">Total </th>                                
                                        <th class="text-center">Consultar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">0001</td>
                                        <td class="text-center">10000</td>
                                        <td class="text-center">30000</td>
                                        <td class="text-center">21/11/2014</td>
                                        <td class="text-center">30000</td>
                                        <td class="text-center"><a class="btn-sm btn-primary btn-block " data-toggle="modal" data-target="#miPopupBusqueda" href="javascript:void(0)">                                                <span class="glyphicon glyphicon-search"></span></a>
                                        </td>  
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane fade in" id="tabMovimientos" style="height: 100%">
                    <div id="movimientos" class="row" style="height: 100%">
                        <div class="col-md-12 panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <label id='titulo'></label>
                                </div>
                            </div>
                            <div class="panel-body">
                                <form id="formMovimiento" method="POST">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label id="nombre" for="txtNombre">
                                                        </label>
                                                        <input name="txtNombre" id="txtNombre" type="text" class="form-control" placeholder="" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label id="numero" for="txtNumero">
                                                        </label>
                                                        <input name="txtNumero" id="txtNumero" type="text" class="form-control" placeholder="" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label  for="txtDocumentoCliente">
                                                            Documento del Cliente
                                                        </label>
                                                        <input name="txtDocumentoCliente" id="txtDocumentoCliente" type="text" class="form-control" placeholder="" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="ddlArticulos">
                                                            Artículos:
                                                        </label>
                                                        <select class="form-control" style="width: 100%" id="ddlArticulos">
                                                            <option></option>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input id="btnArticulo" class="btn btn-default btn-block" type="button" onclick="articulo.registrar()" value="Registrar Artículo">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-8" style="height: 100%">
                                            <div class="row">
                                                <div class="col-md-offset-9 col-md-3">
                                                    <div class="form-group">
                                                        <label for="txtFechaMovimiento" id="txtFechaMovimiento">

                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 table-responsive">
                                                    <table id="tablaDetalleMovimiento" class="table table-bordered table-hover table-sortable" id="tab_logic">
                                                        <thead>
                                                            <tr >
                                                                <th class="text-center">
                                                                    Id
                                                                </th>
                                                                <th class="text-center">
                                                                    Nombre
                                                                </th>
                                                                <th class="text-center">
                                                                    Cantidad
                                                                </th>
                                                                <th class="text-center">
                                                                    Valor
                                                                </th>
                                                                <th class="text-center" style="border-top: 1px solid #ffffff; border-right: 1px solid #ffffff;">
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody> 
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            <div class="row bottom">
                                                <div class="col-md-offset-2 col-md-5">
                                                    <input id="btnMovimiento" type="submit" class="btn btn-default" value="Efectuar Compra" onclick="compra.efectuarCompra()">
                                                </div>
                                                <div class="col-md-2 text-center">
                                                    <label for="txtTotalMovimiento" id="total">
                                                    </label>
                                                </div>
                                                <div class="col-md-3">
                                                    <input type="number" value="0" id="txtTotalMovimiento" class="form-control" readonly="true">
                                                </div>
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

<!--

Los Popup son ventanas emergentes que estan formadas por la clase modal, a su vez esta clase
tiene categorias, en este caso este es un modal-dialog que permite ingresar informacion al usuario
el modal tiene un contenido que es el modal-content y este contenido esta separado por una cabeza (modal-header)
un cuerpo (modal-body) y un pie (modal-footer), en mi caso solo le puse el cuerpo y dentro de el puse el panel con la información
referente al detalle de la compra

El panel que se encuentra en el Popup Detalle compra, esta dividido en cabeza cuerpo y pie, la capeza a su vez tiene un titulo.
dentro del cuerpo del panel se encuentra el formulario para agregar elementos y una tabla que muestra todos los articulos a comprar,
finalmente en el pie se ponen los botones de aceptar y cancelar respectivamente.
-->


<!--Popup Articulo-->
<%@include file="WEB-INF/jspf/modalArticulo.jspf" %>

<!--Popup Abono-->
<%@include file="WEB-INF/jspf/modalAbono.jspf" %>

<!--Popup Credito-->
<%@include file="WEB-INF/jspf/modalCredito.jspf" %>

<%@include file="WEB-INF/jspf/footer.jspf" %>

