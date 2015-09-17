<%@page import="com.projeto.objeto.Medico"%>
<%@page import="java.util.List"%>
<%@page import="com.projeto.banco.MedicoDao"%>
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
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Agenda Médica <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="/projetoPI/agenda/agenda.jsp">Agenda do Consultório</a></li>
							<li><a href="/projetoPI/agenda/select-medico.jsp">Agenda do Médico</a></li>
						</ul>
					</li>
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
		<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			
			<div class="alert alert-danger" role="alert">
				<center><h4>Clique no Médico para ver sua agenda</h4></center>
			</div>
			<form method="post" action="../consulta">
				<%
					try{
						MedicoDao medicoDAO = new MedicoDao();
						List<Medico> medicoData = medicoDAO.listMedicos();
						for(Medico medico : medicoData){
							if(medico.getStatus().contains("ativo")){
				%>
				
						<input type="hidden" name="acao" value="selectMedico">
						<button type="submit" name="nomeMedico" value="<%out.print(medico.getNome());%>" class="btn btn-default btn-block">
							<%out.println(medico.getNome());%>
						</button><br />	
				
				<%
							}
						}
					}catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</form>
		
		</div>
		<div class="col-sm-2"></div>
		</div>
	</div>




</body>
</html>