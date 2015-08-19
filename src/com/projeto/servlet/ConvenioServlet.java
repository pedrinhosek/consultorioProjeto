package com.projeto.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projeto.ctrl.Ctrl_Convenio;
import com.projeto.objeto.Convenio;

public class ConvenioServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Ctrl_Convenio Ctrlconvenio = new Ctrl_Convenio();
		Convenio convenio = new Convenio();
		
		String nomeConvenio = req.getParameter("convenio");
		String matricula = req.getParameter("matricula");
		
		convenio.setNome(nomeConvenio);
		convenio.setMatricula(matricula);
		
		
		
		try {
			Ctrlconvenio.validarDados(convenio);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
