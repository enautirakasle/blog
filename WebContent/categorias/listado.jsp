<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br>
<table class="table">
	<thead>
		<tr>
			<th>Nombre</th>
			<th>Descripcion</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${categorias}" var="categoria">
			<tr>
				<td>${categoria.nombre}</td>
				<td>${categoria.descripcion}</td>

			</tr>
		</c:forEach>
	</tbody>

</table>
