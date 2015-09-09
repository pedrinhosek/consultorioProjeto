<%@page import="com.projeto.objeto.Consulta"%>
<%@page import="com.projeto.banco.ConsultaDao"%>
<%@page import="java.text.ParsePosition"%>
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
		<li class="active">Agenda Medica</li>
	</ul>
		<div class="row">
			<div class="col-sm-12">
			<%
			try{
				ConsultaDao consultaDao = new ConsultaDao();
				List<Consulta> consultaData = consultaDao.List();
				for(Consulta consulta : consultaData){
			%>
					<table class="table table-hover"> <%out.println();%>
						<tr>
							<th class="col-sm-2">Nome paciente:</th>
							<td class="col-sm-4"><%out.println(consulta.getNome_paciente());%></td>
							<th class="col-sm-2">Matricula consulta:</th>
							<td class="col-sm-6"><%out.println(consulta.getCod_consulta());%></td>
						</tr>
						<tr>
							<th class="col-sm-2">Data:</th>
							<td class="col-sm-4"><%out.println(consulta.getData_consulta());%></td>
							<th class="col-sm-2">Hora</th>
							<td class="col-sm-6"><%out.println(consulta.getHora_consulta());%></td>
						</tr>
						<tr>
							<th class="col-sm-2">Sexo:</th>
							<td class="col-sm-4"><%out.println(consulta.getSexo_paciente());%></td>
							<th class="col-sm-2">Idade</th>
							<td class="col-sm-6"><%out.println(consulta.getIdade_paciente());%></td>
						</tr>
						<tr>
							<th class="col-sm-2">E-mail:</th>
							<td class="col-sm-4"><%out.println(consulta.getEmail_paciente());%></td>
							<th class="col-sm-2">Especialidade:</th>
							<td class="col-sm-6"><%out.println(consulta.getEspecialidade_consulta());%></td>
						</tr>
						<tr>
							<th class="col-sm-2">Nome Médico:</th>
							<td class="col-sm-4"><%out.println(consulta.getNome_medico());%></td>
							<th class="col-sm-2">Descrição(Obs.):</th>
							<td class="col-sm-6"><%out.println(consulta.getDescricao_consulta());%></td>
						</tr>
					</table>
			<%		
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			%>
			
			</div>
		</div>
	</div>
	



</body>
</html>