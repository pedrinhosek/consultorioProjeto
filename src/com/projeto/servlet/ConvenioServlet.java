package com.projeto.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projeto.banco.ConvenioDao;
import com.projeto.ctrl.Ctrl_Convenio;
import com.projeto.objeto.Convenio;

public class ConvenioServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ConvenioDao bancoConvenio = new ConvenioDao();
		Ctrl_Convenio Ctrlconvenio = new Ctrl_Convenio();
		Convenio convenio = new Convenio();
		
		String nomeConvenio = req.getParameter("convenio");
		String matricula = req.getParameter("matricula");
		
		convenio.setNome(nomeConvenio);
		convenio.setMatricula(matricula);	
		
		//Cadastro do convenio
		try {
			Ctrlconvenio.validarDados(convenio);
			resp.sendRedirect("template.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		

		
	}

}
