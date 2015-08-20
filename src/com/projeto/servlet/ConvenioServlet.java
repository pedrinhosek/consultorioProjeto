package com.projeto.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
		
		String acao = req.getParameter("acao");
		
		String nomeConvenio = req.getParameter("convenio");
		String matricula = req.getParameter("matricula");
		
		convenio.setNome(nomeConvenio);
		convenio.setMatricula(matricula);
		
		//Cadastro do convenio
		if(acao.equals("cadastrar")){
			try {
				Ctrlconvenio.validarDados(convenio);
				resp.sendRedirect("template.jsp");
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		
		//edit convenio
		if(acao.equals("edit")){
			String chave = req.getParameter("chave");
			String nome = req.getParameter("nome");
			
			
			RequestDispatcher envio = null;  
			String urlRetorno = "/convenio/editar-convenio.jsp?chave="+chave+"&nome="+nome+"";  
			envio = req.getRequestDispatcher(urlRetorno);  
			envio.forward(req, resp); 

		}
		if(acao.equals("atualizar")){
			try {
				Ctrlconvenio.atualizarConvenio(convenio);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		
		
		
		//Exclusao do convenio
		if(acao.equals("del")){
			
		}

		
	}

}
