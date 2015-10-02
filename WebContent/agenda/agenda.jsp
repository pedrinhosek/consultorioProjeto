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
			<%
			try{
				ConsultaDao consultaDao = new ConsultaDao();
				List<Consulta> consultaData = consultaDao.List();
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