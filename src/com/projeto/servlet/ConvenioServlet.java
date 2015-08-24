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
		String mattxt = req.getParameter("matricula");
		int matricula = Integer.parseInt(mattxt);
		
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
			RequestDispatcher envio = null;  
			String urlRetorno = "/convenio/editar-convenio.jsp?chave="+matricula+"&nome="+nomeConvenio+"";  
			envio = req.getRequestDispatcher(urlRetorno);  
			envio.forward(req, resp); 
		}
		if(acao.equals("atualizar")){
			System.out.println("enteri aqui 1");
			try {
				Ctrlconvenio.atualizarConvenio(convenio);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		
		//Exclusao do convenio
		if(acao.equals("del")){
			try {
				System.out.println("entrei na servlet");
				bancoConvenio.delete(matricula);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
	}

}
