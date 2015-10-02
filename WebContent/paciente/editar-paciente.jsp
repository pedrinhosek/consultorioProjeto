<%@page import="com.projeto.banco.FuncionarioDao"%>
<%@page import="com.projeto.objeto.Paciente"%>
<%@page import="com.projeto.banco.PacienteDao"%>
<%@page import="java.util.List"%>
<jsp:include page="../home.jsp"></jsp:include>

<div class="container">
<ul class="breadcrumb">
	<li><a href="../template.jsp">Inicio</a> <span class="divider"></span></li>
	<li><a href="../template.jsp">Listar Funcionário</a> <span class="divider"></span></li>
	<li class="active">Atualizar Paciente</li>
</ul>
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6" >
		<%
		try{
			int cpf = Integer.parseInt(request.getParameter("cpf"));
			PacienteDao pacienteDAO = new PacienteDao();
			List<Paciente> pacienteData = pacienteDAO.find(cpf);
			for(Paciente paciente : pacienteData){
		%>
			<form method="post" action="paciente">
				<input type="hidden" name="acao" value="atualizar">
				<h2>Cadastro de novo Funcioário</h2>
				<label for="usr">CPF:</label>
				<input type="hidden" name="cpf" value="<%out.print(paciente.getCpf());%>" />
				<input type="text" class="form-control" value="<%out.print(paciente.getCpf());%>" disabled />
				<label for="usr">Nome Completo</label>
				<input type="text" class="form-control" name="nome" value="<%out.println(paciente.getNome());%>" required />
				<label for="usr">E-mail:</label>
				<input type="text" class="form-control" name="email" value="<%out.println(paciente.getEmail());%>" required />
				<label for="usr">Idade</label>
				<input type="text" class="form-control" name="idade" value="<%out.println(paciente.getIdade());%>" required />
				<label for="usr">Sexo:</label>
				<%
				if(paciente.getSexo().equals("Masculino")){
				%>					
				<select class="form-control" name="sexo" required >
					<option value="Feminino">Feminino</option>
					<option value="Masculino" selected="selected">Masculino</option>
				</select>
				<%}else{%>
				<select class="form-control" name="sexo" required >
					<option value="Feminino" selected="selected">Feminino</option>
					<option value="Masculino">Masculino</option>
				</select>
				<%}%>
				<label for="usr">Usuario:</label>
				<input type="text" class="form-control" name="usuario" value="<%out.println(paciente.getUsuario());%>" required />
				<label for="usr">Senha:</label>
				<input type="password" class="form-control" name="senha" value="<%out.println(paciente.getSenha());%>" required />
				<input type="hidden" name="tipoUsu" value="<%out.println(paciente.getTipoUsu());%>">
				<input type="hidden" name="estado" value="<%out.println(paciente.getEstado());%>">
				<input type="hidden" name="status" value="<%out.println(paciente.getStatus());%>">
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
