/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DTO.ObjCategoriaArticulo;
import Model.Data.ModelCategoriaArticulo;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lorenzo
 */
public class ControllerCategoriaArticulo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    public ModelCategoriaArticulo daoModelCategoriaArticulo = new ModelCategoriaArticulo();
    public ObjCategoriaArticulo _objCategoriaArticulo = new ObjCategoriaArticulo();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action != null) {
            try {
                String nombreCategoriaArticulo = String.valueOf(request.getParameter("txtNombre"));
                _objCategoriaArticulo.setNombreCategoriaArticulo(nombreCategoriaArticulo);
                daoModelCategoriaArticulo.Add(_objCategoriaArticulo);

                response.sendRedirect("articulo.jsp");

            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

        }
    }

    public String getTableCategoriaArticulo() {

        ResultSet result = null;
        String tableCategoriaarticulos = "";

        try {
            result = daoModelCategoriaArticulo.ListAll();

            while (result.next()) {
                tableCategoriaarticulos += "<tr>";
                tableCategoriaarticulos += "<td class=\"text-center\">" + result.getString("idCategoriaArticulo").toString().trim() + "</td>";
                tableCategoriaarticulos += "<td class=\"text-center\">" + result.getString("nombreCategoriaArticulo").toString().trim() + "</td>";
                tableCategoriaarticulos += "<td class=\"text-center\"><a class=\"btn-sm btn-primary btn-block \"  data-toggle=\"modal\"  data-target=\"#articulos\" href=\"javascript:void(0)\"  onclick=\"consultar()\">\n"
                        + "                                                <span class=\"glyphicon glyphicon-pencil\"></span></a>\n</td>";

                tableCategoriaarticulos += "</tr>";

            }
        } catch (Exception e) {
            tableCategoriaarticulos = "Ha ocurrido un error" + e.getMessage();
        } finally {
            daoModelCategoriaArticulo.Signout();
        }
        return tableCategoriaarticulos;
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
