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
 * @author SmartUrban2025
 */
public class LibroBean {
    private Connection connection;
    private PreparedStatement insertLibros;
    private VariablesConexion variable;
    public LibroBean()throws SQLException{
        variable=new VariablesConexion();
        variable.inicioConexion();
        connection=variable.getConnection();
        System.out.println("Iniciando la conexion");
    }
 
     @PreDestroy
    public void cerrarConexion(){
        variable.cerrarConexion();
    }
    public String RegistrarLibro(String nombre, String titulo, String ed, String ne){
        String mensaje="";
        if(connection!=null){
            try {
                StringBuilder query=new StringBuilder();
                query.append(" insert into libro ");
                query.append(" values (?,?,?,?,?)");
                if(insertLibros==null){
                    insertLibros=connection.prepareStatement(query.toString());
                }          
                insertLibros.setString(1,null);
                insertLibros.setString(2,nombre);
                insertLibros.setString(3,titulo);
                insertLibros.setString(4,ed);
                insertLibros.setString(5,ne);
                mensaje=insertLibros.toString();
                int registro=insertLibros.executeUpdate();
                if(registro==1){
                    mensaje=" Registrado con exito... ";
                }else{
                    mensaje=" Error al realizar el registro!!! ";
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return mensaje;
     }
    
    public String listaLibro(){
        StringBuilder salidaTabla=new StringBuilder();
        StringBuilder query=new StringBuilder();
        query.append("SELECT l.cod_libro, CONCAT(a.nombre, ' ', a.paterno, ' ', a.materno) AS nombre, l.titulo, l.edicion, l.nroejemplar FROM libro l INNER JOIN autor a ON a.cod_autor = l.cod_autor");
        try {
            PreparedStatement pst=connection.prepareStatement(query.toString());
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
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(5));
                salidaTabla.append("</td>");                
                salidaTabla.append("</tr>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error de conexion");
        }
        return salidaTabla.toString();
    }
    
    public String lista_libro_autor(String aut){
        StringBuilder salidaTabla=new StringBuilder();
        StringBuilder query=new StringBuilder();
        query.append("SELECT l.cod_libro, CONCAT(a.nombre, ' ', a.paterno, ' ', a.materno) AS nombre, l.titulo, l.edicion, l.nroejemplar FROM libro l INNER JOIN autor a ON a.cod_autor = l.cod_autor WHERE paterno=  ");
        query.append("'"+aut+"'");

        try {
            PreparedStatement pst=connection.prepareStatement(query.toString());
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
                salidaTabla.append("<td>");
                salidaTabla.append(resultado.getString(5));
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