<%-- 
    Document   : listaprov
    Created on : 15 jun. de 2021, 22:10:54
    Author     : Elementrix
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        --><title>Examen</title>
    </head>
    <body>
        <!--<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Inicio</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="registrarAutor.jsp">Registrar Autor </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="listaLibro.jsp">Lista de Libros</a>
        </li>
      </ul>
      <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>-->
       <h1>LISTA DE AUTORES</h1>
        <jsp:useBean id="AutorBean" scope="session" class="com.test.bean.AutorBean"/>
        <table class="table-responsive" border="1" bgcolor="#FFFFFF">
            <thead>
                <tr>
                    <th> PATERNO </th>
                    <th> MATERNO </th>
                    <th> NOMBRE </th>
                    <th> NACIONALIDAD </th>
                    <th> MODIFICAR </th>
                    <th> ELIMINAR </th>
                </tr>
            </thead>
            <tbody>
                <%=AutorBean.listarAutores()%>
            </tbody>
        </table>
    </body>
</html>