<%-- 
    Document   : registrarCategoria
    Created on : 26-05-2021, 07:30:10 PM
    Author     : nes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Prestamo</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    </head>
    <body>
        <jsp:useBean id="PrestamoBean" scope="session" class="com.test.bean.PrestamoBean"/>
        <%
            if(request.getParameter("guardar")!=null){
                String cod_libro = request.getParameter("cod_libro");
                String cedula_usr = request.getParameter("cedula_usr");
                String fecha_pres = request.getParameter("fecha_pres");
                String fecha_dev = request.getParameter("fecha_dev");
                String mensaje=PrestamoBean.RegistrarPrestamo(cod_libro,cedula_usr,fecha_pres,fecha_dev);
                out.print(mensaje);
            }
        %>
        <h1> PRESTAMO </h1>
        <form method="POST" >
            <table border="1" class="table table-primary table-bordered">
                <thead>
                    <tr>
                        <th colspan="2"> REGISTRAR PRESTAMO </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td> LIBRO </td>
                        <td><select class="form-control" name="cod_libro">
                                <%=PrestamoBean.listarLibros()
                                    %>
                            </select></td>
                    </tr>
                    <tr>
                        <td> CEDULA DE USUARIO </td>
                        <td><select class="form-control" name="cedula_usr">
                                <%=PrestamoBean.listarUsuario()
                                    %>
                            </select></td>
                    </tr>
                    <tr>
                        <td> FECHA DE PRESTAMO </td>
                        <td><input class="form-control" type="date" name="fecha_pres" value="" /></td>
                    </tr>
                    <tr>
                        <td> FECHA DE DEVOLUCION </td>
                        <td><input class="form-control" type="date" name="fecha_dev" value="" /></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input class="btn btn-block btn-info" type="submit" value="REGISTRAR" name="guardar" /></td>
                       
                    </tr>
                </tbody>
            </table>

        </form>
        <a href="index.jsp">INICIO</a>
        
    </body>
</html>