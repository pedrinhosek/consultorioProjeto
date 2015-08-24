package com.projeto.banco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.projeto.conexao.Conexao;
import com.projeto.objeto.Convenio;
import com.projeto.objeto.Login;

public class ConvenioDao {
	
	public boolean insert(Convenio convenio) throws SQLException, ClassNotFoundException {
		Connection connection = new Conexao().getConexao();
		String sqlInsert = "INSERT INTO convenio (matricula, nome_convenio) VALUES (?,?)";
		PreparedStatement stmt = connection.prepareStatement(sqlInsert);
		try {
			stmt.setInt(1, convenio.getMatricula());
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
				convenio.setMatricula(result.getInt("matricula"));
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
	
	public boolean update(Convenio convenio) throws ClassNotFoundException{
		String sqlUpdate = "UPDATE convenio SET nome_convenio=? WHERE matricula=?";
		try {
			Connection connection = new Conexao().getConexao();
			PreparedStatement stmt = connection.prepareStatement(sqlUpdate);
			
			stmt.setString(1, convenio.getNome());
			stmt.setInt(2, convenio.getMatricula());
			System.out.println(stmt.execute());
			return stmt.execute();			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Convenio> findConvenio(String chave) throws ClassNotFoundException{
		try {
			Connection connection = new Conexao().getConexao();
			List<Convenio> convenioData = new ArrayList<Convenio>();
			String findSql = "SELECT * FROM loginFuncionario WHERE login IN ('"+chave+"')";
			System.out.println(findSql);
			java.sql.PreparedStatement stmt = connection.prepareStatement(findSql);
			ResultSet result = stmt.executeQuery();
			
			while(result.next()){
				Convenio convenio = new Convenio();
				convenio.setMatricula(result.getInt("matricula"));
				convenio.setNome(result.getString("nome_convenio"));
				convenioData.add(convenio);
			}
			result.close();
			stmt.close();
			return convenioData;
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public boolean delete(int matricula) throws SQLException, ClassNotFoundException{
		Connection connection = new Conexao().getConexao();
		String sqldelete = "DELETE FROM convenio WHERE matricula=?";
		PreparedStatement stmt = connection.prepareStatement(sqldelete);
		try{
			System.out.println(matricula);
			stmt.setInt(1, matricula);
			stmt.execute();
			System.out.println(stmt.execute());
			return true;
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
}
