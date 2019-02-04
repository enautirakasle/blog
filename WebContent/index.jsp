<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en" class="h-100">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v3.8.5">
<title>Sticky Footer Navbar Template · Bootstrap</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">


<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<link href="css/sticky-footer-navbar.css" rel="stylesheet">
</head>
<body class="d-flex flex-column h-100">
	<header>
		<%@ include file="templates/navBar.jsp"%>
	</header>

	<!-- Begin page content -->
	<main role="main" class="flex-shrink-0">
	<div class="container">
		<h1>${usuarioLogueado.nombre}</h1>
		<h1 class="mt-5">Sticky footer with fixed navbar</h1>
		<p class="lead">
			Pin a footer to the bottom of the viewport in desktop browsers with
			this custom HTML and CSS. A fixed navbar has been added with
			<code>padding-top: 60px;</code>
			on the
			<code>main &gt; .container</code>
			.
		</p>
		<p>
			Back to <a href="/docs/4.2/examples/sticky-footer/">the default
				sticky footer</a> minus the navbar.
		</p>
		<div class="row">
			<c:forEach items="${posts}" var="post">
				<div class="col-4">
					<div class="card" style="width: 18rem;">
						<img src="img/iria.jpg" class="card-img-top" alt="iria">
						<div class="card-body">
							<h5 class="card-title">${post.titulo}</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
		<!-- fin row -->
		<%@ include file="templates/footer.jsp"%>
	</div>
	</main>




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