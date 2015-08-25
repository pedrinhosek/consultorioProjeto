package com.projeto.banco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.projeto.conexao.Conexao;
import com.projeto.objeto.Paciente;

public class PacienteDao {
	
	public boolean insert(Paciente paciente) throws SQLException, ClassNotFoundException {
		Connection connection = new Conexao().getConexao();
		String sqlInsert = "INSERT INTO convenio (matricula, nome_convenio) VALUES (?,?)";
		PreparedStatement stmt = connection.prepareStatement(sqlInsert);
		try {
			
			
			boolean execute = stmt.execute();
			stmt.close();
			return execute;
		} catch (Exception e) {
			return false;
		}
	}

}
