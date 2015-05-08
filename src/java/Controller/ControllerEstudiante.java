/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.DTO.ObjAcudiente;
import Model.DTO.ObjUsuario;
import Model.DTO.ObjDetalleUsuario;
import Model.Data.ModelAcudiente;
import Model.Data.ModelEstudiante;
import Model.Data.ModelFicha;
import com.google.gson.Gson;
import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Zack
 */
public class ControllerEstudiante extends HttpServlet {

    ModelEstudiante daoModelEstudiante = new ModelEstudiante();
    public ObjUsuario _objUsuario = new ObjUsuario();
    public ObjDetalleUsuario _objDetalleUsuario = new ObjDetalleUsuario();
    public ModelAcudiente daoModelAcudiente = new ModelAcudiente();
    public ObjAcudiente _objAcudiente = new ObjAcudiente();
    ModelFicha daoModelFicha = new ModelFicha();
    SimpleDateFormat formatoFechaEntrada = new SimpleDateFormat("dd/MM/yyyy");
    SimpleDateFormat formatoFechaSalida = new SimpleDateFormat("yyyy-MM-dd");

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
        Map<String, String> respuesta;
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "Registrar": {
                    try {
                        String tipoDocumento = request.getParameter("ddlIdentificacion").trim();
                        int numeroIdentificacion = Integer.parseInt(request.getParameter("txtIdentificacion").trim());
                        String identificacion = tipoDocumento + numeroIdentificacion;
                        String nombre = request.getParameter("txtNombre").trim();
                        String apellido = request.getParameter("txtApellido").trim();
                        int genero = Integer.parseInt(request.getParameter("radioGenero").trim());
                        String fechaNacimiento = request.getParameter("dateFechaNacimiento").trim();
                        String direccion = request.getParameter("txtDireccion").trim();
                        String telefono = request.getParameter("txtTelefono").trim();
                        String celular = request.getParameter("txtCelular").trim();
                        String correo = request.getParameter("txtCorreo").trim();
                        int estado = Integer.parseInt(request.getParameter("radioBeneficiario").trim());
                        String pass = request.getParameter("pass").trim();
                        //Beneficiario 0->No Subvencionado 1->Subvencionado?
                        String tipoDocAcudiente = "";
                        int numeroDocAcudiente = 0;
                        if (request.getParameter("tipoDocAcudiente") != null && request.getParameter("numeroDocAcudiente") != null) {
                            tipoDocAcudiente = request.getParameter("tipoDocAcudiente").trim();
                            numeroDocAcudiente = Integer.parseInt(request.getParameter("numeroDocAcudiente").trim());
                            String identificacionAcudiente = tipoDocAcudiente + numeroDocAcudiente;
                            _objUsuario.setDocumentoAcudiente(identificacionAcudiente);
                        }
                        _objUsuario.setDocumentoUsuario(identificacion);
                        _objUsuario.setNombreUsuario(nombre);
                        _objUsuario.setApellidoUsuario(apellido);
                        _objDetalleUsuario.setGeneroUsuario(genero);
                        _objUsuario.setFechaNacimiento(formatoFechaSalida.format(formatoFechaEntrada.parse(fechaNacimiento)));
                        _objDetalleUsuario.setDireccionUsuario(direccion);
                        _objDetalleUsuario.setTelefonoFijo(telefono);
                        _objDetalleUsuario.setTelefonoMovil(celular);
                        _objUsuario.setEmailUsuario(correo);
                        _objUsuario.setEstadoUsuario(estado);
                        _objUsuario.setPassword(pass);
                        response.setContentType("application/json");
                        daoModelEstudiante = new ModelEstudiante();
                        String salida = Mensaje(daoModelEstudiante.Add(_objUsuario, _objDetalleUsuario), "El estudiante ha sido registrado", "A ocurrido un error al intentar registrar al estudiante");
                        response.getWriter().write(salida);
                    } catch (NumberFormatException | IOException e) {
                        System.out.println("Ha ocurrido un error en el Controller Estudiante" + e.getMessage());
                    } catch (ParseException ex) {
                        response.setContentType("application/json");
                        String salida = Mensaje(false, "", "A ocurrido un error con la fecha de nacimiento");
                        response.getWriter().write(salida);
                    }
                    break;
                }
                case "Consultar": {
                    String tipo = request.getParameter("id");
                    String aux = request.getParameter("tipo");
                    int id = Integer.parseInt(aux.trim());
                    try {
                        respuesta = new LinkedHashMap<>();
                        ResultSet result = daoModelEstudiante.buscarPorID(id, tipo);
                        while (result.next()) {
                            respuesta.put("tipoDocumento", result.getString("tipoDocumento"));
                            respuesta.put("numeroDocumento", result.getString("numeroDocumento"));
                            respuesta.put("fechaNacimiento", result.getString("fechaNacimiento"));
                            respuesta.put("generoCliente", result.getString("generoCliente"));
                            respuesta.put("nombreCliente", result.getString("nombreCliente"));
                            respuesta.put("apellidoCliente", result.getString("apellidoCliente"));
                            respuesta.put("direccionCliente", result.getString("direccionCliente"));
                            respuesta.put("telefonoFijo", result.getString("telefonoFijo"));
                            respuesta.put("telefonoMovil", result.getString("telefonoMovil"));
                            respuesta.put("emailCliente", result.getString("emailCliente"));
                            respuesta.put("estadoEstudiante", result.getString("estadoEstudiante"));
                            respuesta.put("tblacudiente_tipoDocumento", result.getString("tblacudiente_tipoDocumento"));
                            respuesta.put("tblacudiente_numeroDocumento", result.getString("tblacudiente_numeroDocumento"));
                        }
                        String salida = new Gson().toJson(respuesta);
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        response.getWriter().write(salida);
                    } catch (Exception e) {
                        System.err.println(e.getMessage());
                    }
                    break;
                }

                case "Editar": {
                    try {
                        String tipoDocumento = request.getParameter("ddlIdentificacion").trim();
                        int numeroIdentificacion = Integer.parseInt(request.getParameter("txtIdentificacion").trim());
                        String identificacion = tipoDocumento + numeroIdentificacion;
                        String nombre = request.getParameter("txtNombre").trim();
                        String apellido = request.getParameter("txtApellido").trim();
                        int genero = Integer.parseInt(request.getParameter("radioGenero").trim());
                        String fechaNacimiento = request.getParameter("dateFechaNacimiento").trim();
                        String direccion = request.getParameter("txtDireccion").trim();
                        String telefono = request.getParameter("txtTelefono").trim();
                        String celular = request.getParameter("txtCelular").trim();
                        String correo = request.getParameter("txtCorreo").trim();
                        int estado = Integer.parseInt(request.getParameter("radioBeneficiario").trim());
                        String pass = request.getParameter("pass").trim();
                        //Beneficiario 0->No Subvencionado 1->Subvencionado?
                        String tipoDocAcudiente = "";
                        int numeroDocAcudiente = 0;
                        if (request.getParameter("tipoDocAcudiente") != null && request.getParameter("numeroDocAcudiente") != null) {
                            tipoDocAcudiente = request.getParameter("tipoDocAcudiente").trim();
                            numeroDocAcudiente = Integer.parseInt(request.getParameter("numeroDocAcudiente").trim());
                            String identificacionAcudiente = tipoDocAcudiente + numeroDocAcudiente;
                            _objUsuario.setDocumentoAcudiente(identificacionAcudiente);
                        }
                        _objUsuario.setDocumentoUsuario(identificacion);
                        _objUsuario.setNombreUsuario(nombre);
                        _objUsuario.setApellidoUsuario(apellido);
                        _objDetalleUsuario.setGeneroUsuario(genero);
                        _objUsuario.setFechaNacimiento(formatoFechaSalida.format(formatoFechaEntrada.parse(fechaNacimiento)));
                        _objDetalleUsuario.setDireccionUsuario(direccion);
                        _objDetalleUsuario.setTelefonoFijo(telefono);
                        _objDetalleUsuario.setTelefonoMovil(celular);
                        _objUsuario.setEmailUsuario(correo);
                        _objUsuario.setEstadoUsuario(estado);
                        _objUsuario.setPassword(pass);
                        response.setContentType("application/json");
                        String salida = Mensaje(daoModelEstudiante.Edit(_objUsuario, _objDetalleUsuario), "El estudiante ha sido actualizado", "A ocurrido un error al intentar actualizar al estudiante");
                        response.getWriter().write(salida);

                    } catch (NumberFormatException | IOException e) {
                        System.out.println(e.getMessage());
                    } catch (ParseException ex) {
                        response.setContentType("application/json");
                        String salida = Mensaje(false, "", "A ocurrido un error con la fecha de nacimiento");
                        response.getWriter().write(salida);
                    }
                    break;
                }
                case "Seleccion": {
                    daoModelFicha = new ModelFicha();
                    String aux = request.getParameter("id");
                    int id = Integer.parseInt(aux.trim());
                    try {
                        respuesta = new LinkedHashMap<>();
                        ResultSet result = daoModelFicha.buscarPorID(id);
                        while (result.next()) {
                            respuesta.put("idFicha", result.getString("idFicha"));
                            respuesta.put("estado", result.getString("estado"));
                            respuesta.put("cuposDisponibles", result.getString("cuposDisponibles"));
                            respuesta.put("fechaInicio", result.getString("fechaInicio"));
                            respuesta.put("precioFicha", result.getString("precioFicha"));
                            respuesta.put("tblcurso_idCurso", result.getString("tblcurso_idCurso"));
                            String fechaFinal = result.getString("fechaInicio");
                            respuesta.put("fechaFinal", formatoFechaEntrada.format(sumarRestarDiasFecha(fechaFinal, 90)));
                        }
                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        String salida = new Gson().toJson(respuesta);
                        daoModelFicha.Signout();
                        response.getWriter().write(salida);
                    } catch (SQLException | IOException e) {
                        System.err.println("Ha ocurrido un error " + e.toString());
                    }
                    break;
                }
                case "Enlistar": {
                    response.setContentType("application/json");
                    response.getWriter().write(getTableEstudiantes());
                    break;
                }
                case "getOptionsFichas": {
                    ControllerFicha controllerFicha = new ControllerFicha();
                    response.setContentType("application/text");
                    response.getWriter().write(controllerFicha.getOptionsFichas());
                    break;
                }
            }
        }
    }

    public String getTableEstudiantes() {
        ResultSet result;
        List<String[]> lista = new ArrayList<>();
        try {
            result = daoModelEstudiante.ListAll();
            String[] arreglo;
            while (result.next()) {
                arreglo = new String[8];
                arreglo[0] = result.getString("tipoDocumento").trim();
                arreglo[1] = result.getString("numeroDocumento").trim();
                arreglo[2] = result.getString("nombreCliente").trim();
                arreglo[3] = result.getString("generoCliente").trim();
                arreglo[4] = result.getString("estadoEstudiante").trim();
                arreglo[5] = "<a class=\"btn-sm btn-success btn-block \" href=\"javascript:void(0)\"  onclick=\"estudiante.myAjax('Consultar','" + result.getString("tipoDocumento").trim() + "', " + result.getInt("numeroDocumento") + ")\">\n"
                        + "<span class=\"glyphicon glyphicon-search\"></span></a>";
                arreglo[6] = "<a class=\"btn-sm btn-primary btn-block \" href=\"javascript:void(0)\"  onclick=\"estudiante.myAjax('Consultar','" + result.getString("tipoDocumento").trim() + "', " + result.getInt("numeroDocumento") + ", 'Editar')\">\n"
                        + "<span class=\"glyphicon glyphicon-edit\"></span></a>";
                arreglo[7] = "<a class=\"btn-sm btn-primary btn-block \"  href=\"javascript:void(0)\"  onclick=\"estudiante.myAjax('Consultar','" + result.getString("tipoDocumento").trim() + "', " + result.getInt("numeroDocumento") + ", 'Matricular')\">\n"
                        + "<span class=\"glyphicon glyphicon-bookmark\"></span></a>";
                lista.add(arreglo);
            }

        } catch (Exception e) {
            System.err.println("Ha Ocurrido un error" + e.getMessage());
        } finally {
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

    public Date sumarRestarDiasFecha(String fecha, int dias) {
        Date salida = null;
        try {

            Calendar calendar = Calendar.getInstance();
            calendar.setTime(formatoFechaEntrada.parse(fecha));
            calendar.add(Calendar.DAY_OF_YEAR, dias);
            salida = new Date(calendar.getTime().getTime());
        } catch (ParseException ex) {
            Logger.getLogger(ControllerEstudiante.class.getName()).log(Level.SEVERE, null, ex);
        }
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
