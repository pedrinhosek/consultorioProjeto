<%@page import="com.projeto.objeto.Paciente"%>
<%@page import="com.projeto.banco.PacienteDao"%>
<%@page import="java.util.List"%>
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
	 			<a class="navbar-brand" href="/projetoPI/home.jsp">ToothOffice</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Consulta <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/projetoPI/consulta/marcar-paciente.jsp">Marcar Consulta</a></li>
						</ul>
					</li>
					<li><a href="/projetoPI/agenda/agenda.jsp">Exibir Agenda</a></li>					
					<li><a href="/projetoPI/medico/listar-medico.jsp">Médico</a></li>
					<li><a href="/projetoPI/paciente/listar-paciente.jsp">Paciente</a></li>
					<li><a href="/projetoPI/funcionario/listar-funcionario.jsp">Funcionário</a></li>
					<li><a href="/projetoPI/convenio/lista-convenio.jsp">Convênio</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Cadastrar <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/projetoPI/funcionario/cadastro-funcionario.jsp">Funcionário</a></li>
							<li><a href="/projetoPI/medico/cadastrar-medico.jsp">Médico</a></li>
							<li><a href="/projetoPI/paciente/cadastrar-paciente.jsp">Paciente</a></li>
							<li><a href="/projetoPI/convenio/cadastro-convenio.jsp">Convênio</a></li>
						</ul>
					 </li>
					<li><a href="/projetoPI/Login/login.jsp"><span class="glyphicon glyphicon-log-out"></span> Logoff</a></li>
				</ul>
			</div>
		</div>
	</nav>
	  
	<div class="container">
	<ul class="breadcrumb">
		<li><a href="../template.jsp">Inicio</a> <span class="divider"></span></li>
		<li class="active">Lista de Funcionários</li>
	</ul>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>CPF</th>
					<th>Nome</th>
					<th>E-mail</th>
					<th>Idade</th>
					<th>Sexo</th>
					<th>Estado</th>
					<th>Usuario</th>
					<th>
						<center>
							Editar/Excluir
						</center>
					</th>
				</tr>
			</thead>
			<%
			try{
				PacienteDao pacienteDAO = new PacienteDao();
				List<Paciente> pacienteData = pacienteDAO.List();
				for(Paciente paciente : pacienteData){
					if(paciente.getStatus().contains("ativo")){
			%>
			<tbody>
				<tr>
					<td><span><%out.println(paciente.getCpf());%></span></td>
					<td><span><%out.println(paciente.getNome());%></span></td>
					<td><span><%out.println(paciente.getEmail());%></span></td>
					<td><span><%out.println(paciente.getIdade());%></span></td>
					<td><span><%out.println(paciente.getSexo());%></span></td>
					<td><span><%out.println(paciente.getEstado());%></span></td>
					<td><span><%out.println(paciente.getUsuario());%></span></td>
	
					<td align="center">
					<form method="post" action="../paciente">
						<input type="hidden" name="cpf" value="<%out.print(paciente.getCpf());%>">
						<button type="submit" class="btn btn-warning btn-sm" name="acao" value="edit">
							<span class="glyphicon glyphicon-pencil"></span>
						</button>
						<button type="submit" class="btn btn-danger btn-sm" name="acao" value="del">
							<span class="glyphicon glyphicon-remove"></span>
						</button>
					</form>
					</td>
				</tr>
			</tbody>
			<%
					}
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			%>
		</table>
	</div>
</body>
</html>