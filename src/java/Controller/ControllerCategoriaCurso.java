/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DTO.ObjCategoriaCurso;
import Model.Data.ModelCategoriaCurso;
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
 * @author Administrador
 */
public class ControllerCategoriaCurso extends HttpServlet {

    ModelCategoriaCurso daoModelCategoriaCurso;
    ObjCategoriaCurso _objCategoriaCurso = new ObjCategoriaCurso();

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
        response.setCharacterEncoding("UTF-8");
        if (request.getParameter("action") != null) {
            switch (request.getParameter("action")) {
                //<editor-fold defaultstate="collapsed" desc="Registrar una Categoría de Curso">
                case "Registrar": {
                    String nombre = request.getParameter("txtNombre");
                    _objCategoriaCurso.setNombreCategoriaCurso(nombre);
                    daoModelCategoriaCurso = new ModelCategoriaCurso();
                    String salida = new Gson().toJson(daoModelCategoriaCurso.Add(_objCategoriaCurso));
                    daoModelCategoriaCurso.Signout();
                    response.setContentType("application/json");
                    response.getWriter().write(salida);
                    break;
                }
                //</editor-fold>

                //<editor-fold defaultstate="collapsed" desc="Editar una Categoría de Curso">
                case "Editar": {
                    int idCategoriaArticulo = Integer.parseInt(request.getParameter("idCategoriaCurso"));
                    String nombre = request.getParameter("txtNombre");
                    _objCategoriaCurso.setIdCategoriaCurso(idCategoriaArticulo);
                    _objCategoriaCurso.setNombreCategoriaCurso(nombre);;
                    daoModelCategoriaCurso = new ModelCategoriaCurso();
                    String salida = Mensaje(daoModelCategoriaCurso.Edit(_objCategoriaCurso), "La categoría ha sido actualizada", "Ha ocurrido un error al intentar actualizar la categoría");
                    daoModelCategoriaCurso.Signout();
                    response.setContentType("application/json");
                    response.getWriter().write(salida);
                    break;
                }
                //</editor-fold>

                //<editor-fold defaultstate="collapsed" desc="Enlistar las Categorías de Curso">
                case "Enlistar": {
                    response.setContentType("application/json");
                    response.getWriter().write(getTableCategoriaCurso());
                    break;
                }
                //</editor-fold>

                //<editor-fold defaultstate="collapsed" desc="Obtener las opciones Categorías de Curso">
                case "getOptionsCategorias": {
                    response.setContentType("application/text");
                    response.getWriter().write(getOptionsCategorias());
                    break;
                }
                //</editor-fold>

            }
        }

    }

    public String getTableCategoriaCurso() {
        ResultSet result;
        List<String[]> lista = new ArrayList<>();
                    daoModelCategoriaCurso = new ModelCategoriaCurso();
        try {
            result = daoModelCategoriaCurso.ListAll();
            int contador = 0;
            while (result.next()) {
                String[] arreglo = new String[3];
                arreglo[0] = result.getString("idCategoriaCurso").trim();
                arreglo[1] = result.getString("nombreCategoriaCurso").trim();
                arreglo[2] = "<a class=\"btn-sm btn-primary btn-block \" href=\"javascript:void(0)\"  onclick=\"categoriaCurso.editar(" + contador + ")\"><span class=\"glyphicon glyphicon-edit\"></span></a>";
                lista.add(arreglo);
                contador++;
            }
        } catch (Exception e) {
            System.err.println("Ha ocurrido un error" + e.getMessage());
        } finally {
            daoModelCategoriaCurso.Signout();
        }
        String salida = new Gson().toJson(lista);
        salida = "{\"data\":" + salida + "}";
        return salida;
    }

    public String getOptionsCategorias() {
        ResultSet result;
        String lista = "";
                    daoModelCategoriaCurso = new ModelCategoriaCurso();
        try {
            result = daoModelCategoriaCurso.ListAll();
            while (result.next()) {
                lista += ("<option value=\"" + result.getString("idCategoriaCurso").trim() + "\">" + result.getString("nombreCategoriaCurso").trim() + "</option>");
            }

        } catch (Exception e) {
            lista = ("Ha Ocurrido un error" + e.getMessage());
        } finally {
            daoModelCategoriaCurso.Signout();
        }
        return lista;
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
