<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
	
	<script src="../bootstrap/js/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
	 			<a class="navbar-brand" href="#">ToothOffice</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Home</a></li>
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Item 1 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">sub-item 1.1</a></li>
							<li><a href="#">sub-item 1.2</a></li>
							<li><a href="#">sub-item 1.2</a></li>
						</ul>
					</li>
					<li><a href="#">Item 2</a></li>
					<li><a href="#">Item 3</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Cadastar <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Funcionário</a></li>
							<li><a href="#">Médico</a></li>
							<li><a href="http://localhost:8081/projetoPI/convenio/cadastro-convenio.jsp">Paciente</a></li>
							<li><a href="#">Convênio</a></li>
						</ul>
					 </li>
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Logoff</a></li>
				</ul>
			</div>
		</div>
	</nav>
  
	<div class="container">
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6" >
			<form method="post" action="../convenio">
				<h2>Cadastro de novo Convênio</h2>
				<label for="usr">Name do Convênio:</label>
				<input type="text" class="form-control" name="convenio" />
				<label for="usr">Matricula:</label>
				<input type="text" class="form-control" name="matricula" />
				<br />
				<div style="float:right;">
					<button type="submit" class="btn btn-success">Cadastrar</button>
				</div>
		  	</form>
			</div>
			<div class="col-sm-3" ></div>
		</div>
	</div>

</body>
</html>