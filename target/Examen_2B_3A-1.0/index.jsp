<%-- 
    Document   : index.jsp
    Created on : 30 jun. de 2021, 15:15:08
    Author     : nes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> BIBLIOTECA </title>
    </head>
    <style>
        .tarea{
            border: 1px solid #3498db;
            background-color: #4bcffa;
            color: white;
            text-decoration: none;
            margin: 10px;
            padding: 5px;
            display: inline-block;
            border-radius: 5px;
        }
        .tarea:hover{
            border: 1px solid #3498db;
            background-color: white;
            color: #4bcffa;
        }
    </style>
    <body>
      <%--   <a href="registrarAutor.jsp"> REGISTRAR AUTOR </a><br>
        <a href="registrarLibro.jsp"> REGISTRAR LIBRO </a><br>
              <a href="listaUsuario.jsp"> LISTAR USUARIOS </a><br>
        <a href="buscarLibro.jsp"> BUSCAR LIBRO </a><br>
        <a href="buscarusuario.jsp"> BUSCAR USUARIO </a>
              <a href="registrarUsuario.jsp"> REGISTRAR USUARIO </a><br>
        <a href="listaAutor.jsp"> LISTAR AUTORES </a><br>
        <a href="listaLibro.jsp"> LISTAR LIBROS </a><br>
      
      --%>
        <a class="tarea" href="registrarPrestamo.jsp"> REGISTRAR PRESTAMO </a><br>

        <a class="tarea" href="listaPrestamo.jsp"> LISTAR PRESTAMOS </a><br>
        <a href="listaAutor.jsp"> LISTAR AUTORES </a><br>
    </body>
</html>
