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
		<li><a href="../template.jsp">Listar Funcionário</a> <span class="divider"></span></li>
		<li class="active">Atualizar Funcionário</li>
	</ul>
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6" >
			<%
			try{
				int cpf = Integer.parseInt(request.getParameter("cpf"));
				FuncionarioDao funcionarioDAO = new FuncionarioDao();
				List<Funcionario> funcData = funcionarioDAO.findFuncionario(cpf);
				for(Funcionario func : funcData){
			%>

				<form method="post" action="funcionario">
					<input type="hidden" name="acao" value="atualizar">
					<h2>Cadastro de novo Funcioário</h2>
					<label for="usr">CPF:</label>
					<input type="hidden" name="cpf" value="<%out.print(func.getCpf());%>" />
					<input type="text" class="form-control" value="<%out.print(func.getCpf());%>" disabled />
					<label for="usr">Nome Completo</label>
					<input type="text" class="form-control" name="nome" value="<%out.println(func.getNome());%>" required />
					<label for="usr">E-mail:</label>
					<input type="text" class="form-control" name="email" value="<%out.println(func.getEmail());%>" required />
					<label for="usr">Cargo do Funcionário</label>
					<input type="text" class="form-control" name="cargo" value="<%out.println(func.getCargo());%>" required />
					<label for="usr">Login:</label>
					<input type="text" class="form-control" name="usuario" value="<%out.println(func.getLogin());%>" required />
					<label for="usr">Senha:</label>
					<input type="password" class="form-control" name="senha" value="<%out.println(func.getSenha());%>" required />
					<input type="hidden" name="tipoUsu" value="<%out.println(func.getTipoUsuario());%>">
					<br />
					<div style="float:right;">
						<button type="submit" class="btn btn-success">Atualizar</button>
					</div>				
			  	</form>
			<%
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			%>
			</div>
			<div class="col-sm-3" ></div>
		</div>
	</div>

</body>
</html>