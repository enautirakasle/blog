<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<%@ include file="/templates/parts/head.jsp"%>
<body>
	<header>
		<jsp:include page="${navBar}"></jsp:include>
	</header>
	<div class="container">
		<div class="row">
			<div class="col">

				<jsp:include page="${content}"></jsp:include>

			</div>
		</div>
	</div>


</body>
<%@ include file="/templates/parts/scripts.jsp"%>
</html>