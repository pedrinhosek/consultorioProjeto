<%@page import="com.projeto.objeto.Paciente"%>
<%@page import="com.projeto.banco.PacienteDao"%>
<%@page import="java.util.List"%>
<jsp:include page="../home.jsp"></jsp:include>

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