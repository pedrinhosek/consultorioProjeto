<%@page import="com.projeto.objeto.Medico"%>
<%@page import="java.util.List"%>
<%@page import="com.projeto.banco.MedicoDao"%>
<jsp:include page="../home.jsp"></jsp:include>

<div class="row">
	<h3>
		<center>Selecione o Médico para a consulta</center>
	</h3>
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
				try {
					MedicoDao medicoDAO = new MedicoDao();
					List<Medico> medicoData = medicoDAO.listMedicos();
					for (Medico medico : medicoData) {
						if (medico.getStatus().contains("ativo")) {
			%>
			<tbody>
				<tr>
					<td><span>
							<%
								out.println(medico.getCrm());
							%>
					</span></td>
					<td><span>
							<%
								out.println(medico.getNome());
							%>
					</span></td>
					<td><span>
							<%
								out.println(medico.getEspecialidade());
							%>
					</span></td>
					<td><span>
							<%
								out.println(medico.getEntrada() + ":00 horas as ");
							%>
							<%
								out.println(medico.getSaida() + ":00 horas");
							%>
					</span></td>
					<td align="center">
						<form method="post" action="../medico">
							<input type="hidden" name="crm"
								value="<%out.print(medico.getCrm());%>">
							<button type="submit" class="btn btn-warning btn-sm" name="acao"
								value="edit">
								<span class="glyphicon glyphicon-pencil"></span>
							</button>
							<button type="submit" class="btn btn-danger btn-sm" name="acao"
								value="del">
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</form>
					</td>
				</tr>
			</tbody>
			<%
				}
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</table>
	</div>
	<div class="col-sm-2"></div>
</div>
</div>