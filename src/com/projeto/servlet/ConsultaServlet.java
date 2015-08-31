package com.projeto.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.projeto.objeto.Consulta;

public class ConsultaServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Consulta consulta = new Consulta();
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
			String data_consulta = req.getParameter("data_consulta");
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
			consulta.setJornada_medico(jornada_medico);
		
		
		
		
		
		
		
		
		
		
		
		}
		
		
		
		
	}

}
