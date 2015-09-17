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
	<ul class="breadcrumb">
		<li><a href="../template.jsp">Inicio</a> <span class="divider"></span></li>
		<li class="active">Lista de Funcionários</li>
	</ul>
		<h3><center>Escolha o paciente para marcar a consulta</center></h3>
		<br />
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Nome</th>
							<th>E-mail</th>
							<th>Idade</th>
							<th>Sexo</th>
							<th>Estado</th>
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
										<td><span><%out.println(paciente.getNome());%></span></td>
										<td><span><%out.println(paciente.getEmail());%></span></td>
										<td><span><%out.println(paciente.getIdade());%></span></td>
										<td><span><%out.println(paciente.getSexo());%></span></td>
										<td><span><%out.println(paciente.getEstado());%></span></td>	
										<td align="center">
											<form method="post" action="../consulta">
												<input type="hidden" name="cpfPaciente" value="<%out.print(paciente.getCpf());%>">
												<button type="submit" class="btn btn-primary btn-sm" name="acao" value="selecionaPaciente">
													<span>Selecionar paciente</span>
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
				
				<div class="progress">
					<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 33%">
						<span>20% Concluido</span>
					</div>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</body>
</html>