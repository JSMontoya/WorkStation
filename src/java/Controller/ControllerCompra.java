/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DTO.ObjCompra;
import Model.DTO.ObjDetalleMovimiento;
import Model.DTO.ObjUsuario;
import Model.Data.ModelCompra;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author siete
 */
public class ControllerCompra extends HttpServlet {

    ModelCompra daoModelCompra;
    ObjCompra _objCompra = new ObjCompra();
    ObjUsuario _objUsuario = new ObjUsuario();
    List<ObjDetalleMovimiento> listObjDetalleMovimientos = new ArrayList<>();
    ObjDetalleMovimiento _objDetalleMovimiento = new ObjDetalleMovimiento();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        SimpleDateFormat formatoFechaEntrada = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat formatoFechaSalida = new SimpleDateFormat("yyyy-MM-dd");
        if (request.getParameter("action") != null) {
            //int estado = 0;

            String action = request.getParameter("action");
            switch (action) {
                case "Registrar": {
                    String documentoUsuario = (request.getParameter("documentoUsuario"));
                    String facturaProveedor = (request.getParameter("txtFacturaProveedor"));
                    String nombreProveedor = (request.getParameter("txtNombreProveedor"));
                    int lenght = Integer.parseInt(request.getParameter("size"));
                    int totalCompra = Integer.parseInt(request.getParameter("txtTotalCompra"));
                    System.out.println(lenght);
                    listObjDetalleMovimientos = new ArrayList<>();
                    for (int i = 0; i < lenght; i++) {
                        _objDetalleMovimiento = new ObjDetalleMovimiento();
                        _objDetalleMovimiento.setIdArticulo(Integer.parseInt(request.getParameter("lista[" + i + "][idArticulo]")));
                        _objDetalleMovimiento.setCantidad(Integer.parseInt(request.getParameter("lista[" + i + "][cantidad]")));
                        _objDetalleMovimiento.setPrecioArticulo(Integer.parseInt(request.getParameter("lista[" + i + "][precioArticulo]")));
                        _objDetalleMovimiento.setTotalDetalleMovimiento(_objDetalleMovimiento.getCantidad() * _objDetalleMovimiento.getPrecioArticulo());
                        _objDetalleMovimiento.setDescuento(lenght);
                        listObjDetalleMovimientos.add(_objDetalleMovimiento);
                    }
                    _objUsuario.setDocumentoUsuario(documentoUsuario);
                    _objCompra.setFacturaProveedor(facturaProveedor);
                    _objCompra.setNombreProveedor(nombreProveedor);
                    _objCompra.setTotalCompra(totalCompra);
                    daoModelCompra = new ModelCompra();
                    daoModelCompra.Add(_objCompra, _objUsuario, listObjDetalleMovimientos);
                    daoModelCompra.Signout();
                    break;
                }
                case "Editar": {
                    try {
                        String facturaProveedor = (request.getParameter("txtFacturaProveedor"));
                        String nombreProveedor = (request.getParameter("txtNombreProveedor"));
                        String fechaCompra = request.getParameter("dateFechaCompra");
                        int totalCompra = Integer.parseInt(request.getParameter("txtTotalCompra"));
                        _objCompra.setFacturaProveedor(facturaProveedor);
                        _objCompra.setNombreProveedor(nombreProveedor);
                        _objCompra.setFechaCompra(formatoFechaSalida.format(formatoFechaEntrada.parse(fechaCompra)));
                        _objCompra.setTotalCompra(totalCompra);
                        daoModelCompra = new ModelCompra();
                        daoModelCompra.Edit(_objCompra);
                        daoModelCompra.Signout();
                        break;
                    } catch (ParseException ex) {
                    }
                }
                case "Enlistar": {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(getTableCompra());
                    break;
                }
                case "Probar": {

                }

            }
        }

    }

    public String getTableCompra() {
        ResultSet result;
        List<String[]> lista = new ArrayList<>();
        try {
            int contador = 0;
            daoModelCompra = new ModelCompra();
            result = daoModelCompra.ListAll();
            while (result.next()) {
                String[] arreglo = new String[5];
                arreglo[0] = result.getString("facturaProveedor").trim();
                arreglo[1] = result.getString("nombreProveedor").trim();
                arreglo[2] = result.getString("fechaCompra").trim();
                arreglo[3] = result.getString("totalCompra").trim();
                arreglo[4] = "<a class=\"btn-sm btn-primary btn-block\" href=\"javascript:void(0)\" onclick=\"compra.editar(" + contador + ")\">"
                        + "<span class=\"glyphicon glyphicon-edit\"></span></a>";
                lista.add(arreglo);
                contador++;
            }
        } catch (Exception e) {
            System.err.println("Ha Ocurrido un error en el controller compra " + e.toString());
        }
        String salida = new Gson().toJson(lista);
        salida = "{\"data\":" + salida + "}";
        return salida;
    }

    public String Mensaje(boolean entrada, String mensajeSuccess, String mensajeError) {
        Map<String, String> mensaje = new LinkedHashMap<>();
        if (entrada) {
            mensaje.put("mensaje", mensajeSuccess);
            mensaje.put("tipo", "success");

        } else {
            mensaje.put("mensaje", mensajeError);
            mensaje.put("tipo", "error");
        }
        String salida = new Gson().toJson(mensaje);
        return salida;
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
