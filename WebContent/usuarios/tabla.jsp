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