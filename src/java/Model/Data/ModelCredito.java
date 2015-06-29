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
import Model.DTO.ObjCredito;
import Model.DTO.ObjMovimiento;

/**
 *
 * @author David
 */
public class ModelCredito extends ConnectionDB {

    private PreparedStatement pStmt;

    public ModelCredito() {
        getConnection();
    }

    public boolean Add(ObjCredito _objCredito, ObjMovimiento _objMovimiento) {
        boolean objReturn = false;
        String sql = "call spIngresarCredito(?,?,?)";
        try {
            getStmt();
            connection.setAutoCommit(false);
            pStmt = connection.prepareCall(sql);
            pStmt.setString(1, _objCredito.getDocumentoUsuario());
            pStmt.setDouble(2, _objCredito.getSaldoInicial());
            pStmt.setDouble(3, _objCredito.getSaldoActual());

            ResultSet rs = pStmt.executeQuery();

            String[] resultado = new String[2];
            if (rs.next()) {
                resultado[0] = rs.getString("Respuesta");
                resultado[1] = rs.getString("tipo");
                System.out.println(resultado[0]+" Tipo: "+ resultado[1]);
            }
            if (resultado[1].equals("success")) {
                objReturn = true;
                String sql2 = "call spIngresarMovimientoCredito(?,?,?)";
                pStmt = connection.prepareCall(sql2);
                pStmt.setDouble(1, _objCredito.getSaldoInicial() - _objCredito.getSaldoActual());
                pStmt.setString(2, _objMovimiento.getDocumentoUsuario());
                pStmt.setString(3, _objMovimiento.getDocumentoAuxiliar());
                int updateCount2 = pStmt.executeUpdate();
                if (updateCount2 > 0) {
                    objReturn = true;
                    String sql3 = "call spIngresarDetalleMovimientoCredito(?)";
                    pStmt = connection.prepareCall(sql3);
                    pStmt.setString(1, _objCredito.getDocumentoUsuario());
                    int updateCount3 = pStmt.executeUpdate();
                    if (updateCount3 > 0) {
                        String sql4 = "call spIngresarDetalleCredito()";
                        pStmt = connection.prepareCall(sql4);
                        int updateCount4 = pStmt.executeUpdate();
                        if (updateCount4 > 0) {
                            connection.commit();
                            return true;
                        }
                    }
                }
            }
            connection.rollback();
            return false;

        } catch (SQLException e) {
            System.err.println(e.getMessage());
            for (StackTraceElement throwable : e.getStackTrace()) {
                System.err.println(throwable);
            };
        }
        return objReturn;
    }

    public ResultSet buscarCreditoByID(int idCredito) {
        ResultSet rs = null;
        String sql = "call spConsultarCreditoByID(?)";
        try {
            getStmt();
            pStmt = connection.prepareCall(sql);
            pStmt.setInt(1, idCredito);
            rs = pStmt.executeQuery();

        } catch (SQLException e) {
            System.err.println("SQLException:" + e.getMessage());
        }
        return rs;
    }

    public ResultSet buscarCreditoByDocumento(String documentoUsuario) {
        ResultSet rs = null;
        String sql = "call spConsultarCreditoByDocumento(?)";
        try {
            getStmt();
            pStmt = connection.prepareCall(sql);
            pStmt.setString(1, documentoUsuario);
            rs = pStmt.executeQuery();

        } catch (SQLException e) {
            System.err.println("SQLException:" + e.getMessage());
        }
        return rs;
    }

    public boolean cambiarEstadoCredito(ObjCredito _objCredito) {
        boolean objReturn = false;
        String sql = "call spActualizarEstadoCredito(?,?)";

        try {
            getStmt();
            pStmt = connection.prepareCall(sql);
            pStmt.setInt(1, _objCredito.getIdCredito());
            pStmt.setInt(2, _objCredito.getEstadoCredito());

            int updateCount = pStmt.executeUpdate();
            if (updateCount > 0) {
                objReturn = true;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return objReturn;
    }

    public boolean Update(ObjCredito _objCredito) {
        boolean objReturn = false;
        String sql = "call spActualizarCredito(?,?)";

        try {
            getStmt();
            pStmt = connection.prepareCall(sql);
            pStmt.setInt(1, _objCredito.getIdCredito());
            pStmt.setDouble(2, _objCredito.getSaldoActual());

            int updateCount = pStmt.executeUpdate();
            if (updateCount > 0) {
                objReturn = true;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return objReturn;
    }

    public boolean cambiarEstado(ObjCredito _objCredito) {
        boolean objReturn = false;
        String sql = "call spActualizarEstadoCredito(?,?)";

        try {
            getStmt();
            pStmt = connection.prepareCall(sql);
            pStmt.setInt(1, _objCredito.getIdCredito());
            pStmt.setInt(2, _objCredito.getEstadoCredito());

            int updateCount = pStmt.executeUpdate();
            if (updateCount > 0) {
                objReturn = true;
            }

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return objReturn;
    }

    public ResultSet ListAll() throws Exception {
        ResultSet rs = null;
        String sql = "call spListarCreditos()";
        try {
            getStmt();
            rs = stmt.executeQuery(sql);

        } catch (SQLException e) {
            System.err.println("SQLException:" + e.getMessage());
        }
        return rs;
    }

}
