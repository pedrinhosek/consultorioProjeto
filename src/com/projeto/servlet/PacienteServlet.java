package com.projeto.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projeto.ctrl.Ctrl_Paciente;
import com.projeto.objeto.Paciente;

public class PacienteServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Paciente paciente = new Paciente();
		Ctrl_Paciente pacienteCtrl = new Ctrl_Paciente();
		String acao = req.getParameter("acao");
		
		
		int cpf = Integer.parseInt(req.getParameter("cpf"));
		int idade = Integer.parseInt(req.getParameter("idade"));
		String nome = req.getParameter("nome");
		String email = req.getParameter("email");
		String estado = req.getParameter("estado");
		String sexo = req.getParameter("sexo");
		String tipoUsu = req.getParameter("tipoUsu");
		String usuario = req.getParameter("usuario");
		String senha = req.getParameter("senha");
		String status = req.getParameter("status");
		
		paciente.setCpf(cpf);
		paciente.setIdade(idade);
		paciente.setNome(nome);
		paciente.setEmail(email);
		paciente.setEstado(estado);
		paciente.setSexo(sexo);
		paciente.setTipoUsu(tipoUsu);
		paciente.setUsuario(usuario);
		paciente.setSenha(senha);
		paciente.setStatus(status);

		if(acao.equals("cadastrar")){
			pacienteCtrl.validarDadosCadastro(paciente);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
	

}
