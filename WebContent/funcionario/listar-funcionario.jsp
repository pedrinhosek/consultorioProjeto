<%@page import="com.projeto.objeto.Funcionario"%>
<%@page import="java.util.List"%>
<%@page import="com.projeto.banco.FuncionarioDao"%>
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
		<table class="table table-hover">
			<thead>
				<tr>
					<th>CPF</th>
					<th>Nome</th>
					<th>E-mail</th>
					<th>Cargo</th>
					<th>Login</th>
					<th>
						<center>
							Editar/Excluir
						</center>
					</th>
				</tr>
			</thead>
			<%
			try{
				FuncionarioDao funcionarioDAO = new FuncionarioDao();
				List<Funcionario> funcData = funcionarioDAO.listFuncionarios();
				for(Funcionario func : funcData){
			%>
			<tbody>
				<tr>
					<td><span><%out.println(func.getCpf());%></span></td>
					<td><span><%out.println(func.getNome());%></span></td>
					<td><span><%out.println(func.getEmail());%></span></td>
					<td><span><%out.println(func.getCargo());%></span></td>
					<td><span><%out.println(func.getLogin());%></span></td>
	
					<td align="center">
					<form method="post" action="../funcionario">
						<input type="hidden" name="cpf" value="<%out.print(func.getCpf());%>">
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
			}catch (Exception e) {
				e.printStackTrace();
			}
			%>
		</table>
		
	</div>

</body>
</html>