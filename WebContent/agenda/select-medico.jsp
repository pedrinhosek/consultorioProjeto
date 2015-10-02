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




</body>
</html>