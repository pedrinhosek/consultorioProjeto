package com.projeto.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projeto.banco.PacienteDao;
import com.projeto.ctrl.Ctrl_Paciente;
import com.projeto.objeto.Paciente;

public class PacienteServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Paciente paciente = new Paciente();
		Ctrl_Paciente pacienteCtrl = new Ctrl_Paciente();
		PacienteDao pacienteBanco = new PacienteDao();
		String acao = req.getParameter("acao");
		
		

		if(acao.equals("cadastrar")){
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
			try {
				pacienteCtrl.validarDadosCadastro(paciente);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(acao.equals("del")){
			int cpf = Integer.parseInt(req.getParameter("cpf"));
			try {
				pacienteBanco.updateDelete(cpf);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		
		if(acao.equals("edit")){
			int cpf = Integer.parseInt(req.getParameter("cpf"));
			RequestDispatcher envio = null;
			String urlRetorno = "/paciente/editar-paciente.jsp?chave="+cpf+"";  
			envio = req.getRequestDispatcher(urlRetorno);  
			envio.forward(req, resp); 
		}
		
		if(acao.equals("atualizar")){
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
			
			try {
				pacienteCtrl.validarAtualização(paciente);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
	

}
