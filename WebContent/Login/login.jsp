<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login | Consultorio</title>

	<link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
	
	<script src="../bootstrap/js/bootstrap.min.js"></script>

</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
	 			<a class="navbar-brand" href="/projetoPI/login.jsp">ToothOffice</a>
			</div>
			<div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/projetoPI/Login/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	<div class="container">
		<h2>Bem-Vindo ao Sistema</h2>
		<form method="post" action="../login">
			<label>Usuário:</label>
			<input type="text" name="login" class="form-control" placeholder="Enter Usuário" required />
			<label>Senha:</label>
			<input type="password" name="senha" class="form-control" id="pwd" placeholder="Enter Senha" required />
			
			<label>
				<input type="radio" name="tipoUsu" value="funcionario" required /> Funcionário 
				<input type="radio" name="tipoUsu" value="paciente" required /> Paciente
			 </label>
			 <br />
			<button type="submit" class="btn btn-default">Entrar</button>
		</form>
	</div>

</body>
</html>