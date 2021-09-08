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
public class AutorBean {
    private Connection con;
    private PreparedStatement insertprov;
    private VariablesConexion var;
    private PreparedStatement deleteAutor;
    public AutorBean() throws SQLException{
        var = new VariablesConexion();
        var.inicioConexion();
        con = var.getConnection();
        System.out.println("Iniciando la Conexion...!!! ");
    }
    
    @PreDestroy
    public void cerrarConexion(){
        var.cerrarConexion();
    }
    public String listarAutores(){
        StringBuilder salidaTabla=new StringBuilder();
        StringBuilder query=new StringBuilder();
        query.append(" SELECT * FROM autor");
        try {
            PreparedStatement pst=con.prepareStatement(query.toString());
            ResultSet resultado=pst.executeQuery();
            while(resultado.next()){
                salidaTabla.append("<tr>");
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
                salidaTabla.append("<a href=modificar_autor.jsp?cod=").append(resultado.getInt(1)).append(" class= 'button' >Modificar</a>");          
                salidaTabla.append("</td>");
                salidaTabla.append("<td>");
                salidaTabla.append("<a href='eliminarautor.jsp?cod=").append(resultado.getInt(1)).append("'onclick='return eliminarAutor();'>Eliminar</a>");
                salidaTabla.append("</td>");
                salidaTabla.append("</tr>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        return salidaTabla.toString();
    }
    
    public String eliminarAutor(HttpServletRequest request, String cod_autor){
         String salida="";
         if (request==null) {
             return "";
         }
         if (con!=null && cod_autor!=null && cod_autor.length()>0){
            try {
             StringBuilder query= new StringBuilder();
             query.append("delete from autor where cod_autor=?");
             deleteAutor=con.prepareStatement(query.toString());  
             deleteAutor.setInt(1, Integer.parseInt(cod_autor));
             int nroRegistros=deleteAutor.executeUpdate();
                if (nroRegistros==1) {
                    salida="Autor eliminado correctamente";   
                }else{
                    salida="No se pudo borrar :(";
                }
         } catch (SQLException e) {
                System.out.println("Error en el proceso");
                e.printStackTrace();           
            } 
         }
            return salida;
     }

    public PreparedStatement getDeleteAutor() {
        return deleteAutor;
    }

    public void setDeleteAutor(PreparedStatement deleteAutor) {
        this.deleteAutor = deleteAutor;
    }
}
