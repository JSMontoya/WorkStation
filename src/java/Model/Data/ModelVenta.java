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
import Model.DTO.ObjVenta;
import Model.DTO.ObjDetalleMovimiento;
import Model.DTO.ObjUsuario;
import java.util.List;

/**
 *
 * @author lorenzo
 */
public class ModelVenta extends ConnectionDB {

    private PreparedStatement pStmt;

    public ModelVenta() {
        getConnection();
    }

    public boolean Add(ObjVenta _objVenta, ObjUsuario _objUsuario, List<ObjDetalleMovimiento> _listObjDetalleMovimientos) {
        boolean objReturn = false;
        String sql1 = "call spIngresarVenta (?,?,?,?)";
        String sql2 = "call spIngresarDetalleVenta (?,?,?,?,?,)";

        try {
            getStmt();
            connection.setAutoCommit(false);
            pStmt = connection.prepareCall(sql1);
            pStmt.setString(1, _objVenta.getDocumentoCliente());
            pStmt.setString(2, _objVenta.getNombreCliente());
            pStmt.setString(3, _objVenta.getFechaVenta());
            pStmt.setInt(4, _objVenta.getTotalVenta());

            int updadeCount = pStmt.executeUpdate();
            if (updadeCount > 0) {
                objReturn = true;
                pStmt = connection.prepareCall(sql2);
                for (ObjDetalleMovimiento _objDetalle : _listObjDetalleMovimientos) {
                    pStmt.setInt(1, _objDetalle.getIdArticulo());
                    pStmt.setInt(2, _objDetalle.getCantidad());
                    pStmt.setInt(3, _objDetalle.getDescuento());
                    pStmt.setInt(4, _objDetalle.getTotalDetalleMovimiento());
                    pStmt.setInt(5, _objDetalle.getPrecioArticulo());
                    if (pStmt.executeUpdate() > 0) {
                        objReturn = true;
                    } else {
                        connection.rollback();
                    }
                }
            } else {
                connection.rollback();
            }
            connection.commit();
        } catch (SQLException sqlE) {
            System.out.println(sqlE.getMessage());
            try {
                connection.rollback();
            } catch (Exception e) {
                System.out.println(sqlE.getMessage());
            }
        }
        return objReturn;
    }
}
