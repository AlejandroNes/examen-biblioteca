/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.test.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author SmartUrban2025
 */

public class VariablesConexion {
    public static String URL_BBDD="jdbc:mysql://localhost:3306/examen?zeroDateTimeBehavior=convertToNull";
    public static String DRIVER_BBDD="com.mysql.cj.jdbc.Driver";
    public static String USUARIO_BBDD="root";
    public static String PASSWORD_BBDD="";
    
    private Connection connection;
    public void inicioConexion()throws SQLException{
        try {
            Class.forName(DRIVER_BBDD);
            connection=DriverManager.getConnection(URL_BBDD, USUARIO_BBDD, PASSWORD_BBDD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }catch(SQLException ex){
            ex.printStackTrace();
        }
    }
    public void cerrarConexion(){
        if(connection!=null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConnection(Connection connection) {
        this.connection = connection;
    } 
}