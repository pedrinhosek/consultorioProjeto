<%@page import="com.projeto.banco.ConvenioDao"%>
<%@page import="java.text.ParsePosition"%>
<%@page import="com.projeto.objeto.Convenio"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lista de Convênios</title>
</head>
	<link rel="stylesheet" href="../bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="../scripts/css/jquery.dataTables.min.css">
	
	<script src="../bootstrap/js/jquery.min.js"></script>
	<script src="../bootstrap/js/bootstrap.min.js"></script>
	<script src="../scripts/jquery-1.10.2.js"></script>
	<script src="../scripts/js/main.js"></script>
	<script src="../scripts/jquery.dataTables.min.js"></script>
<body>
	
	<nav id="new-nav" ></nav>
	<script>
   		$("#new-nav").load( "../home.jsp #menuNav" );
	</script>
	  
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
				try{
					ConvenioDao convenioDAO = new ConvenioDao();
					List<Convenio> convenioData = convenioDAO.List();
					for(Convenio convenio : convenioData){
				%>
					<tr>
						<td><span><%out.println(convenio.getNome());%></span></td>
						<td><span><%out.println(convenio.getMatricula());%></span></td>
						<%
						String nome = convenio.getNome();
						int matricula = convenio.getMatricula();
						%>
						<td align="center">
						<form method="post" action="../convenio">
							<input type="hidden" name="matricula" value="<%out.print(matricula);%>">
							<input type="hidden" name="convenio" value="<%out.println(convenio.getNome());%>">
							<button type="submit" class="btn btn-warning btn-sm" name="acao" value="edit">
								<span class="glyphicon glyphicon-pencil"></span>
							</button>
							<button type="submit" class="btn btn-danger btn-sm" name="acao" value="del">
								<span class="glyphicon glyphicon-remove"></span>
							</button>
						</form>
						</td>
					</tr>
				<%
					}
				}catch (Exception e) {
					e.printStackTrace();
				}
				%>
				</tbody>	
			</table>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</div>
	










</body>
</html>