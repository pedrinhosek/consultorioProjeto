package com.projeto.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConsultaServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String acao = req.getParameter("acao");
		
		if(acao.equals("selecionaPaciente")){
			int cpfPaciente = Integer.parseInt(req.getParameter("cpfPaciente"));		
			RequestDispatcher envio = null;  
			String urlRetorno = "/consulta/marcar-medico.jsp?cpfPaciente="+cpfPaciente+"";  
			envio = req.getRequestDispatcher(urlRetorno);  
			envio.forward(req, resp);
		}
		
		if(acao.equals("selecionaMedico")){
			int cpfPaciente = Integer.parseInt(req.getParameter("cpfPaciente"));
			int crmMedico = Integer.parseInt(req.getParameter("crmMedico"));
			
			RequestDispatcher envio = null;  
			String urlRetorno = "/consulta/marcar-consulta.jsp?cpfPaciente="+cpfPaciente+"&crmMedico"+crmMedico+"";  
			envio = req.getRequestDispatcher(urlRetorno);  
			envio.forward(req, resp);
		}
		
		
		
		
		
		
		
		
	}

}
