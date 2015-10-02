<%@page import="com.projeto.objeto.Convenio"%>
<%@page import="java.util.List"%>
<%@page import="com.projeto.banco.ConvenioDao"%>
<jsp:include page="../home.jsp"></jsp:include>

<div class="container">
<ul class="breadcrumb">
	<li><a href="../template.jsp">Inicio</a> <span class="divider"></span></li>
	<li><a href="convenio/lista-convenio.jsp">Lista de Conv�nios</a> <span class="divider"></span></li>
	<li class="active">Edi��o de Conv�nio</li>
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
			<h2>Editar Conv�nio</h2>
			<label for="usr">Nome do Conv�nio:</label>
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