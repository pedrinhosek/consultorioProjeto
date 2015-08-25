<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Consulta <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Marcar Consulta</a></li>
						</ul>
					</li>
					<li><a href="#">Exibir Agenda</a></li>					
					<li><a href="#">Médico</a></li>
					<li><a href="#">Paciente</a></li>
					<li><a href="/projetoPI/funcionario/listar-funcionario.jsp">Funcionário</a></li>
					<li><a href="/projetoPI/convenio/lista-convenio.jsp">Convênio</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Cadastrar <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/projetoPI/funcionario/cadastro-funcionario.jsp">Funcionário</a></li>
							<li><a href="#">Médico</a></li>
							<li><a href="#">Paciente</a></li>
							<li><a href="/projetoPI/convenio/cadastro-convenio.jsp">Convênio</a></li>
						</ul>
					 </li>
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Logoff</a></li>
				</ul>
			</div>
		</div>
	</nav>
  
	<div class="container">
	<ul class="breadcrumb">
		<li><a href="../template.jsp">Inicio</a> <span class="divider"></span></li>
		<li class="active">Cadastro de Paciente</li>
	</ul>
		<div class="row">
		
			<div class="col-sm-3"></div>
			<div class="col-sm-6" >
				<form method="post" action="../paciente">
					<input type="hidden" name="acao" value="cadastrar">
					<h2>Cadastro de novo Paciente</h2>
					<label for="usr">CPF:</label>
					<input type="text" class="form-control" name="cpf" required />
					<label for="usr">Nome Completo</label>
					<input type="text" class="form-control" name="nome" required />
					<label for="usr">E-mail:</label>
					<input type="text" class="form-control" name="email" required />
					<br />
					<table>
					<tbody>
						<tr>
							<td class="col-sm-1"><label for="usr">Sexo:</label></td>
							<td class="col-sm-2">
								<select class="form-control" name="sexo" required >
									<option value="Masculino">M</option>
									<option value="Feminino">F</option>
								</select>
							</td>
							<td class="col-sm-2"><label for="usr">Estado:</label></td>
							<td class="col-sm-2">
								<select class="form-control" name="estado" required >
									<option>DF</option>
									<option>DF</option>
								</select>
							</td>
							<td class="col-sm-2"><label for="usr">Idade:</label></td>
							<td class="col-sm-2"><input type="text" class="form-control" name="idade" required /></td>
						</tr>
					</tbody>
					</table>
					<br />
					<table>
					<tbody>
						<tr>
							<td class="col-sm-2"><label for="usr">Login:</label></td>
							<td class="col-sm-4"><input type="text" class="form-control" name="usuario" required /></td>
							<td class="col-sm-2"><label for="usr">Senha:</label></td>
							<td class="col-sm-4"><input type="password" class="form-control" name="senha" required /></td>
						</tr>
					</tbody>
					</table>
					<br />
					<input type="hidden" name="tipoUsu" value="paciente">
					<input type="hidden" name="status" value="ativo">
					<div style="float:right;">
						<button type="submit" class="btn btn-success">Cadastrar</button>
					</div><br /><br />				
			  	</form>
			</div>
			<div class="col-sm-3" ></div>
			
		</div>
	</div>

</body>
</html>