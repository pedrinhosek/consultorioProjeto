package com.projeto.ctrl;

import java.sql.SQLException;

import com.projeto.banco.FuncionarioDao;
import com.projeto.objeto.Funcionario;

public class Ctrl_Funcionario {
	FuncionarioDao funcionarioBanco = new FuncionarioDao();
	
	public void validarCadastro(Funcionario funcionario) throws ClassNotFoundException, SQLException {
		funcionarioBanco.insert(funcionario);
		
	}

	public void validarAtualizacao(Funcionario funcionario) throws ClassNotFoundException {
		funcionarioBanco.update(funcionario);
	}

}
