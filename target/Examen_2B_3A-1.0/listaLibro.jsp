<%-- 
    Document   : listaCategoria
    Created on : 01-06-2021, 08:39:55 PM
    Author     : Elementrix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca Municipal</title>
    </head>
    <body>
        <jsp:useBean id="LibroBean" scope="session" class="com.test.bean.LibroBean"/>
        <h1>Lista de Libros</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>COD_LIBRO</th>
                    <th>AUTOR</th>
                    <th>TITULO</th>
                    <th>EDICION</th>
                    <th>NUMERO DE EJEMPLAR</th>                    
                </tr>
            </thead>
            <tbody>
               <%=LibroBean.listaLibro()%>
            </tbody>
        </table>
            <a href="index.jsp"> MENU INICIO </a>
    </body>
</html>
