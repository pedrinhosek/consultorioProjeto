package com.projeto.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projeto.ctrl.Login_Ctrl;

public class Login extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Login_Ctrl ctrllogin = new Login_Ctrl();

		String login = req.getParameter("login");
		String senha = req.getParameter("senha");
		String tipoUsu = req.getParameter("tipoUsu");

		try {
			if (tipoUsu.equals("funcionario")) {
				boolean resultLogin = ctrllogin.validarLoginFuncionario(login, senha);
				if(resultLogin == true){
					resp.sendRedirect("http://localhost:8081/projetoPI/template.jsp");
				}else{
					System.out.println("funcionario nao existe");
					resp.sendRedirect("http://localhost:8081/projetoPI/Login/login.jsp");
				}
			}
			if (tipoUsu.equals("paciente")) {
				boolean resultLogin = ctrllogin.validarLoginPaciente(login, senha);
				if(resultLogin == true){
					resp.sendRedirect("http://localhost:8081/projetoPI/template.jsp");
				}else{
					System.out.println("paciente nao existe");
					resp.sendRedirect("http://localhost:8081/projetoPI/Login/login.jsp");
				}
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
