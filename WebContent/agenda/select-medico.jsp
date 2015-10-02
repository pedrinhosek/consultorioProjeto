<%@page import="com.projeto.objeto.Medico"%>
<%@page import="java.util.List"%>
<%@page import="com.projeto.banco.MedicoDao"%>
<jsp:include page="../home.jsp"></jsp:include>

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