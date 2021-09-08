<%-- 
    Document   : buscarLibro
    Created on : 30 jun. de 2021, 15:20:44
    Author     : SmartUrban2025
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <title> BIBLIOTECA </title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <!--<div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="listaprov.jsp">Lista de Proveedores</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="buscarusuario.jsp">Buscar Usuario</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>-->
  </div>
</nav>
        <h1> BUSQUEDA DE LIBRO </h1>
        <h4> (Busqueda por Apellido Paterno) </h4>
        <jsp:useBean id="LibroBean" scope="session" class="com.test.bean.LibroBean"/>
        <form method="POST">
            <table border="1" bgcolor="#aabbcc">
            <thead>
                <tr>
                    <th> BUSCAR LIBRO </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                        <td>NOMBRE DE AUTOR : </td>
                        <td><input type="text" name="user" placeholder="Ingrese nombre de autor"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Buscar" name="bus"> </td>
                    </tr>
            </tbody>
        </table>
        </form>
        <br><br>
        <%
        if(request.getParameter("bus") !=  null){
            String aut = request.getParameter ("user");
            %>
             <table border="1" bgcolor="#aabbcc">
            <thead>
                <tr>
                    <th> CODIGO</th>
                    <th>NOMBRE DE EMPLEADO</th>
                    <th>USUARIO</th>
                    <th>NIVEL</th>
            </thead>
            <tbody>
                <%= LibroBean.lista_libro_autor(aut)%> 
            </tbody>
        </table>
                <%
        }else{
        //Aqui no se enviaron los datos..
        }    
        %>      

            <a href="index.jsp"> Menu Inicio </a>
    </body>
</html>
