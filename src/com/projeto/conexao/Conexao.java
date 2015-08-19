package com.projeto.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
	
	private String url = "jdbc:mysql://localhost:3306/projeto";
	private String usuario = "root";
	private String senha = "1234";

	public Connection getConexao() throws ClassNotFoundException{
		try {
			Class.forName("com.mysql.jdbc.Driver"); 
			return DriverManager.getConnection(url,usuario,senha);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public static void main(String[] args) throws SQLException, ClassNotFoundException {
		Connection connection = new Conexao().getConexao();
		System.out.println("Conexao aberta");
		connection.close();
	}
}
