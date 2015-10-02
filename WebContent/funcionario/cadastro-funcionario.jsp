<jsp:include page="../home.jsp"></jsp:include>

<div class="container">
<ul class="breadcrumb">
	<li><a href="../template.jsp">Inicio</a> <span class="divider"></span></li>
	<li class="active">Cadastro de Convênio</li>
</ul>
	<div class="row">
	
		<div class="col-sm-3"></div>
		<div class="col-sm-6" >
			<form method="post" action="../funcionario">
				<input type="hidden" name="acao" value="cadastrar">
				<h2>Cadastro de novo Funcioário</h2>
				<label for="usr">CPF:</label>
				<input type="text" class="form-control" name="cpf" required />
				<label for="usr">Nome Completo</label>
				<input type="text" class="form-control" name="nome" required />
				<label for="usr">E-mail:</label>
				<input type="text" class="form-control" name="email" required />
				<label for="usr">Cargo do Funcionário</label>
				<input type="text" class="form-control" name="cargo" required />
				<label>Selecione o tipo de Usuário</label>
				<select class="form-control" name="tipoUsu" required >
					<option></option>
					<option>Administrador</option>
					<option>Paciente</option>
					<option>Neutro</option>
				</select>
				<br />
				<center>
					<label for="usr">Login:</label>
					<input type="text" name="usuario" required />
					<label for="usr">Senha:</label>
					<input type="password" name="senha" required />
				</center>
				<br />
				<div style="float:right;">
					<button type="submit" class="btn btn-success">Cadastrar</button>
				</div><br /><br />				
		  	</form>
		</div>
		<div class="col-sm-3" ></div>
		
	</div>
</div>