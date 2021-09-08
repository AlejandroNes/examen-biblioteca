/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.bean;

import com.test.conexion.VariablesConexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.annotation.PreDestroy;

/**
 *
 * @author SmartUrban2025
 */
public class UsuarioBean {
    private Connection con;
    private VariablesConexion var;
    public UsuarioBean() throws SQLException{
        var = new VariablesConexion();
        var.inicioConexion();
        con = var.getConnection();
        System.out.println("Iniciando la Conexion...!!! ");
    }
    
    @PreDestroy
    public void cerrarConexion(){
        var.cerrarConexion();
    }
    public String buscarUser(String user){
        StringBuilder salidaTabla=new StringBuilder();
        StringBuilder query=new StringBuilder();
        query.append(" SELECT e.ci,  CONCAT(e.nombre,' ', e.paterno, ' ', e.materno) AS nombre, u.usuario, c.cargo, u.nivel FROM usuarios u INNER JOIN empleado e ON u.id_empleado = e.id_empleado INNER JOIN cargo c ON c.id_cargo = e.id_cargo WHERE c.cargo =  ");
        query.append("'"+user+"'");
        try {
            PreparedStatement pst=con.prepareStatement(query.toString());
            ResultSet resultado=pst.executeQuery();
            while(resultado.next()){
                salidaTabla.append("<tr>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getInt(1));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(2));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(3));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(4));
                salidaTabla.append("</td>");
                salidaTabla.append("</tr>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        return salidaTabla.toString();
    }
    
    /*
    
    private VariablesConexion variable;
    private Connection connection;
    public UsuarioBean() throws SQLException {
        variable = new VariablesConexion();
        variable.inicioConexion();
        connection = variable.getConnection();
        System.out.println("Iniciando la conexion");
    }

    @PreDestroy
    public void cerrarConexion() {
        variable.cerrarConexion();
    }
    
    public String listarUsuario(){
        StringBuilder salida= new StringBuilder();
        StringBuilder query = new StringBuilder();
        query.append(" select c.id_cargo, c.cargo from cargo c ");
        try {
            PreparedStatement pst = connection.prepareStatement(query.toString());
            ResultSet resultado = pst.executeQuery();
            while (resultado.next()) {           
                salida.append("<option value='");
                salida.append(resultado.getInt(1));
                salida.append("'>");
                salida.append(resultado.getString(2));
                salida.append("</option>");
            }
            System.out.println("EXITO");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error de Conexion!");
        }
        return salida.toString();
    }
    public String listarUsuarioRol(String codigorol) {
        StringBuilder salidaTabla = new StringBuilder();
        StringBuilder query = new StringBuilder();
        query.append(" select u.id_usuario, c.cargo , u.nombre, u.apellidos, u.mail, u.direccion, u.fechanacimiento, u.telefono");
        query.append(" from usuario u ");
        query.append(" inner join cargo c on u.cargo_id_cargo = c.id_cargo ");
        query.append(" where c.id_cargo = ? ");
        try {
            PreparedStatement pst = connection.prepareStatement(query.toString());
        
            pst.setInt(1,Integer.parseInt (codigorol));
            ResultSet resultado = pst.executeQuery();
            while (resultado.next()) {
                salidaTabla.append("<tr>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getInt(1));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(2));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(3));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(4));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(5));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(6));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getDate(7));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getInt(8));
                salidaTabla.append("</td>");
                salidaTabla.append("</tr>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        return salidaTabla.toString();
    }     */
}
