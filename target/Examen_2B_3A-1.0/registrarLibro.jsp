<%-- 
    Document   : registrarLibro
    Created on : 15-jun-2021, 14:13:29
    Author     : Elementrix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> REGISTRO DE LIBROS </title>
    </head>
    <body>
        <jsp:useBean id="LibroBean" scope="session" class="com.test.bean.LibroBean"/>
        <%
            if (request.getParameter("guardar") != null) {
                String nom = request.getParameter("autor");
                String titulo = request.getParameter("titulo");
                String edicion = request.getParameter("ed");
                String nro = request.getParameter("ne");
                String mensaje = LibroBean.RegistrarLibro(nom,titulo,edicion,nro);
                out.print(mensaje);
            }
        %>
        <h1> REGISTRAR LIBRO </h1>
        <form method="POST">
            <table border="1">
                <thead>
                    <tr>
                        <th colspan="2"> REGISTRAR LIBRO</th>
                    </tr>
                </thead>
                <tbody> 
                    <tr>
                        <td> NOMBRE DEL AUTOR </td>
                        <td><input type="text" name="autor" value="" /></td>
                    </tr>
                    <tr>
                        <td> TITULO DEL LIBRO </td>
                        <td><input type="text" name="titulo" value="" /></td>
                    </tr>
                    <tr>
                        <td> EDICION </td>
                        <td><input type="number" name="ed" value="" /></td>
                    </tr>
                    <tr>
                        <td> NUMERO DE EJEMPLARES</td>
                        <td><input type="number" name="ne" value="" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="guardar" name="guardar" /></td>

                    </tr>
                </tbody>
            </table>

        </form>
        <a href="index.jsp">INICIO</a>
    </body>
</html>