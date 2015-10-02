<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.projeto.objeto.Consulta"%>
<%@page import="com.projeto.banco.ConsultaDao"%>
<%@page import="java.text.ParsePosition"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="../home.jsp"></jsp:include>

<div class="container">
<ul class="breadcrumb">
	<li><a href="../home.jsp">Inicio</a> <span class="divider"></span></li>
	<li class="active">Agenda Medica</li>
</ul>
	<div class="row">
		<div class="col-sm-12">

	    <div>
			<ul id="tabs" class="nav nav-tabs">
				<li class="active">
					<a href="#hoje" id="hoje-tab" data-toggle="tab">Consultas de Hoje</a>
				</li>
				<li>
					<a href="#todas" id="todas-tab" data-toggle="tab">Todas</a>
				</li>
			</ul>
		    
			<div id="myTabContent" class="tab-content">
			  	<!-- Conteudo de todas as consultas do dia do medico selecionado -->
				<div class="tab-pane fade active in" id="hoje">
					<%
					DateFormat dataformatada = new SimpleDateFormat("yyyy-MM-dd");
					Date data = new Date();
					String dataAtual = dataformatada.format(data);
					
					String nomeMedico = request.getParameter("nomeMedico");
					try{
						ConsultaDao consultaDao = new ConsultaDao();
						List<Consulta> consultaData = consultaDao.ListMedico(nomeMedico);
						for(Consulta consulta : consultaData){
							if(consulta.getStatus_consulta().equals("Agendada")){
								if(consulta.getData_consulta().equals(dataAtual)){
					%>
						<div class="panel panel-default">
		  					<div class="panel-body">
			  					<span class="label label-primary">Consulta Marcada</span>
		  						<form method="post" action="../consulta">
		  							<input type="hidden" name="cod_consulta" value="<%out.print(consulta.getCod_consulta());%>">
			  						<button type="submit" class="btn btn-success" 
			  								data-toggle="tooltip" title="Efetuada" style="float:right;"
			  								name="acao" value="efetuada">
			  							<span class="glyphicon glyphicon-ok"></span>
		  							</button>
			  						<button type="submit" class="btn btn-danger" 
			  								data-toggle="tooltip" title="Desmarcar" style="float:right;"
			  								name="acao" value="desmarcar">
			  							<span class="glyphicon glyphicon-trash"></span>
		  							</button>
	  							</form>
								<table class="table table-hover"> <%out.println();%>
									<tr>
										<th class="col-sm-2"><h4>Nome paciente:</h4></th>
										<td colspan="3" class="col-sm-10"><h4><%out.println(consulta.getNome_paciente());%></h4></td>
										<!--<th class="col-sm-2">Matricula consulta:</th>
										<td class="col-sm-6"><%//out.println(consulta.getCod_consulta());%></td>-->
									</tr>
									<tr>
										<th class="col-sm-2">Data:</th>
										<td class="col-sm-4"><%out.println(consulta.getData_consulta());%></td>
										<th class="col-sm-2">Hora</th>
										<td class="col-sm-6"><%out.println(consulta.getHora_consulta());%> Horas</td>
									</tr>
									<tr>
										<th class="col-sm-2">Sexo:</th>
										<td class="col-sm-4"><%out.println(consulta.getSexo_paciente());%></td>
										<th class="col-sm-2">Idade</th>
										<td class="col-sm-6"><%out.println(consulta.getIdade_paciente());%> Anos</td>
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
							</div>
						</div>
					<%			}
							}
						}
					}catch (Exception e) {
						e.printStackTrace();
					}
					%>
				</div>
				<!-- Conteudo de todas as consultas do medico selecionado -->
				<div class="tab-pane fade" id="todas">
					<%
					try{
						ConsultaDao consultaDao = new ConsultaDao();
						List<Consulta> consultaData = consultaDao.ListMedico(nomeMedico);
						for(Consulta consulta : consultaData){
							if(consulta.getStatus_consulta().equals("Agendada")){
					%>
						<div class="panel panel-default">
		  					<div class="panel-body">
		  					<span class="label label-primary">Consulta Marcada</span>
		  						<form method="post" action="../consulta">
		  							<input type="hidden" name="cod_consulta" value="<%out.print(consulta.getCod_consulta());%>">
			  						<button type="submit" class="btn btn-success" 
			  								data-toggle="tooltip" title="Efetuada" style="float:right;"
			  								name="acao" value="efetuada">
			  							<span class="glyphicon glyphicon-ok"></span>
		  							</button>
			  						<button type="submit" class="btn btn-danger" 
			  								data-toggle="tooltip" title="Desmarcar" style="float:right;"
			  								name="acao" value="desmarcar">
			  							<span class="glyphicon glyphicon-trash"></span>
		  							</button>
	  							</form>
								<table class="table table-hover"> <%out.println();%>
									<tr>
										<th class="col-sm-2"><h4>Nome paciente:</h4></th>
										<td colspan="3" class="col-sm-10"><h4><%out.println(consulta.getNome_paciente());%></h4></td>
										<!--<th class="col-sm-2">Matricula consulta:</th>
										<td class="col-sm-6"><%//out.println(consulta.getCod_consulta());%></td>-->
									</tr>
									<tr>
										<th class="col-sm-2">Data:</th>
										<td class="col-sm-4"><%out.println(consulta.getData_consulta());%></td>
										<th class="col-sm-2">Hora</th>
										<td class="col-sm-6"><%out.println(consulta.getHora_consulta());%> Horas</td>
									</tr>
									<tr>
										<th class="col-sm-2">Sexo:</th>
										<td class="col-sm-4"><%out.println(consulta.getSexo_paciente());%></td>
										<th class="col-sm-2">Idade</th>
										<td class="col-sm-6"><%out.println(consulta.getIdade_paciente());%> Anos</td>
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
							</div>
						</div>
					<%		}
						}
					}catch (Exception e) {
						e.printStackTrace();
					}
					%>
				</div>
			</div>
	    </div>
		</div>
	</div>
</div>