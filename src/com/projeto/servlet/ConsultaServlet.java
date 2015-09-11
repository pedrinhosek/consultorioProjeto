package com.projeto.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projeto.banco.ConsultaDao;
import com.projeto.ctrl.Ctrl_Consulta;
import com.projeto.objeto.Consulta;

public class ConsultaServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Ctrl_Consulta consultaCtrl = new Ctrl_Consulta();
		Consulta consulta = new Consulta();
		ConsultaDao consultaBanco = new ConsultaDao();
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
		
		
		if(acao.equals("marcarConsulta")){
			int cod_consulta = Integer.parseInt(req.getParameter("cod_consulta"));
			String hora_consulta = req.getParameter("hora_consulta");
			String data_dia = req.getParameter("data_dia");
			String data_mes = req.getParameter("data_mes");
			String data_ano = req.getParameter("data_ano");
			String data_consulta = data_dia+"/"+data_mes+"/"+data_ano;
			String especialidade_consulta = req.getParameter("especialidade_consulta");
			String descricao_consulta = req.getParameter("descricao_consulta");
			
			String nome_paciente = req.getParameter("nome_paciente");
			String email_paciente = req.getParameter("email_paciente");
			String idade_paciente = req.getParameter("idade_paciente");
			String sexo_paciente = req.getParameter("sexo_paciente");
			String estado_paciente = req.getParameter("estado_paciente");
			
			String crm_medico = req.getParameter("crm_medico");
			String nome_medico = req.getParameter("nome_medico");
			String especialidade_medico = req.getParameter("especialidade_medico");
			String status_consulta = req.getParameter("status_consulta");
			String jornada_medico = req.getParameter("jornada_medico");
		
			consulta.setCod_consulta(cod_consulta);
			consulta.setHora_consulta(hora_consulta);
			consulta.setData_consulta(data_consulta);
			consulta.setEspecialidade_consulta(especialidade_consulta);
			consulta.setDescricao_consulta(descricao_consulta);
			consulta.setNome_paciente(nome_paciente);
			consulta.setEmail_paciente(email_paciente);
			consulta.setIdade_paciente(idade_paciente);
			consulta.setSexo_paciente(sexo_paciente);
			consulta.setEstado_paciente(estado_paciente);
			consulta.setCrm_medico(crm_medico);
			consulta.setNome_medico(nome_medico);
			consulta.setEspecialidade_medico(especialidade_medico);
			consulta.setStatus_consulta(status_consulta);
			consulta.setJornada_medico(jornada_medico);

			try {
				consultaCtrl.validarCadastroConsulta(consulta);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		
		if(acao.equals("efetuada")){
			int codConsulta = Integer.parseInt(req.getParameter("cod_consulta"));
			String status = "Efetuada";
			try {
				consultaBanco.updateDelete(codConsulta, status);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		
		if(acao.equals("desmarcar")){
			int codConsulta = Integer.parseInt(req.getParameter("cod_consulta"));
			String status = "Desmarcada";
			try {
				consultaBanco.updateDelete(codConsulta, status);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		
		
		
		
	}

}
