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
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author nes
 */
public class PrestamoBean {
    private Connection connection;
    private PreparedStatement insertPrestamo;
    private VariablesConexion variable;
    public PrestamoBean()throws SQLException{
        variable=new VariablesConexion();
        variable.inicioConexion();
        connection=variable.getConnection();
        System.out.println("Iniciando la conexion");
    }
   
     @PreDestroy
    public void cerrarConexion(){
        variable.cerrarConexion();
    }
    public String RegistrarPrestamo(String cod_libro, String cedula_usr, String fecha_pres, String fecha_dev){
        String mensaje="";

        if(connection!=null){
            try {
                StringBuilder query=new StringBuilder();
                query.append(" insert into prestamo ");
                query.append(" values (?,?,?,?,?)");
                if(insertPrestamo==null){
                    insertPrestamo=connection.prepareStatement(query.toString());
                }                
                int cl=Integer.parseInt(cod_libro);
                int ci=Integer.parseInt(cedula_usr);
                insertPrestamo.setString(1,null);
                insertPrestamo.setString(2,cod_libro);
                insertPrestamo.setString(3,cedula_usr);
                insertPrestamo.setString(4,fecha_pres);
                insertPrestamo.setString(5,fecha_dev);
                mensaje=insertPrestamo.toString();
                int registro=insertPrestamo.executeUpdate();
                StringBuilder queryLibro=new StringBuilder();
                queryLibro.append("SELECT * FROM libro");
                queryLibro.append("UPDATE libro SET nroejemplar=nroejemplar -1 WHERE cod_libro = "+cl+"");
                if(registro==1){
                    mensaje="Registro realizado con exito";
                }else{
                    mensaje="Error al insertar el registro";
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return mensaje;
     }
    
    public String listarLibros(){
        StringBuilder salida= new StringBuilder();
        StringBuilder query = new StringBuilder();
        query.append(" select l.cod_libro, l.titulo, l.cod_autor, a.cod_autor, a.paterno, a.materno, a.nombre ");
        query.append(" from libro l inner join autor a on l.cod_autor = a.cod_autor");
        try {
            PreparedStatement pst = connection.prepareStatement(query.toString());
            ResultSet resultado = pst.executeQuery();
            while (resultado.next()) {           
                salida.append("<option value='");
                salida.append(resultado.getInt(1));
                salida.append("'>");
                salida.append(resultado.getString(2));
                salida.append(" -> ");
                salida.append(resultado.getString(5));
                salida.append(" ");
                salida.append(resultado.getString(6));
                salida.append(" ");
                salida.append(resultado.getString(7));
                salida.append("</option>");
            }
            System.out.println("EXITO");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error de Conexion!");
        }
        return salida.toString();
    }
    
    public String listarUsuario(){
        StringBuilder salida= new StringBuilder();
        StringBuilder query = new StringBuilder();
        query.append(" select u.cedula_usr, u.paterno_usr, u.materno_usr, u.nombre_usr from usuario u ");
        try {
            PreparedStatement pst = connection.prepareStatement(query.toString());
            ResultSet resultado = pst.executeQuery();
            while (resultado.next()) {           
                salida.append("<option value='");
                salida.append(resultado.getInt(1));
                salida.append("'>");
                salida.append(resultado.getString(2));
                salida.append(" ");
                salida.append(resultado.getString(3));
                salida.append(" ");
                salida.append(resultado.getString(4));
                salida.append("</option>");
            }
            System.out.println("EXITO");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error de Conexion!");
        }
        return salida.toString();
    }
    
    public String listarPrestamos(){
        StringBuilder salidaTabla=new StringBuilder();
        StringBuilder query=new StringBuilder();
        query.append("SELECT p.cod_prestamo, l.titulo, l.cod_autor, CONCAT(a.nombre, ' ', a.paterno, ' ', a.materno), p.cedula_usr, CONCAT(u.nombre_usr, ' ', u.paterno_usr, ' ', u.materno_usr), p.fecha_prestamo, p.fecha_devolucion FROM prestamo p INNER JOIN libro l ON p.cod_libro = l.cod_libro INNER JOIN autor a ON l.cod_autor = a.cod_autor INNER JOIN usuario u ON p.cedula_usr = u.cedula_usr");
        try {
            PreparedStatement pst=connection.prepareStatement(query.toString());
            ResultSet resultado=pst.executeQuery();
            while(resultado.next()){
                salidaTabla.append("<tr>");
                /*salidaTabla.append("<td>");
                salidaTabla.append(resultado.getInt(1));
                salidaTabla.append("</td>");*/
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(2));
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
                salidaTabla.append(resultado.getString(7));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(8));
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append("<a href=modificar_pres.jsp?cod=").append(resultado.getInt(1)).append(" class= 'button' >Modificar</a>");          
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append("<a href='listaPrestamo.jsp?cod=").append(resultado.getInt(1)).append("'onclick='return confirmarEliminacion();'>Eliminar</a>");
                salidaTabla.append("</td>");
                salidaTabla.append("</tr>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        return salidaTabla.toString();
    }
    
}