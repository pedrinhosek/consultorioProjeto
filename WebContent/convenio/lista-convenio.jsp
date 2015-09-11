<%@page import="com.projeto.banco.ConvenioDao"%>
<%@page import="java.text.ParsePosition"%>
<%@page import="com.projeto.objeto.Convenio"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Convênios</title>
</head>
	<link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
	
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script src="../bootstrap/js/jquery.min.js"></script>
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
		<li class="active">Lista de Convênios</li>
	</ul>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="col-sm-5">Convênio</th>
						<th class="col-sm-4">Matricula</th>
						<th class="col-sm-3" align="center">Editar/Excluir</th>
					</tr>
				</thead>
				<%
				try{
					ConvenioDao convenioDAO = new ConvenioDao();
					List<Convenio> convenioData = convenioDAO.List();
					for(Convenio convenio : convenioData){
				%>
				<tbody>
					<tr>
						<td><span><%out.println(convenio.getNome());%></span></td>
						<td><span><%out.println(convenio.getMatricula());%></span></td>
						<%
						String nome = convenio.getNome();
						int matricula = convenio.getMatricula();
						%>
						<td align="center">
						<form method="post" action="../convenio">
							<input type="hidden" name="matricula" value="<%out.print(matricula);%>">
							<input type="hidden" name="convenio" value="<%out.println(convenio.getNome());%>">
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
				}catch (Exception e) {
					e.printStackTrace();
				}
				%>
			</table>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
	










</body>
</html>