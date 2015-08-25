package com.projeto.ctrl;

import java.sql.SQLException;

import com.projeto.banco.PacienteDao;
import com.projeto.objeto.Paciente;

public class Ctrl_Paciente {
	PacienteDao pacienteBanco = new PacienteDao();
	

	public void validarDadosCadastro(Paciente paciente) throws ClassNotFoundException, SQLException {
		
		pacienteBanco.insert(paciente);
		
	}

}
