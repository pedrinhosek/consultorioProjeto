<%@page import="com.projeto.objeto.Paciente"%>
<%@page import="com.projeto.banco.PacienteDao"%>
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
	<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	
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
		<li class="active">Lista de Funcionários</li>
	</ul>
	<%
		int cpfPaciente = Integer.parseInt(request.getParameter("cpfPaciente"));
		int crmMedico = Integer.parseInt(request.getParameter("crmMedico"));
	%>
		<div class="row">
		<%//int cpfPaciente = Integer.parseInt(request.getParameter("cpfPaciente"));%>
			<h2><center>Dados finais para marcar a consulta</center></h2>
			
			<div class="col-sm-4">
				<form method="post" action="consulta">
					<table class="table table-hover">
						<thead>
							<tr>
								<th colspan="2"><center>Dados do Paciente</center></th>
							</tr>
						</thead>
						<%
						try{
							PacienteDao pacienteDAO = new PacienteDao();
							List<Paciente> pacienteData = pacienteDAO.find(cpfPaciente);
							for(Paciente paciente : pacienteData){
								if(paciente.getStatus().contains("ativo")){
						%>
						<tbody>
							<tr>
								<td><span>Nome: </span></td>
								<td>
									<input type="hidden" name="nome_paciente" value="<%out.print(paciente.getNome());%>">
									<span><%out.println(paciente.getNome());%></span>
								</td>
							</tr>
							<tr>
								<td><span>E-mail: </span></td>	
								<td>
									<input type="hidden" name="email_paciente" value="<%out.print(paciente.getEmail());%>">
									<span><%out.println(paciente.getEmail());%></span>
								</td>
							</tr>
							<tr>	
								<td><span>Idade: </span></td>
								<td>
									<input type="hidden" name="idade_paciente" value="<%out.print(paciente.getIdade());%>">
									<span><%out.println(paciente.getIdade());%></span>
								</td>
							</tr>
							<tr>	
								<td><span>Sexo: </span></td>
								<td>
									<input type="hidden" name="sexo_paciente" value="<%out.print(paciente.getSexo());%>">
									<span><%out.println(paciente.getSexo());%></span>
								</td>
							</tr>
							<tr>
								<td><span>UF: </span></td>
								<td>
									<input type="hidden" name="estado_paciente" value="<%out.print(paciente.getEstado());%>">
									<span><%out.println(paciente.getEstado());%></span>
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
				
				<div class="col-sm-4">
					<table class="table table-hover">
						<thead>
							<tr>
								<th colspan="2"><center>Dados do Médico</center></th>
							</tr>
						</thead>
						<%
						try{
							MedicoDao medicoDAO = new MedicoDao();
							List<Medico> medicoData = medicoDAO.find(crmMedico);
							for(Medico medico : medicoData){
								if(medico.getStatus().contains("ativo")){
						%>
						<tbody>
							<tr>
								<td><span>CRM: </span></td>
								<td>
									<input type="hidden" name="crm_medico" value="<%out.print(medico.getCrm());%>">
									<span><%out.println(medico.getCrm());%></span>
								</td>
							</tr>
							<td>
								<span>Nome: </span></td>
								<td>
									<input type="hidden" name="nome_medico" value="<%out.print(medico.getNome());%>">
									<span><%out.println(medico.getNome());%></span>
								</td>
							</tr>
							<tr>
								<td><span>Especialidade: </span></td>
								<td>
									<input type="hidden" name="especialidade_medico" value="<%out.print(medico.getEspecialidade());%>">
									<span><%out.println(medico.getEspecialidade());%></span>
								</td>
							</tr>
							<tr>
								<td><span>Jornada: </span></td>
								<td>
									<span><%out.println(medico.getEntrada()+":00 horas as ");%><%out.println(medico.getSaida()+":00 horas");%></span>
								</td>	
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="col-sm-4">
					<table class="table table-hover">
						<thead>
							<tr>
								<th colspan="2"><center>Dados da Consulta</center></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><span>Matricula: </span></td>
								<td><input type="text" name="cod_consulta"> </td>
							</tr>
							<tr>
								<td><span>Hora: </span></td>
								<td>
									<select name="hora_consulta">							
									<%
									int horaEntrada = Integer.parseInt(medico.getEntrada());
									int horaSaida = Integer.parseInt(medico.getSaida());
									for(int i=horaEntrada; i<horaSaida; i++){
									%>
										<option value="<%out.print(i);%>"><%out.print(i);%></option>
									<%}%>
									</select> :
									<span>00 h</span>
								</td>
							</tr>
							<tr>
								<td><span>Data: </span></td>
								<td><input type="text" name="data_consulta"> </td>
							</tr>
							<tr>
								<td><span>Especialidade: </span></td>
								<td>
									<input type="text" value="<%out.print(medico.getEspecialidade());%>" disabled="disabled">
									<input type="hidden" name="especialidade_consulta" value="<%out.print(medico.getEspecialidade());%>">	
								</td>
							</tr>
							<tr>
								<td><span>Status: </span></td>
								<td>
									<input type="text" value="Agendada" disabled="disabled">
									<input type="hidden" name="status_consulta" value="Agendada">	
								</td>	
							</tr>
							<tr>
								<td><span>Descrição: </span></td>
								<td><input type="text" name="descricao_consulta"> </td>
							</tr>
							<tr>
						<%
								}
							}
						}catch (Exception e) {
							e.printStackTrace();
						}
						%>
								<td></td>
								<td>
									<button type="submit" class="btn btn-success btn-lg" name="acao" value="marcarConsulta">
										<span>Marcar Consulta</span>
									</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
			
		</div>
	</div>
</body>
</html>