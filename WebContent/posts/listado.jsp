<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<br>
<table class="table">
	<thead>
		<tr>
			<th>titulo</th>
			<th></th>

		</tr>
	</thead>
	<tbody>
		<c:forEach items="${posts}" var="post">
			<c:if test="${post.publico}">
				<tr class="table-success">
			</c:if>
			<c:if test="${post.publico == false}">
				<tr class="table-danger">
			</c:if>
				<td>${post.titulo}</td>
				<td></td>
			</tr>
		</c:forEach>
	</tbody>

</table>
