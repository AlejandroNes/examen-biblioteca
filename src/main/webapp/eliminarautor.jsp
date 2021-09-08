<%-- 
    Document   : registrarCategoria
    Created on : 26-05-2021, 07:30:10 PM
    Author     : Elementrix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Prestamo</title>
    </head>
    <body>
        <h1>Confirmar Eliminacion</h1>
        <jsp:useBean id="AutorBean" scope="session" class="com.test.bean.AutorBean"/>
        <%
            String codAutor=request.getParameter("cod");
            out.print(codAutor);
            if(request.getParameter("guardar")!=null){
                String cod_autor = request.getParameter("cod_autor");
                String mensaje=AutorBean.eliminarAutor(cod_autor);
                out.print(mensaje);
            }
        %>
        
        <form method="POST">
                <table border="2">
                    <thead>
                        <tr>
                            <th colspan="2">DATOS A MODIFICAR</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Codigo del Autor</td>
                            <td><input type="text" name="cod_autor" value="<%= prov.getProvMod().getId_pro()%>" /></td>
                        </tr>
                        <tr>
                            <td>Apellido Paterno</td>
                            <td><input type="text" name="paterno" value="<%= prov.getProvMod().getEmp() %>" /></td>
                        </tr>
                        <tr>
                            <td>Apellido Materno</td>
                            <td><input type="text" name="materno" value="<%= prov.getProvMod().getCon() %>" /></td>
                        </tr>
                        <tr>
                            <td>Nombre</td>
                            <td><input type="text" name="nomnbre" value="<%= prov.getProvMod().getMail() %>" /></td>
                        </tr>
                        <tr>
                            <td>Nacionalidad</td>
                            <td><input type="text" name="nacionalidad" value="<%= prov.getProvMod().getMail() %>" /></td>
                        </tr>
                        <tr>
                   <td colspan="2"><input type="submit" value="Eliminar" name="CONFIRMAR ELIMINACION" /></td>
                        </tr>
                    </tbody>
                </table>
                <a href="listaAutor.jsp"> Lista actual </a><br>
            </form>
        
    </body>
</html>