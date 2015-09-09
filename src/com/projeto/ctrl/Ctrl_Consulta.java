package com.projeto.ctrl;

import java.sql.SQLException;

import com.projeto.banco.ConsultaDao;
import com.projeto.objeto.Consulta;

public class Ctrl_Consulta {
	ConsultaDao consultaBanco = new ConsultaDao();

	public void validarCadastroConsulta(Consulta consulta) throws ClassNotFoundException, SQLException {
		consultaBanco.insert(consulta);
	}

}
