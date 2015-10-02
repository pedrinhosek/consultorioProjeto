<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<li class="active">Cadastro de Paciente</li>
	</ul>
		<div class="row">
		
			<div class="col-sm-3"></div>
			<div class="col-sm-6" >
				<form method="post" action="../medico">
					<input type="hidden" name="acao" value="cadastrar">
					<h2>Cadastro de novo Paciente</h2>
					<label for="usr">CRM:</label>
					<input type="text" class="form-control" name="crm" required />
					<label for="usr">Nome Completo</label>
					<input type="text" class="form-control" name="nome" required />
					<label for="usr">E-mail:</label>
					<input type="text" class="form-control" name="email" required />
					<label for="usr">Cargo:</label>
					<input type="text" class="form-control" name="cargo" required />
					<label for="usr">Especialidade:</label>
					<input type="text" class="form-control" name="especialidade" required />
					
					<table>
					<tbody>
						<tr>
							<td class="col-sm-2"><label for="usr">Hora de entrada:</label></td>
							<td class="col-sm-4">
								<select class="form-control" name="entrada" required >
									<option value="10">10 horas</option>
									<option value="11">11 horas</option>
									<option value="12">12 horas</option>
									<option value="13">13 horas</option>
									<option value="14">14 horas</option>
								</select>	
							</td>
							<td class="col-sm-2"><label for="usr">Hora de saida:</label></td>
							<td class="col-sm-4">
								<select class="form-control" name="saida" required >
									<option value="14">14 horas</option>
									<option value="15">15 horas</option>
									<option value="16">16 horas</option>
									<option value="17">17 horas</option>
									<option value="18">18 horas</option>
									<option value="19">19 horas</option>
								</select>
							</td>
						</tr>
					</tbody>
					</table>
					
					
					

					
					
					
					<input type="hidden" name="tipoUsu" value="funcionario">
					<input type="hidden" name="status" value="ativo">				
					<br />
					<table>
					<tbody>
						<tr>
							<td class="col-sm-2"><label for="usr">Login:</label></td>
							<td class="col-sm-4"><input type="text" class="form-control" name="usuario" required /></td>
							<td class="col-sm-2"><label for="usr">Senha:</label></td>
							<td class="col-sm-4"><input type="password" class="form-control" name="senha" required /></td>
						</tr>
					</tbody>
					</table>
					<br />
					<div style="float:right;">
						<button type="submit" class="btn btn-success">Cadastrar</button>
					</div>			
			  	</form>
			</div>
			<div class="col-sm-3" ></div>
			
		</div> 
	</div>

</body>
</html>