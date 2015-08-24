package com.projeto.ctrl;

import java.sql.SQLException;

import com.projeto.banco.ConvenioDao;
import com.projeto.objeto.Convenio;

public class Ctrl_Convenio {

	ConvenioDao convenioBanco = new ConvenioDao();
	public void validarDados(Convenio convenio) throws ClassNotFoundException, SQLException {
		
		convenioBanco.insert(convenio);

	}
	public void atualizarConvenio(Convenio convenio) throws ClassNotFoundException {
		System.out.println("entrei aqui 2");
		convenioBanco.update(convenio);
		
	}
	
	

}
