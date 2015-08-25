package com.projeto.banco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Currency;
import java.util.List;

import com.projeto.conexao.Conexao;
import com.projeto.objeto.Funcionario;

public class FuncionarioDao {
	
	public boolean insert(Funcionario funcionario) throws ClassNotFoundException, SQLException{
		Connection connection = new Conexao().getConexao();
		String sqlInsert = "INSERT INTO funcionario(cpf, nome, email, cargo, tipoUsuario, login, senha) VALUES (?,?,?,?,?,?,?)";
		PreparedStatement stmt = connection.prepareStatement(sqlInsert);
		try{
			stmt.setInt(1, funcionario.getCpf());
			stmt.setString(2, funcionario.getNome());
			stmt.setString(3, funcionario.getEmail());
			stmt.setString(4, funcionario.getCargo());
			stmt.setString(5, funcionario.getTipoUsuario());
			stmt.setString(6, funcionario.getLogin());
			stmt.setString(7, funcionario.getSenha());
			return stmt.execute();
		}catch (Exception e) {
			return false;
		}
	}
	
	public List<Funcionario> listFuncionarios() throws ClassNotFoundException{
		try{
			Connection connection = new Conexao().getConexao();
			List<Funcionario> listFunc = new ArrayList<Funcionario>();
			String sqlList = "SELECT * FROM funcionario ORDER BY nome ASC";
			PreparedStatement stmt = connection.prepareStatement(sqlList);
			ResultSet result = stmt.executeQuery();
			while(result.next()){
				//cpf, nome, email, cargo, tipoUsuario, login, senha
				Funcionario func = new Funcionario();
				func.setCpf(result.getInt("cpf"));
				func.setNome(result.getString("nome"));
				func.setEmail(result.getString("email"));
				func.setCargo(result.getString("cargo"));
				func.setTipoUsuario(result.getString("tipoUsuario"));
				func.setLogin(result.getString("login"));
				func.setSenha(result.getString("senha"));
				listFunc.add(func);				
			}
			result.close();
			stmt.close();
			return listFunc;
		}catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public List<Funcionario> findFuncionario(int cpf) throws ClassNotFoundException{
		try{
			Connection connection = new Conexao().getConexao();
			List<Funcionario> funcData = new ArrayList<Funcionario>();
			String sqlFind = "SELECT * FROM funcionario WHERE cpf IN ("+cpf+")";
			PreparedStatement stmt = connection.prepareStatement(sqlFind);
			ResultSet result = stmt.executeQuery();
			while(result.next()){
				//cpf, nome, email, cargo, tipoUsuario, login, senha
				Funcionario func = new Funcionario();
				func.setCpf(result.getInt("cpf"));
				func.setNome(result.getString("nome"));
				func.setEmail(result.getString("email"));
				func.setCargo(result.getString("cargo"));
				func.setTipoUsuario(result.getString("tipoUsuario"));
				func.setLogin(result.getString("login"));
				func.setSenha(result.getString("senha"));
				funcData.add(func);				
			}
			result.close();
			stmt.close();
			return funcData;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public boolean update(Funcionario funcionario) throws ClassNotFoundException {
		String sqlUpdate = "UPDATE funcionario SET nome=?, email=?, cargo=?, tipoUsuario=?, login=?, senha=? WHERE cpf=?";
		try{
			Connection connection = new Conexao().getConexao();
			PreparedStatement stmt = connection.prepareStatement(sqlUpdate);
			stmt.setString(1, funcionario.getNome());
			stmt.setString(2, funcionario.getEmail());
			stmt.setString(3, funcionario.getCargo());
			stmt.setString(4, funcionario.getTipoUsuario());
			stmt.setString(5, funcionario.getLogin());
			stmt.setString(6, funcionario.getSenha());
			stmt.setInt(7, funcionario.getCpf());
			return stmt.execute();
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public boolean delete(int cpf) throws ClassNotFoundException, SQLException{
		Connection connection = new Conexao().getConexao();
		String sqlDelete = "DELETE FROM funcionario WHERE cpf=?";
		PreparedStatement stmt = connection.prepareStatement(sqlDelete);
		try{
			stmt.setInt(1, cpf);
			return stmt.execute();
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	
	
	
	

}
