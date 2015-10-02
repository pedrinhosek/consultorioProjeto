<%@page import="com.projeto.objeto.Medico"%>
<%@page import="java.util.List"%>
<%@page import="com.projeto.banco.MedicoDao"%>
<jsp:include page="../home.jsp"></jsp:include>

<div class="container">
<ul class="breadcrumb">
	<li><a href="../template.jsp">Inicio</a> <span class="divider"></span></li>
	<li class="active">Lista de Funcionários</li>
</ul>
	<div class="row">
	<%int cpfPaciente = Integer.parseInt(request.getParameter("cpfPaciente"));%>
		<h3><center>Selecione o Médico para a consulta</center></h3>
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>CRM</th>
						<th>Nome</th>
						<th>Especialidade</th>
						<th>Jornada</th>
					</tr>
				</thead>
				<%
				try{
					MedicoDao medicoDAO = new MedicoDao();
					List<Medico> medicoData = medicoDAO.listMedicos();
					for(Medico medico : medicoData){
						if(medico.getStatus().contains("ativo")){
				%>
				<tbody>
					<tr>
						<td><span><%out.println(medico.getCrm());%></span></td>
						<td><span><%out.println(medico.getNome());%></span></td>
						<td><span><%out.println(medico.getEspecialidade());%></span></td>
						<td>
							<span><%out.println(medico.getEntrada()+":00 horas as ");%><%out.println(medico.getSaida()+":00 horas");%></span>
						</td>	
						<td align="center">
							<form method="post" action="consulta">
								<input type="hidden" name="crmMedico" value="<%out.print(medico.getCrm());%>">
								<input type="hidden" name="cpfPaciente" value="<%out.print(cpfPaciente);%>">
								<button type="submit" class="btn btn-primary btn-sm" name="acao" value="selecionaMedico">
									<span>Marcar Consulta</span>
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
				<div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 66%">
					<span>60% Concluido</span>
				</div>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</div>