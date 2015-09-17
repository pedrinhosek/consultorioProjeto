<%@page import="com.projeto.banco.FuncionarioDao"%>
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
	<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	
	<script src="bootstrap/js/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
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
		<li><a href="../template.jsp">Listar Funcionário</a> <span class="divider"></span></li>
		<li class="active">Atualizar Paciente</li>
	</ul>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6" >
			<%
			try{
				int cpf = Integer.parseInt(request.getParameter("cpf"));
				PacienteDao pacienteDAO = new PacienteDao();
				List<Paciente> pacienteData = pacienteDAO.find(cpf);
				for(Paciente paciente : pacienteData){
			%>
				<form method="post" action="paciente">
					<input type="hidden" name="acao" value="atualizar">
					<h2>Cadastro de novo Funcioário</h2>
					<label for="usr">CPF:</label>
					<input type="hidden" name="cpf" value="<%out.print(paciente.getCpf());%>" />
					<input type="text" class="form-control" value="<%out.print(paciente.getCpf());%>" disabled />
					<label for="usr">Nome Completo</label>
					<input type="text" class="form-control" name="nome" value="<%out.println(paciente.getNome());%>" required />
					<label for="usr">E-mail:</label>
					<input type="text" class="form-control" name="email" value="<%out.println(paciente.getEmail());%>" required />
					<label for="usr">Idade</label>
					<input type="text" class="form-control" name="idade" value="<%out.println(paciente.getIdade());%>" required />
					<label for="usr">Sexo:</label>
					<%
					if(paciente.getSexo().equals("Masculino")){
					%>					
					<select class="form-control" name="sexo" required >
						<option value="Feminino">Feminino</option>
						<option value="Masculino" selected="selected">Masculino</option>
					</select>
					<%}else{%>
					<select class="form-control" name="sexo" required >
						<option value="Feminino" selected="selected">Feminino</option>
						<option value="Masculino">Masculino</option>
					</select>
					<%}%>
					<label for="usr">Usuario:</label>
					<input type="text" class="form-control" name="usuario" value="<%out.println(paciente.getUsuario());%>" required />
					<label for="usr">Senha:</label>
					<input type="password" class="form-control" name="senha" value="<%out.println(paciente.getSenha());%>" required />
					<input type="hidden" name="tipoUsu" value="<%out.println(paciente.getTipoUsu());%>">
					<input type="hidden" name="estado" value="<%out.println(paciente.getEstado());%>">
					<input type="hidden" name="status" value="<%out.println(paciente.getStatus());%>">
					<br />
					<div style="float:right;">
						<button type="submit" class="btn btn-success">Atualizar</button>
					</div>				
			  	</form>
			<%
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			%>
			</div>
			<div class="col-sm-3" ></div>
		</div>
	</div>

</body>
</html>