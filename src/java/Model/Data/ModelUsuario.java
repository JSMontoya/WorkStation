/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.Data;

import Model.DTO.ObjUsuario;
import Model.JDBC.ConnectionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Administrador
 */
public class ModelUsuario extends ConnectionDB {

    private PreparedStatement pStmt;

    public ModelUsuario() {
        getConnection();
    }

    public boolean Add(ObjUsuario _objUsuario) {
        boolean objReturn = false;
        String sql = "INSERT INTO `tblusuario`(`nombreUsuario`, `password`, `email`, `telefono`, `idrol`) VALUES (?,?,?,?,?)";
        try {
            pStmt = connection.prepareStatement(sql);
            pStmt.setString(1, _objUsuario.getNombre());
            pStmt.setString(2, _objUsuario.getPassword());
            pStmt.setString(3, _objUsuario.getEmail());
            pStmt.setInt(5, _objUsuario.getTelefono());
            pStmt.setInt(5, _objUsuario.getRol());
            
            int updateCount = pStmt.executeUpdate();
            if (updateCount>0) {
                objReturn= true;
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return objReturn;
    }
    
    public ResultSet ListAll() throws Exception{
        ResultSet rs= null;
        String sql = "SELECT `idUsuario`, `nombreUsuario`, `password`, `email`, `telefono`, `idrol` FROM `tblusuario`";
        try {
            getStmt();
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            System.err.println("SQLException: "+e.getMessage());
        }
        return rs;
    }
    
    //Busca el usuario en la base de datos segun su nombre  de usuario y contraseña
    public ResultSet Find (ObjUsuario _objUsuario){
    ResultSet rs = null;
    String query = "SELECT `idUsuario`, `nombreUsuario`, `password`, `email`, `telefono`, `idrol` FROM `tblusuario` WHERE `nombreUsuario` = '%s' and `password` = '%s'";
    String sql = String.format(query, _objUsuario.getNombre(), _objUsuario.getPassword());
        try {
            getStmt();
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            System.err.println("SQLException: "+e.getMessage());
        }
        return  rs;
    }
    
    
}
