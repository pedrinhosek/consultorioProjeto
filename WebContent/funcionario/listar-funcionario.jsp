<%@page import="com.projeto.objeto.Funcionario"%>
<%@page import="java.util.List"%>
<%@page import="com.projeto.banco.FuncionarioDao"%>
<jsp:include page="../home.jsp"></jsp:include>

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