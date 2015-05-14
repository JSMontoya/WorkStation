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

<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <div class="panel-group" id="accordion">
                <!--Gestión de Compras-->
                <div class="panel panel-default">
                    <!--
                    Aqui el botón que desplegara la gestion de Compras
                    -->
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a  data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                Gestión de Compras 
                            </a>
                        </h4>
                    </div>
                    <!--
                    Aqui el contenido de la gestion de Compras, en este caso un boton para registrar  una compra
                    y otro para consultar el registro de comrpas
                    -->                            
                    <div id="collapseOne" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input class="btn btn-default btn-block" type="button" value="Registrar Compra" onclick="cambiarPantalla()">
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!--Gestión de Ventas-->
                <div class="panel panel-default">
                    <!--
                    Aqui el boton que desplegara la gestión Ventas
                    -->
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                Gestión de Ventas
                            </a>
                        </h4>
                    </div>
                    <!--
                    Aqui el contenido de la gestion de Ventas, en este caso un boton para registrar  una Venta
                    y otro para consultar el registro de Ventas
                    -->                              
                    <div id="collapseTwo" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input data-toggle="modal" class="btn btn-default btn-block" type="button" data-target="#miPopupRegistroVenta" data-dismiss="modal" name="regVenta" value="Registrar Venta">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel-group" id="accordion2">
                                        <div class="panel panel-default">
                                            <input class="btn btn-default btn-block" data-toggle="collapse" value="Consultar Facturas" data-parent="#accordion2" href="#collapseConsultaFactura"/>                                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Gestión de Abonos-->
                <div class="panel panel-default">
                    <!--
                    Aquí el botón que desplegará la gestión de Abonos
                    -->
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                Gestión de Abonos
                            </a>
                        </h4>
                    </div>
                    <!--
                    Aquí el contenido de la gestión de abonos, en este caso habrá un botón para registrar un abono
                    y otro para consultar abonos por crédito
                    -->                              
                    <div id="collapseThree" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <input data-toggle="modal" class="btn btn-default btn-block" type="button" data-target="#miPopupAbono" data-dismiss="modal" name="regAbono" value="Registrar Abono">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="panel-group" id="accordion2">
                                        <div class="panel panel-default">
                                            <input class="btn btn-default btn-block" data-toggle="collapse" value="Consultar Abono por crédito" data-parent="#accordion2" href="#collapseConsultaAbono"/>                                                           
                                        </div>
                                    </div>
                                    <div class="panel-collapse collapse" id="collapseConsultaAbono">
                                        <div class="panel-body">
                                            <form action="ControllerAbono" method="POST">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label for="txtIdCredito">
                                                                Id. del Crédito
                                                            </label>
                                                            <input name="txtIdCredito" id="txtIdCredito" type="text" class="form-control" placeholder="Ej: 12345" required>
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
                                    </div>
                                </div>
                            </div>
                        </div>
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
            <div class="tab-content" id="contenidoDinamico">
                <div class="tab-pane active" id="tabListas">
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
                            <a href="#diario" role="tab" data-toggle="tab">Diario de caja</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="compra">
                            <table id="tblCompra" class="table table-responsive table-hover" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-center">Factura Proveedor</th>
                                        <th class="text-center">Nombre Proveedor</th>
                                        <th class="text-center">Fecha de Compra</th>
                                        <th class="text-center">Total Compra</th>
                                        <th class="text-center">Editar</th>

                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane" id="ventas">
                            <table id="tblVentas" class="table table-responsive table-hover" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th class="text-center">Número Venta</th>
                                        <th class="text-center">Fecha</th>
                                        <th class="text-center">Cod Cliente</th>
                                        <th class="text-center">Nombre Cliente</th>
                                        <th class="text-center">Total </th>                                
                                        <th class="text-center">Consultar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="text-center">0001</td>
                                        <td class="text-center">21/11/2014</td>
                                        <td class="text-center">0001</td>
                                        <td class="text-center">Manolo</td>
                                        <td class="text-center">56000</td>
                                        <td class="text-center"><a class="btn-sm btn-primary btn-block " data-toggle="modal" data-target="#miPopupDetalleVenta" href="javascript:void(0)"> <span class="glyphicon glyphicon-search"></span></a>
                                        </td>  
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane" id="abonos">
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
                        <div class="tab-pane" id="diario">
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
                <div class="tab-pane" id="tabCompras">
                    <div id="compras" class="row">
                        <div class="col-md-12 panel panel-default">
                            <div class="panel-heading">
                                <div class="panel-title">
                                    <label id='titulo'>Registrar Compra</label>
                                </div>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="txtNombre">
                                                        Nombre del Proveedor
                                                    </label>
                                                    <input name="txtNombre" id="txtNombre" type="text" class="form-control" placeholder="" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="txtNnumeroFactura">
                                                        Numero de Factura
                                                    </label>
                                                    <input name="txtNnumeroFactura" id="txtNnumeroFactura" type="text" class="form-control" placeholder="" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <label for="ddlArticulos">
                                                    Articulos:
                                                </label>
                                            </div>
                                            <div class="col-md-12">
                                                <select class="form-control" style="width: 100%" id="ddlArticulos">
                                                    <option></option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="row">
                                            <div class="col-md-offset-9 col-md-3">
                                                <div class="form-group">
                                                    <label for="txtFechaCompra" id="txtFechaCompra">
                                                        
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12 table-responsive">
                                                <table id="tablaDetalleCompra" class="table table-bordered table-hover table-sortable" id="tab_logic">
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
                                                    <tbody id="tbodyCompra"> 

                                                    </tbody>
                                                </table>
                                            </div>
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

<!--popup RegistroVenta -->
<div class="modal" id="miPopupRegistroVenta">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">                               
                        <form>
                            <div class="panel">
                                <div class="panel-heading estilo2">
                                    <h3 class="panel-title">
                                        Ventas
                                        <button type="button" id="cerrar1" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only" style=" color: #ffffff">Cerrar</span></button>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="txtNumero">
                                                        Código Cliente:
                                                    </label>
                                                    <input name="txtNumero" id="txtNumero" type="text" class="form-control" placeholder="00001" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="txtCliente">
                                                        Cliente:
                                                    </label>
                                                    <input name="txtCliente" id="txtCliente" type="text" class="form-control" placeholder="calle" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label for="dateFechaCompra">
                                                        Fecha :
                                                    </label>
                                                    <input name="dateFecha" id="dateFecha" type="text" class="form-control fecha" placeholder="Ejm: 10/04/2015" required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <input data-toggle="modal" class="btn btn-default btn-block" type="button" data-target="#miPopupRegistrar" data-dismiss="modal" name="regVenta" value="Registrar Artículo">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="Líneas de detalle">
                                                    Líneas de detalle
                                                </label>
                                            </div>
                                        </div>

                                    </div>
                                    <table id="tblArticulosVenta" class="table table-hover" cellspacing="0" width="100%">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Código</th>
                                                <th class="text-center">Artículo</th>
                                                <th class="text-center">Cantidad</th>
                                                <th class="text_center">Precio Unidad</th>
                                                <th class="text_center">Descuento</th>
                                                <th class="text_center">% I.V.A </th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="text-center">00001</td>
                                                <td class="text-center">Vinilo Azul Mediano</td>
                                                <td class="text-center">15</td>
                                                <td class="text-center">1000</td>
                                                <td class="text-center">0</td>
                                                <td class="text-center">16</td>

                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="col-md-12">
                                        <div class="col-sm-4 pull-right">
                                            Total: 15000
                                        </div>
                                    </div>
                                </div>

                                <div class="panel-footer">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input  class="btn btn-default btn-block" id="boton1"type="button" name="action" value="Registrar">
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
<!--Popup Abono-->
<div class="modal" id="miPopupAbono">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">                               
                        <form method="POST" action="ControllerAbono">
                            <div class="panel">
                                <div class="panel-heading estilo2">
                                    <h3 class="panel-title">
                                        Registrar abono
                                        <button type="button" id="cerrar1" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
                                    </h3>
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="txtIdCredito">
                                                    Id. del crédito
                                                </label>
                                                <input name="txtIdCredito" id="txtIdCredito" type="text" class="form-control" placeholder="Ej: 0001" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="txtValorAbono">
                                                    Valor abono ($)
                                                </label>
                                                <input name="txtValorAbono" id="txtValorAbono" type="number" class="form-control" placeholder="Ej: 25000" required>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="dateFechaPago">
                                                    Fecha de pago
                                                </label>
                                                <input name="dateFechaPago" id="dateFechaPago" type="date" class="form-control" placeholder="" required>
                                            </div>
                                        </div>
                                    </div>                                
                                </div>
                                <div class="panel-footer">
                                    <div class="col-md-offset-3 col-md-6">
                                        <div class="form-group">
                                            <input  class="btn btn-default btn-block" id="btnAbono" type="submit" name="action" value="Registrar">
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

<%@include file="WEB-INF/jspf/footer.jspf" %>