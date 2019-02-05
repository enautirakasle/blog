<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de usuarios</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
</head>
<body>
	<header> <%@ include file="templates/navBar.jsp"%>
	</header>
	<div class="container">
		<div class="row">
			<div class="col">
				<table class="table">
					<thead>
						<tr>
							<th>Nombre</th>
							<th>Apellido</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${usuarios}" var="usuario">
							<c:if test="${usuario.activo}">
								<tr class="table-success">
							</c:if>
							<c:if test="${usuario.activo == false}">
								<tr class="table-danger">
							</c:if>
							<td>${usuario.nombre}</td>
							<td>${usuario.apellido}</td>
							<td><a href="usuario/ver?id=${usuario.id}">Ver</a> <a
								href="usuario/editar?id=${usuario.id}">Editar</a> <a
								href="usuario/eliminar?id=${usuario.id}">Eliminar</a> <c:if
									test="${usuario.activo == true}">
									<a href="usuario/desactivar?id=${usuario.id}">Desactivar</a>
								</c:if> <c:if test="${usuario.activo == false}">
									<a href="usuario/activar?id=${usuario.id}">Activar</a>
								</c:if></td>
							</tr>
						</c:forEach>
					</tbody>

				</table>
			</div>
		</div>
	</div>


</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
	integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
	integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
	crossorigin="anonymous"></script>
</html>