package com.projeto.banco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<Convenio> List() throws ClassNotFoundException{
		try {
			Connection connection = new Conexao().getConexao();
			List<Convenio> convenioData = new ArrayList<Convenio>();
			String SqlList = "SELECT * FROM convenio ORDER BY nome_convenio ASC";
			PreparedStatement stmt = connection.prepareStatement(SqlList);
			ResultSet result = stmt.executeQuery();
			while(result.next()){				
				Convenio convenio = new Convenio();
				convenio.setMatricula(result.getString("matricula"));
				convenio.setNome(result.getString("nome_convenio"));
				convenioData.add(convenio);
			}
			result.close();
			stmt.close();
			return convenioData;
		} catch (SQLException e){
			throw new RuntimeException(e);
		}
	}

}
