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
	<link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
	
	<script src="../bootstrap/js/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script src="../scripts/jquery-1.10.2.js"></script>
<body>
	
	<nav id="new-nav" ></nav>
	<script>
   		$("#new-nav").load( "../home.jsp #menuNav" );
	</script>
	  
	<div class="container">
	<ul class="breadcrumb">
		<li><a href="../template.jsp">Inicio</a> <span class="divider"></span></li>
		<li class="active">Lista de Funcionários</li>
	</ul>
		<div class="row">
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
							<td><span><%out.println(medico.getEntrada()+":00 horas as ");%><%out.println(medico.getSaida()+":00 horas");%></span></td>	
							<td align="center">
								<form method="post" action="../medico">
									<input type="hidden" name="crm" value="<%out.print(medico.getCrm());%>">
									<button type="submit" class="btn btn-warning btn-sm" name="acao" value="edit">
										<span class="glyphicon glyphicon-pencil"></span>
									</button>
									<button type="submit" class="btn btn-danger btn-sm" name="acao" value="del">
										<span class="glyphicon glyphicon-remove"></span>
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
			</div>
			<div class="col-sm-2"></div>
		</div>
	</div>
</body>
</html>