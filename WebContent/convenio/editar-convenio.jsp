<%@page import="com.projeto.objeto.Convenio"%>
<%@page import="java.util.List"%>
<%@page import="com.projeto.banco.ConvenioDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<link rel="stylesheet" href="bootstrap/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	
	<script src="bootstrap/js/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="../scripts/jquery-1.10.2.js"></script>
<body>
	
	<nav id="new-nav" ></nav>
	<script>
   		$("#new-nav").load( "../home.jsp #menuNav" );
	</script>

	<div class="container">
	<ul class="breadcrumb">
		<li><a href="../template.jsp">Inicio</a> <span class="divider"></span></li>
		<li><a href="convenio/lista-convenio.jsp">Lista de Convênios</a> <span class="divider"></span></li>
		<li class="active">Edição de Convênio</li>
	</ul>
	<%
	int chave = Integer.parseInt(request.getParameter("chave"));
	String nome = request.getParameter("nome");
	%> 
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6" >
			<form method="post" action="convenio">
				<input type="hidden" name="acao" value="atualizar">
				<h2>Editar Convênio</h2>
				<label for="usr">Nome do Convênio:</label>
				<input type="text" class="form-control" name="convenio" value="<%out.print(nome);%>" />
				<label for="usr">Matricula:</label>
				<input type="hidden" name="matricula" value="<%out.print(chave);%>" required />
				<input type="text" class="form-control" value="<%out.print(chave);%>" disabled />
				<br />
				<div style="float:right;">
					<button type="submit" class="btn btn-success">Atualizar</button>
				</div>
		  	</form>
			</div>
			<div class="col-sm-3" ></div>
		</div>
	</div>

</body>
</html>