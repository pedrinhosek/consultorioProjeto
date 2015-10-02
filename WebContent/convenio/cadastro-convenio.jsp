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
			<h2>Cadastro de novo Convênio</h2>
			<label for="usr">Nome do Convênio:</label>
			<input type="text" class="form-control" name="convenio" required />
			<label for="usr">Matricula:</label>
			<input type="text" class="form-control" name="matricula" required />
			<br />
			<div style="float:right;">
				<button type="submit" class="btn btn-success">Cadastrar</button>
			</div>
	  	</form>
		</div>
		<div class="col-sm-3" ></div>
	</div>
</div>