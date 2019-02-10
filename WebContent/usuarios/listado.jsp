<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ include file="/templates/parts/head.jsp"%>
<body>
	<header> <%@ include file="/templates/parts/navBar.jsp"%>
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
<%@ include file="/templates/parts/scripts.jsp"%>
</html>