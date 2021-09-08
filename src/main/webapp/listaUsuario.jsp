<%-- 
    Document   : listaUsuarioRol
    Created on : 16-jun-2021, 18:28:32
    Author     : Elementrix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <%! String salidaTabla = "";%>
    </head>
    <body>
        
        <div class="container bg-dark"> 
            <div class="col-sm-12"><br><br>
                <div class="jumbotron">
                    <center><font><h1>LISTAR USUARIO POR ROL</h1></font></center>
                    <jsp:useBean id="usuarioBean" scope="session" class="com.test.bean.UsuarioBean"/>
                    <form method="POST">
                        <div class="form-group">
                            <label>BUSCAR POR ROL</label>
                            <select type="text" class="custom-select" name="rol">
                                <option>Seleccione el Rol que cumple</option>
                                <%=usuarioBean.listarUsuario()%>
                            </select>
                        </div>
                            <button type="submit" class="btn btn-primary" name="buscar"/> BUSCAR </button><br><br>
                        <%
                            if(request.getParameter("buscar")!=null){
                                String codRol= request.getParameter("rol");
                                salidaTabla=usuarioBean.listarUsuarioRol(codRol);
                            }
                        %>
                        <table class="table table-dark table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>ROL</th>
                                    <th>NOMBRE</th>
                                    <th>APELLIDOS</th>
                                    <th>E-MAIL</th>
                                    <th>DIRECCION</th>
                                    <th>FECHA NACIMIENTO</th>
                                    <th>TELEFONO</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%= salidaTabla %>
                            </tbody>
                        </table>
                        <center><a type="submit" class="btn btn-success" href="index.jsp" /> INICIO </a></center>
                    </form>
                </div><br><br>
            </div>
        </div>
    </body>
</html>
