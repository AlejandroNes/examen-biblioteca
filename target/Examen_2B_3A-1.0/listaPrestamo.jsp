<%-- 
    Document   : listaCategoria
    Created on : 01-06-2021, 08:39:55 PM
    Author     : nes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca Municipal</title
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    </head>
    <style>
        table{
            border:  1px solid #0984e3;
        }
        th{
             border:  1px solid #0984e3;
        }
        td{
            border:  1px solid #0984e3;
        }
        </style>
    <body>
        <jsp:useBean id="PrestamoBean" scope="session" class="com.test.bean.PrestamoBean"/>
        <h1>Lista Prestamos</h1>
        <table class="table table-bordered table-secondary">
            <thead >
                <tr >
                    <th> LIBRO </th>
                    <th> AUTOR </th>
                    <th> CI USUARIO </th>
                    <th> USUARIO </th>
                    <th> FECHA DE PRESTAMO </th>
                    <th> FECHA DE DEVOLUCION </th>
                    <th> MODIFICAR </th>
                    <th> ELIMINAR </th>  
                </tr>
            </thead>
            <tbody>
               <%=PrestamoBean.listarPrestamos()%>
            </tbody>
        </table>
            <a href="index.jsp"> MENU INICIO </a>
    </body>
</html>
