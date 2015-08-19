package com.projeto.banco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.projeto.conexao.Conexao;
import com.projeto.objeto.Convenio;

public class ConvenioDao {
	
	public boolean insert(Convenio convenio) throws SQLException, ClassNotFoundException {
		Connection connection = new Conexao().getConexao();
		String sqlInsert = "INSERT INTO convenio (matricula, nome_convenio) VALUES (?,?)";
		PreparedStatement stmt = connection.prepareStatement(sqlInsert);
		try {
			stmt.setString(1, convenio.getMatricula());
			stmt.setString(2, convenio.getNome());
			boolean execute = stmt.execute();
			stmt.close();
			return execute;
		} catch (Exception e) {
			return false;
		}
		
	}

}
