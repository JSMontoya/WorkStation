/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DTO.ObjCategoriaArticulo;
import Model.Data.ModelCategoriaArticulo;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.ResultSet;
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
 * @author Lorenzo
 */
public class ControllerCategoriaArticulo extends HttpServlet {

    public ModelCategoriaArticulo daoModelCategoriaArticulo;
    public ObjCategoriaArticulo _objCategoriaArticulo = new ObjCategoriaArticulo();

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

        if (request.getParameter("action") != null) {
            switch (request.getParameter("action")) {

                //<editor-fold defaultstate="collapsed" desc="Registrar una Categoría de Artículo">
                case "Registrar": {
                    String nombreCategoriaArticulo = request.getParameter("txtNombre").trim();
                    _objCategoriaArticulo.setNombreCategoriaArticulo(nombreCategoriaArticulo);
                    daoModelCategoriaArticulo = new ModelCategoriaArticulo();
                    String salida = Mensaje(daoModelCategoriaArticulo.Add(_objCategoriaArticulo), "La categoría ha sido registrada correctamente.", "Ha ocurrido un error al intentar registrar la categoría");
                    daoModelCategoriaArticulo.Signout();
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(salida);
                    break;
                }
                //</editor-fold>

                //<editor-fold defaultstate="collapsed" desc="Editar una Categoría de Artículo">
                case "Editar": {
                    int idCategoriaArticulo = Integer.parseInt(request.getParameter("idCategoriaArticulo").trim());
                    String nombreCategoriaArticulo = request.getParameter("txtNombre").trim();
                    _objCategoriaArticulo.setIdCategoriaArticulo(idCategoriaArticulo);
                    _objCategoriaArticulo.setNombreCategoriaArticulo(nombreCategoriaArticulo);
                    daoModelCategoriaArticulo = new ModelCategoriaArticulo();
                    String salida = Mensaje(daoModelCategoriaArticulo.Edit(_objCategoriaArticulo), "La categoría ha sido actualizada correctamente", "Ha ocurrido un error al intentar actualizar la categoría");
                    daoModelCategoriaArticulo.Signout();
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(salida);
                    break;
                }
                //</editor-fold>

                //<editor-fold defaultstate="collapsed" desc="Enlistar todas las Categorías de Artículo">
                case "Enlistar": {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(getTableCategoriaArticulo());
                    break;
                }
                                //</editor-fold>

                //<editor-fold defaultstate="collapsed" desc="Obtener las opciones de Categorías de Artículo">
                case "getOptionsCategorias": {
                    response.setContentType("application/text");
                    response.getWriter().write(getOptionsCategorias());
                    break;
                }
                //</editor-fold>
            }
        }
    }

    public String getTableCategoriaArticulo() {
        ResultSet result;
        int contador = 0;
        List<String[]> lista = new ArrayList<>();
        String[] arreglo;
        try {
            daoModelCategoriaArticulo = new ModelCategoriaArticulo();
            result = daoModelCategoriaArticulo.ListAll();
            while (result.next()) {
                arreglo = new String[3];
                arreglo[0] = result.getString("idCategoriaArticulo").trim();
                arreglo[1] = result.getString("nombreCategoriaArticulo").trim();
                arreglo[2] = "<a class=\"btn-sm btn-primary btn-block \" href=\"javascript:void(0)\"  onclick=\"categoriaArticulo.editar(" + contador + ")\"><span class=\"glyphicon glyphicon-pencil\"></span></a>";
                lista.add(arreglo);
                contador++;
            }
        } catch (Exception e) {
            System.err.println("Ha ocurrido un error" + e.getMessage());
        } finally {
            daoModelCategoriaArticulo.Signout();
        }
        String salida = new Gson().toJson(lista);
        salida = "{\"data\":" + salida + "}";
        return salida;
    }

    public String getOptionsCategorias() {
        ResultSet result;
        String OptionsCategorias = "";
        try {
            daoModelCategoriaArticulo = new ModelCategoriaArticulo();
            result = daoModelCategoriaArticulo.ListAll();
            while (result.next()) {
                OptionsCategorias += "<option value=\"" + result.getString("idCategoriaArticulo").trim() + "\">" + result.getString("nombreCategoriaArticulo").trim() + "</option>";
            }

        } catch (Exception e) {
            OptionsCategorias = "Ha Ocurrido un error" + e.getMessage();
        } finally {
            daoModelCategoriaArticulo.Signout();
        }

        return OptionsCategorias;
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
