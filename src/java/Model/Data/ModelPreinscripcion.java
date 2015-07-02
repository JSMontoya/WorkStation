/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Data;

import Model.JDBC.ConnectionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Administrador
 */
public class ModelPreinscripcion extends ConnectionDB {

    private PreparedStatement pStmt;

    public ModelPreinscripcion() {
        getConnection();
    }

    public String[] Add(int idCurso, String documentoUsuario) {
        String[] objReturn = new String[2];
        String sql = "call spIngresarPreinscripcion(?,?)";

        try {
            getStmt();
            pStmt = connection.prepareCall(sql);
            pStmt.setString(1, documentoUsuario);
            pStmt.setInt(2, idCurso);
            ResultSet result = pStmt.executeQuery();
            while (result.next()) {
                objReturn[0]= result.getString("mensaje");
                objReturn[1]= result.getString("tipo");
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return objReturn;
    }

    public boolean cambiarEstado(String documentoUsuario, int idCurso) {
        boolean objReturn = false;
        String sql = "call spActualizarEstadoPreincripcion(?,?)";

        try {
            getStmt();
            pStmt = connection.prepareCall(sql);
            pStmt.setString(1, documentoUsuario);
            pStmt.setInt(2, idCurso);

            int updateCount = pStmt.executeUpdate();
            if (updateCount > 0) {
                objReturn = true;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return objReturn;
    }

    public ResultSet ListPreincripcionesActivas() {
        ResultSet rs = null;
        String sql = "call spConsultarPreinscripcionesActivas()";
        try {
            getStmt();
            pStmt = connection.prepareCall(sql);
            rs = pStmt.executeQuery();

        } catch (SQLException e) {
            System.err.println("SQLException:" + e.getMessage());
        }
        return rs;
    }

    public ResultSet ListAll() throws Exception {
        ResultSet rs = null;
        String sql = "call spConsultarPreincripciones()";
        try {
            getStmt();
            rs = stmt.executeQuery(sql);

        } catch (SQLException e) {
            System.err.println("SQLException:" + e.getMessage());
        }
        return rs;
    }
    
    public ResultSet ConsultarPreinscripcionesPorID(String documentoCliente) throws Exception {
        ResultSet rs = null;
        String sql = "call spConsultarPreinscritoPorID(?)";
        try {
            getStmt();
            pStmt = connection.prepareCall(sql);
            pStmt.setString(1, documentoCliente);
            rs = pStmt.executeQuery();
        } catch (SQLException e) {
            System.err.println("SQLException:" + e.getMessage());
        }
        return rs;
    }
}
