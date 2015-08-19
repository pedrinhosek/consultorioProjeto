package com.projeto.banco;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.projeto.conexao.Conexao;
import com.projeto.objeto.Login;

public class Login_Dao {
	
	public List<Login> findLoginFuncionario(String login) throws ClassNotFoundException{
		try {
			Connection connection = new Conexao().getConexao();
			List<Login> loginData = new ArrayList<Login>();
			String findSql = "SELECT * FROM loginFuncionario WHERE login IN ('"+login+"')";
			java.sql.PreparedStatement stmt = connection.prepareStatement(findSql);
			ResultSet result = stmt.executeQuery();
			
			while(result.next()){
				Login loginObjeto = new Login();
				loginObjeto.setLogin(result.getString("login"));
				loginObjeto.setSenha(result.getString("senha"));
				loginData.add(loginObjeto);
			}
			result.close();
			stmt.close();
			return loginData;
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Login> findLoginPaciente(String login) throws ClassNotFoundException{
		try {
			Connection connection = new Conexao().getConexao();
			List<Login> loginData = new ArrayList<Login>();
			String findSql = "SELECT * FROM loginPaciente WHERE login IN ('"+login+"')";
			java.sql.PreparedStatement stmt = connection.prepareStatement(findSql);
			ResultSet result = stmt.executeQuery();
			
			while(result.next()){
				Login loginObjeto = new Login();
				loginObjeto.setLogin(result.getString("login"));
				loginObjeto.setSenha(result.getString("senha"));
				loginData.add(loginObjeto);
			}
			result.close();
			stmt.close();
			return loginData;
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	
	
	
	
	
	
	
	
	


}
