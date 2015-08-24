package com.projeto.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PacienteServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
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
		
		System.out.println(cpf);
		System.out.println(idade);
		System.out.println(nome);
		System.out.println(email);
		System.out.println(estado);
		System.out.println(sexo);
		System.out.println(tipoUsu);
		System.out.println(usuario);
		System.out.println(senha);
		System.out.println(status);
		
	}
	
	

}
