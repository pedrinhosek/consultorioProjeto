package com.projeto.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projeto.banco.FuncionarioDao;
import com.projeto.ctrl.Ctrl_Funcionario;
import com.projeto.objeto.Funcionario;

public class FuncionarioServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Funcionario funcionario = new Funcionario();
		Ctrl_Funcionario funcionarioCtrl = new Ctrl_Funcionario();
		FuncionarioDao funcBanco = new FuncionarioDao();
		
		String acao = req.getParameter("acao");
		
		//Cadastrar funcionario
		if(acao.equals("cadastrar")){
			String cpfVar = req.getParameter("cpf");
			int cpf = Integer.parseInt(cpfVar);
			String nome = req.getParameter("nome");
			String email = req.getParameter("email");
			String cargo = req.getParameter("cargo");
			String tipoUsu = req.getParameter("tipoUsu");
			String login = req.getParameter("usuario");
			String senha = req.getParameter("senha");
			
			funcionario.setCpf(cpf);
			funcionario.setNome(nome);
			funcionario.setEmail(email);
			funcionario.setCargo(cargo);
			funcionario.setTipoUsuario(tipoUsu);
			funcionario.setLogin(login);
			funcionario.setSenha(senha);
			try {
				funcionarioCtrl.validarCadastro(funcionario);
				resp.sendRedirect("template.jsp");
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		
		//Editar funcionario
		if(acao.equals("edit")){
			String chave = req.getParameter("cpf");
			int cpf = Integer.parseInt(chave);
			RequestDispatcher envio = null;  
			String urlRetorno = "/funcionario/editar-funcionario.jsp?chave="+cpf+"";  
			envio = req.getRequestDispatcher(urlRetorno);  
			envio.forward(req, resp); 
		}
		if(acao.equals("atualizar")){
			String cpfVar = req.getParameter("cpf");
			int cpf = Integer.parseInt(cpfVar);
			String nome = req.getParameter("nome");
			String email = req.getParameter("email");
			String cargo = req.getParameter("cargo");
			String tipoUsu = req.getParameter("tipoUsu");
			String login = req.getParameter("usuario");
			String senha = req.getParameter("senha");
			
			funcionario.setCpf(cpf);
			funcionario.setNome(nome);
			funcionario.setEmail(email);
			funcionario.setCargo(cargo);
			funcionario.setTipoUsuario(tipoUsu);
			funcionario.setLogin(login);
			funcionario.setSenha(senha);
		
			try {
				funcionarioCtrl.validarAtualizacao(funcionario);
				resp.sendRedirect("template.jsp");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
			
		}
		
		//Cadastrar funcionario
		if(acao.equals("del")){
			String chave = req.getParameter("cpf");
			int cpf = Integer.parseInt(chave);
			try {
				funcBanco.delete(cpf);
				resp.sendRedirect("template.jsp");
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		

		
		
		
		
		
		
		
		
	}

}
