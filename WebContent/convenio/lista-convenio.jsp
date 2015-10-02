<%@page import="com.projeto.banco.ConvenioDao"%>
<%@page import="java.text.ParsePosition"%>
<%@page import="com.projeto.objeto.Convenio"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="../home.jsp"></jsp:include>

<div class="container">
	<ul class="breadcrumb">
		<li><a href="../template.jsp">Inicio</a> <span class="divider"></span></li>
		<li class="active">Lista de Convênios</li>
	</ul>
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<table class="table table-hover" id="dataTable">
				<thead>
					<tr>
						<th class="col-sm-5">Convênio</th>
						<th class="col-sm-4">Matricula</th>
						<th class="col-sm-3" align="center">Editar/Excluir</th>
					</tr>
				</thead>
				<tbody>
					<%
						try {
							ConvenioDao convenioDAO = new ConvenioDao();
							List<Convenio> convenioData = convenioDAO.List();
							for (Convenio convenio : convenioData) {
					%>
					<tr>
						<td><span>
								<%
									out.println(convenio.getNome());
								%>
						</span></td>
						<td><span>
								<%
									out.println(convenio.getMatricula());
								%>
						</span></td>
						<%
							String nome = convenio.getNome();
									int matricula = convenio.getMatricula();
						%>
						<td align="center">
							<form method="post" action="../convenio">
								<input type="hidden" name="matricula"
									value="<%out.print(matricula);%>"> <input type="hidden"
									name="convenio" value="<%out.println(convenio.getNome());%>">
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
					<%
						}
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				</tbody>
			</table>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>