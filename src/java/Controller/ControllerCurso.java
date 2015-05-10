/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.google.gson.Gson;
import Model.DTO.ObjCurso;
import Model.Data.ModelCategoriaCurso;
import Model.Data.ModelCurso;
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
 * @author Zack
 */
public class ControllerCurso extends HttpServlet {

    ObjCurso _objCurso = new ObjCurso();
    ModelCurso daoModelCurso = new ModelCurso();
    ModelCategoriaCurso daoModelCategoriaCurso = new ModelCategoriaCurso();

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
            String nombre, descripcion, aux, salida, tipo;
            int estado = 0, cantidadClases, categoria, id, horasPorClase, precio;
            Map<String, String> respuesta;
            ResultSet result;
            switch (request.getParameter("action")) {

                // <editor-fold defaultstate="collapsed" desc="Registrar un Curso">
                case "Registrar": {
                    tipo = request.getParameter("tipo");
                    nombre = request.getParameter("txtNombre").trim();
                    descripcion = request.getParameter("txtDescripcion").trim();
                    precio = Integer.parseInt(request.getParameter("txtPrecio").trim());
                    estado = Integer.parseInt(request.getParameter("ddlEstado").trim());
                    horasPorClase = Integer.parseInt(request.getParameter("txtCantidadHoras").trim());
                    if (tipo.equals("Seminario")) {
                        cantidadClases = 1;
                        categoria = daoModelCategoriaCurso.GetIDCategoriaSeminario();
                    } else {
                        cantidadClases = Integer.parseInt(request.getParameter("txtCantidadClases").trim());
                        categoria = Integer.parseInt(request.getParameter("ddlCategoria").trim());
                    }
                    _objCurso.setIdCategoriaCurso(categoria);
                    _objCurso.setDescripcionCurso(descripcion);
                    _objCurso.setNombreCurso(nombre);
                    _objCurso.setCantidadClases(cantidadClases);
                    _objCurso.setHorasPorClase(horasPorClase);
                    _objCurso.setEstadoCurso(estado);
                    _objCurso.setPrecioCurso(precio);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    salida = Mensaje(daoModelCurso.Add(_objCurso), "El Curso ha sido registrado", "Ha ocurrido un error al intentar registrar el Curso");
                    response.getWriter().write(salida);
                    break;
                }
                //</editor-fold>

                // <editor-fold defaultstate="collapsed" desc="Consultar un Curso">
                case "Consultar": {
                    aux = request.getParameter("id");
                    id = Integer.parseInt(aux.trim());
                    tipo = request.getParameter("type");
                    try {
                        respuesta = new LinkedHashMap<>();
                        if (tipo.equals("Seminario")) {
                            result = daoModelCurso.buscarSeminarioPorID(id);
                        } else {
                            result = daoModelCurso.buscarCursoPorID(id);
                        }
                        while (result.next()) {
                            respuesta.put("idCurso", result.getString("idCurso"));
                            respuesta.put("nombreCurso", result.getString("nombreCurso"));
                            respuesta.put("cantidadClases", result.getString("cantidadClases"));
                            respuesta.put("horasPorClase", result.getString("horasPorClase"));
                            respuesta.put("estadoCurso", result.getString("estadoCurso"));
                            respuesta.put("precioCurso", result.getString("precioCurso"));
                            respuesta.put("descripcionCurso", result.getString("descripcionCurso"));
                            respuesta.put("idCategoriaCurso", result.getString("idCategoriaCurso"));
                            respuesta.put("nombreCategoriaCurso", result.getString("nombreCategoriaCurso"));
                        }
                        salida = new Gson().toJson(respuesta);
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        response.getWriter().write(salida);
                    } catch (Exception e) {
                        System.err.println(e.getMessage());
                    }
                    break;
                }
                //</editor-fold>

                // <editor-fold defaultstate="collapsed" desc="Cambiar el estado de un Curso o Seminario">
                case "Estado": {
                    aux = request.getParameter("id");
                    id = Integer.parseInt(aux.trim());
                    try {
                        tipo = request.getParameter("type");
                        if (tipo == null) {
                            result = daoModelCurso.buscarCursoPorID(id);
                        } else if (tipo.equals("Seminario")) {
                            result = daoModelCurso.buscarSeminarioPorID(id);
                        } else {
                            result = daoModelCurso.buscarCursoPorID(id);
                        }
                        while (result.next()) {
                            estado = Integer.parseInt(result.getString("estadoCurso"));
                        }
                        estado = estado > 0 ? 0 : 1;
                        _objCurso = new ObjCurso();
                        _objCurso.setIdCurso(id);
                        _objCurso.setEstadoCurso(estado);
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        salida = Mensaje(daoModelCurso.cambiarEstado(_objCurso), "El estado ha sido actualizado", "Ha ocurrido un error al intentar actualizar el estado");
                        response.getWriter().write(salida);
                    } catch (Exception e) {
                        System.err.println("Ha ocurrido un error en el controllerCurso : " + e.getMessage());
                    }
                    break;
                }
                //</editor-fold>

                // <editor-fold defaultstate="collapsed" desc="Editar un Curso">
                case "Editar": {
                    aux = request.getParameter("idCurso");
                    id = Integer.parseInt(aux.trim());
                    tipo = request.getParameter("tipo");
                    nombre = request.getParameter("txtNombre").trim();
                    descripcion = request.getParameter("txtDescripcion").trim();
                    precio = Integer.parseInt(request.getParameter("txtPrecio").trim());
                    estado = Integer.parseInt(request.getParameter("ddlEstado").trim());
                    horasPorClase = Integer.parseInt(request.getParameter("txtCantidadHoras").trim());
                    cantidadClases = Integer.parseInt(request.getParameter("txtCantidadClases").trim());
                    if (tipo.equals("Seminario")) {
                        categoria = daoModelCategoriaCurso.GetIDCategoriaSeminario();
                    } else {
                        categoria = Integer.parseInt(request.getParameter("ddlCategoria").trim());
                    }
                    _objCurso.setIdCurso(id);
                    _objCurso.setIdCategoriaCurso(categoria);
                    _objCurso.setDescripcionCurso(descripcion);
                    _objCurso.setNombreCurso(nombre);
                    _objCurso.setCantidadClases(cantidadClases);
                    _objCurso.setHorasPorClase(horasPorClase);
                    _objCurso.setEstadoCurso(estado);
                    _objCurso.setPrecioCurso(precio);
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    salida = Mensaje(daoModelCurso.Edit(_objCurso), "El Curso ha sido actualizado", "Ha ocurrido un error al intentar actualizar el Curso");
                    response.getWriter().write(salida);
                    break;
                }
                //</editor-fold>

                // <editor-fold defaultstate="collapsed" desc="Enlistar los Cursos">
                case "Enlistar": {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(getTableCursos());
                    break;
                }
                //</editor-fold>

                // <editor-fold defaultstate="collapsed" desc="Enlistar los Seminarios">
                case "EnlistarSeminarios": {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(getTableSeminarios());
                    break;
                }
                //</editor-fold>

                // <editor-fold defaultstate="collapsed" desc="Enlistar los Cursos">
                case "cursosDisponibles": {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(getCursosDisponibles());
                    break;
                }
                //</editor-fold>

                // <editor-fold defaultstate="collapsed" desc="Enlistar los Seminarios">
                case "seminariosDisponibles": {
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(getSeminariosDisponibles());
                    break;
                }
                //</editor-fold>

                // <editor-fold defaultstate="collapsed" desc="Obtener las opciones de los Cursos">
                case "getOptionsCursos": {
                    response.setContentType("application/text");
                    response.setCharacterEncoding("UTF-8");
                    response.getWriter().write(getOptionsCursos());
                    break;
                }
                //</editor-fold>

            }
        }
    }

    public String getCursosDisponibles() {
        ResultSet result = null;
        List<Map> lista = null;
        Map<String, String> objeto = null;
        try {
            daoModelCurso = new ModelCurso();
            result = daoModelCurso.ListCursosDisponibles();
            lista = new ArrayList<>();
            while (result.next()) {
                objeto = new LinkedHashMap<>();
                objeto.put("idCurso", result.getString("idCurso"));
                objeto.put("nombreCurso", result.getString("nombreCurso"));
                objeto.put("cantidadClases", result.getString("cantidadClases"));
                objeto.put("horasPorClase", result.getString("horasPorClase"));
                objeto.put("estadoCurso", result.getString("estadoCurso"));
                objeto.put("descripcionCurso", result.getString("descripcionCurso"));
                objeto.put("precioCurso", result.getString("precioCurso"));
                objeto.put("idCategoriaCurso", result.getString("idCategoriaCurso"));
                objeto.put("nombreCategoriaCurso", result.getString("nombreCategoriaCurso"));
                lista.add(objeto);
            }
        } catch (Exception e) {
            objeto = new LinkedHashMap<>();
            objeto.put("mensaje", "Ups, al parecer ha ocurrio un error: " + e + ".");
            objeto.put("tipo", "error");
            lista.add(objeto);

        } finally {
            daoModelCurso.Signout();
        }
        String salida = new Gson().toJson(lista);
        return salida;

    }

    public String getSeminariosDisponibles() {
        ResultSet result = null;
        List<Map> lista = null;
        Map<String, String> objeto = null;
        try {
            daoModelCurso = new ModelCurso();
            result = daoModelCurso.ListSeminariosDisponibles();
            lista = new ArrayList<>();
            while (result.next()) {
                objeto = new LinkedHashMap<>();
                objeto.put("idCurso", result.getString("idCurso"));
                objeto.put("nombreCurso", result.getString("nombreCurso"));
                objeto.put("cantidadClases", result.getString("cantidadClases"));
                objeto.put("horasPorClase", result.getString("horasPorClase"));
                objeto.put("estadoCurso", result.getString("estadoCurso"));
                objeto.put("descripcionCurso", result.getString("descripcionCurso"));
                objeto.put("precioCurso", result.getString("precioCurso"));
                objeto.put("idCategoriaCurso", result.getString("idCategoriaCurso"));
                objeto.put("nombreCategoriaCurso", result.getString("nombreCategoriaCurso"));
                lista.add(objeto);
            }
        } catch (Exception e) {
            objeto = new LinkedHashMap<>();
            objeto.put("mensaje", "Ups, al parecer ha ocurrio un error: " + e + ".");
            objeto.put("tipo", "error");
            lista.add(objeto);

        } finally {
            daoModelCurso.Signout();
        }
        String salida = new Gson().toJson(lista);
        return salida;

    }

    public String getTableCursos() {
        ResultSet result;
        List<String[]> lista = new ArrayList<>();
        try {
            result = daoModelCurso.ListAll();
            while (result.next()) {
                String[] estado = {"success", "ok"};
                if (result.getInt("estadoCurso") == 0) {
                    estado[0] = "danger";
                    estado[1] = "remove";
                }
                String[] arreglo = new String[5];
                arreglo[0] = result.getString("idCurso").trim();
                arreglo[1] = result.getString("nombreCurso").trim();
                arreglo[2] = "<a class=\"btn-sm btn-" + estado[0] + " btn-block\" href=\"javascript:void(0)\"  onclick=\"curso.myAjax('Estado'," + arreglo[0] + ")\">"
                        + "<span class=\"glyphicon glyphicon-" + estado[1] + "\"></span></a>";
                arreglo[3] = "<a class=\"btn-sm btn-success btn-block\" href=\"javascript:void(0)\" onclick=\"curso.myAjax('Consultar'," + arreglo[0] + ")\">"
                        + "<span class=\"glyphicon glyphicon-search\"></span></a>";
                arreglo[4] = "<a class=\"btn-sm btn-primary btn-block \"  href=\"javascript:void(0)\" onclick=\"curso.myAjax('Consultar'," + arreglo[0] + ",'Editar')\">"
                        + "<span class=\"glyphicon glyphicon-edit\"></span></a>";
                lista.add(arreglo);
            }
        } catch (Exception e) {
            System.err.println("Ha Ocurrido un error en el controller " + e.toString());
        }
        String salida = new Gson().toJson(lista);
        salida = "{\"data\":" + salida + "}";
        return salida;
    }

    public String getTableSeminarios() {
        ResultSet result;
        List<String[]> lista = new ArrayList<>();
        try {
            result = daoModelCurso.ListAll("Seminarios");
            while (result.next()) {
                String[] estado = {"success", "ok"};
                if (result.getInt("estadoCurso") == 0) {
                    estado[0] = "danger";
                    estado[1] = "remove";
                }
                String[] arreglo = new String[5];
                arreglo[0] = result.getString("idCurso").trim();
                arreglo[1] = result.getString("nombreCurso").trim();
                arreglo[2] = "<a class=\"btn-sm btn-" + estado[0] + " btn-block\" href=\"javascript:void(0)\"  onclick=\"seminario.myAjax('Estado'," + arreglo[0] + ", '','Seminario')\">"
                        + "<span class=\"glyphicon glyphicon-" + estado[1] + "\"></span></a>";
                arreglo[3] = "<a class=\"btn-sm btn-success btn-block\" href=\"javascript:void(0)\" onclick=\"seminario.myAjax('Consultar'," + arreglo[0] + ", '','Seminario')\">"
                        + "<span class=\"glyphicon glyphicon-search\"></span></a>";
                arreglo[4] = "<a class=\"btn-sm btn-primary btn-block \"  href=\"javascript:void(0)\" onclick=\"seminario.myAjax('Consultar'," + arreglo[0] + ",'Editar','Seminario')\">"
                        + "<span class=\"glyphicon glyphicon-edit\"></span></a>";
                lista.add(arreglo);
            }
        } catch (Exception e) {
            System.err.println("Ha Ocurrido un error en el controller " + e.toString());
        }
        String salida = new Gson().toJson(lista);
        salida = "{\"data\":" + salida + "}";
        return salida;
    }

    public String getOptionsCursos() {
        ResultSet result;
        String OptionsCursos = "";
        try {
            result = daoModelCurso.ListAll();
            while (result.next()) {
                OptionsCursos += "<option value=\"" + result.getString("idCurso").trim() + "\">" + result.getString("nombreCurso").trim() + "</option>";
            }

        } catch (Exception e) {
            OptionsCursos = "Ha Ocurrido un error 2" + e.getMessage();
        }

        return OptionsCursos;
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
