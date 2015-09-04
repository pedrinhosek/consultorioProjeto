package com.projeto.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projeto.banco.MedicoDao;
import com.projeto.ctrl.Ctrl_Medico;
import com.projeto.objeto.Medico;

public class MedicoServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Medico medico = new Medico();
		MedicoDao medicoBanco = new MedicoDao();
		Ctrl_Medico medicoCtrl = new Ctrl_Medico();
		String acao = req.getParameter("acao");
				
		if(acao.equals("cadastrar")){
			int crm = Integer.parseInt(req.getParameter("crm"));
			String nome = req.getParameter("nome");
			String email = req.getParameter("email");
			String cargo = req.getParameter("cargo");
			String especialidade = req.getParameter("especialidade");
			String entrada = req.getParameter("entrada");
			String saida = req.getParameter("saida");
			String tipoUsu = req.getParameter("tipoUsu");
			String status = req.getParameter("status");
			String login = req.getParameter("usuario");
			String senha = req.getParameter("senha");

			medico.setCrm(crm);
			medico.setNome(nome);
			medico.setEmail(email);
			medico.setCargo(cargo);
			medico.setEspecialidade(especialidade);
			medico.setEntrada(entrada);
			medico.setSaida(saida);
			medico.setTipoUsu(tipoUsu);
			medico.setStatus(status);
			medico.setLogin(login);
			medico.setSenha(senha);
			
			try {
				medicoCtrl.validarDadosCadastro(medico);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(acao.equals("del")){
			int crm = Integer.parseInt(req.getParameter("crm"));
			try {
				medicoBanco.updateDelete(crm);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}			
		}
		
		if(acao.equals("edit")){
			int crm = Integer.parseInt(req.getParameter("crm"));
			
		}
		
		
		
		
	}

}
