/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Data;

import Model.DTO.ObjCliente;
import Model.JDBC.ConnectionDB;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrador
 */
public class ModelCliente extends ConnectionDB {

    private PreparedStatement pStmt;

    public ModelCliente() {
        getConnection();
    }

    public boolean Add(ObjCliente _objCliente) {
        boolean objReturn = false;
        String sql = "call spIngresarCliente (?,?,?,?,?,?,?,?,?,?,?,?,?)";
        try {
            getStmt();
            pStmt = connection.prepareCall(sql);
            pStmt.setString(1, _objCliente.getIdCliente());
            pStmt.setInt(2, _objCliente.getTipoCliente());
            pStmt.setString(3, _objCliente.getTipoDocumento());
            pStmt.setInt(4, _objCliente.getNumeroDocumento());
            pStmt.setDate(5, Date.valueOf(_objCliente.getFechaNacimiento()));
            pStmt.setInt(6, _objCliente.getGeneroCliente());
            pStmt.setString(7, _objCliente.getNombreCliente());
            pStmt.setString(8, _objCliente.getApellidoCliente());
            pStmt.setString(9, _objCliente.getDireccionCliente());
            pStmt.setString(10, _objCliente.getTelefonoFijo());
            pStmt.setString(11, _objCliente.getTelefonoMovil());
            pStmt.setString(12, _objCliente.getEmailCliente());
            pStmt.setInt(13, _objCliente.getIdAcudiante());

            int updateCount = pStmt.executeUpdate();
            if (updateCount > 0) {
                objReturn = true;
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return objReturn;
    }
    
    

    public ResultSet ListAll() throws Exception {

        ResultSet rs = null;
        String sql = "SELECT `idCliente`, `tipoCliente`,"
                + " `tipoDocumento`, `numeroDocumento`,"
                + " `fechaNacimiento`, `nombreCliente`,"
                + " `apellidoCliente`, `direccionCliente`,"
                + " `telefonoFijo`, `telefonoMovil`,"
                + " `emailCliente`, `estadoEstudiante`,"
                + " `idAcudiente`, `generoCliente` "
                + "FROM `tblcliente`";
        try {
            getStmt();
            rs = stmt.executeQuery(sql);

        } catch (SQLException e) {
            System.err.println("SQLException:" + e.getMessage());
        }

        return rs;
    }

    public ResultSet Find(ObjCliente _objCliente) throws Exception {

        ResultSet rs = null;
        String query = "SELECT\n"
                + "IdArea,\n"
                + "Descripcion,\n"
                + "case Estado when 1 then 'Activo' when 0 then 'Inactivo' end as Estado\n"
                + "FROM tbl_area"
                + "WHERE IdArea = %s"
                + "AND Descripcion = '%s'";
        String sql = String.format(query, _objCliente.getIdCliente(), _objCliente.getTipoDocumento());
        try {
            getStmt();
            rs = stmt.executeQuery(sql);

        } catch (SQLException e) {
            System.err.println("SQLException:" + e.getMessage());
        }

        return rs;
    }

    public List<ObjCliente> getListAll() throws Exception {
        List<ObjCliente> clientes = new ArrayList<ObjCliente>();

        String sql = "SELECT * FROM tbl_area";
        try {
            getStmt();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                ObjCliente cliente = new ObjCliente();
                cliente.setIdAcudiante(rs.getInt("idArea"));
                cliente.setTipoDocumento(rs.getString("Descripcion"));
                cliente.setNumeroDocumento(rs.getInt("numeroDocumento"));
                clientes.add(cliente);
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
        }

        return clientes;
    }
}
