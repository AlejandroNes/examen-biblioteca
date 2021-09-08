<%-- 
    Document   : registrarprov
    Created on : 15-jun-2021, 14:13:29
    Author     : Elementrix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro Materiales</title>
    </head>
    <body>
        <jsp:useBean id="productos" scope="session" class="com.test.bean.ProductoBean"/>
        <%
            if (request.getParameter("guardar") != null) {
                String mensaje = productos.registrarproductos(request);
                out.print(mensaje);
            }
        %>
        <h1>Registrar Materiales</h1>
        <form method="POST">
            <table border="1">
                <thead>
                    <tr>
                        <th colspan="2"> REGISTRAR CATEGORIA</th>

                    </tr>
                </thead>
                <tbody> 
                    <tr>
                        <td>NOMBRE DEL PROVEEDOR </td>
                        <td><input type="text" name="prove" value="" /></td>
                    </tr>
                    <tr>
                        <td>NOMBRE DEL PRODUCTO </td>
                        <td><input type="text" name="nombre" value="" /></td>
                    </tr>
                    <tr>
                        <td>PRECIO UNITARIO:</td>
                        <td><input type="number" name="p_u" value="" /></td>
                    </tr>
                    <tr>
                        <td>FECHA VENCIMIENTO</td>
                        <td><input type="date" name="f_v" value="" /></td>
                    </tr>
                    <tr>
                        <td>TIPO PRODUCTO</td>
                        <td><input type="text" name="t_p" value="" /></td>
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