/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.google.gson.Gson;
import Model.DTO.ObjCurso;
import Model.Data.ModelCurso;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Zack
 */
public class ControllerCurso extends HttpServlet {

    ObjCurso _objCurso = new ObjCurso();
    ModelCurso daoModelCurso = new ModelCurso();

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
                case "Registrar":
                    String nombre,
                     descripcion;
                    int estado,
                     duracion,
                     categoria;
                    nombre = new String(request.getParameter("txtNombre").getBytes("ISO-8859-1"), "UTF-8");
                    descripcion = new String(request.getParameter("txtDescripcion").getBytes("ISO-8859-1"), "UTF-8");
                    duracion = Integer.parseInt(request.getParameter("dateDuracion"));
                    estado = Integer.parseInt(request.getParameter("ddlEstado"));
                    categoria = Integer.parseInt(request.getParameter("ddlCategoria"));
                    _objCurso.setIdCategoria(categoria);
                    _objCurso.setDescripcion(descripcion);
                    _objCurso.setNombreCurso(nombre);
                    _objCurso.setDuracionCurso(duracion);
                    _objCurso.setEstadoCurso(estado);
                    daoModelCurso.Add(_objCurso);
                    response.sendRedirect("curso.jsp");
                    break;

            }
        }

    }

    public String getTableCursos() {
        ResultSet result;
        String tableCursos = "";
        try {
            result = daoModelCurso.ListAll();
            while (result.next()) {
                String consulta = result.getString("idCurso") + ",'ControllerCurso','POST'";
                tableCursos += "<input type=\"hidden\" name=\"idCurso\" id=\"idCurso\" value=\"" + result.getString("idCurso") + "\">";
                tableCursos += "<tr>";
                tableCursos += "<td class=\"text-center\">" + result.getString("idCurso").trim() + "</td>";
                tableCursos += "<td class=\"text-center\">" + result.getString("nombreCurso").trim() + "</td>";
                tableCursos += "<td class=\"text-center\">" + result.getString("estadoCurso").trim() + "</td>";
                tableCursos += "<td class=\"text-center\"><a class=\"btn-sm btn-success btn-block \" onclick=\"consultar(" + consulta + ")\">\n"
                        + "<span class=\"glyphicon glyphicon-search\"></span></a>\n</td>";
                tableCursos += "<td class=\"text-center\"><a class=\"btn-sm btn-primary btn-block \"  data-toggle=\"modal\"  data-target=\"#articulos\" href=\"javascript:void(0)\"  onclick=\"editar(" + result.getString("idCurso") + ")\">\n"
                        + "<span class=\"glyphicon glyphicon-edit\"></span></a>\n</td>";
                tableCursos += "</tr>";
            }
        } catch (Exception e) {
            tableCursos = "Ha Ocurrido un error" + e.getMessage();

        } finally {
            daoModelCurso.Signout();
        }
        return tableCursos;
    }

    public ArrayList ConsultarCurso(ArrayList lista) {
        return lista;
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
        if (request.getParameter("action") != null) {
            if (request.getParameter("action").equals("Consultar")) {
                String aux = request.getParameter("id");
                int id = Integer.parseInt(aux.trim());
                ResultSet result;
                try {
                    result = daoModelCurso.buscarPorID(id);
                    Map<String, String> respuesta = new LinkedHashMap<>();
                    while (result.next()) {
                        respuesta.put("idCurso", result.getString("idCurso"));
                        respuesta.put("nombreCurso", result.getString("nombreCurso"));
                        respuesta.put("duracionCurso", result.getString("duracionCurso"));
                        respuesta.put("estadoCurso", result.getString("estadoCurso"));
                        respuesta.put("descripcionCurso", result.getString("descripcionCurso"));
                        respuesta.put("nombreCategoriaCurso", result.getString("nombreCategoriaCurso"));
                    }
                    String salida = new Gson().toJson(respuesta);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(salida);
                } catch (Exception e) {
                    System.err.println(e.getMessage());
                }
            } else {
                processRequest(request, response);
            }
        }

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
