package com.projeto.ctrl;

import java.sql.SQLException;

import com.projeto.banco.MedicoDao;
import com.projeto.objeto.Medico;

public class Ctrl_Medico {
	MedicoDao medicoBanco = new MedicoDao();

	public void validarDadosCadastro(Medico medico) throws ClassNotFoundException, SQLException {
		
		medicoBanco.insert(medico);
		
	}

}
