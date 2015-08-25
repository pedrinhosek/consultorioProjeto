package com.projeto.banco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.projeto.conexao.Conexao;
import com.projeto.objeto.Convenio;
import com.projeto.objeto.Funcionario;
import com.projeto.objeto.Paciente;

public class PacienteDao {
	
	public boolean insert(Paciente paciente) throws SQLException, ClassNotFoundException {
		Connection connection = new Conexao().getConexao();
		String sqlInsert = "INSERT INTO paciente (cpf, idade, nome, email, estado, sexo, tipoUsu, usuario, senha, status) VALUES (?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement stmt = connection.prepareStatement(sqlInsert);
		try {
			stmt.setInt(1, paciente.getCpf());
			stmt.setInt(2, paciente.getIdade());
			stmt.setString(3, paciente.getNome());
			stmt.setString(4, paciente.getEmail());
			stmt.setString(5, paciente.getEstado());
			stmt.setString(6, paciente.getSexo());
			stmt.setString(7, paciente.getTipoUsu());
			stmt.setString(8, paciente.getUsuario());
			stmt.setString(9, paciente.getSenha());
			stmt.setString(10, paciente.getStatus());
			
			boolean execute = stmt.execute();
			stmt.close();
			return execute;
		} catch (Exception e) {
			return false;
		}
	}
	
	public  List<Paciente> List() throws ClassNotFoundException{
		//cpf,idade,nome,email,estado,sexo,tipoUsu,usuario,senha,status
		try {
			Connection connection = new Conexao().getConexao();
			List<Paciente> pacienteData = new ArrayList<Paciente>();
			String SqlList = "SELECT * FROM paciente ORDER BY nome ASC";
			PreparedStatement stmt = connection.prepareStatement(SqlList);
			ResultSet result = stmt.executeQuery();
			while(result.next()){				
				Paciente paciente = new Paciente();
				paciente.setCpf(result.getInt("cpf"));
				paciente.setIdade(result.getInt("idade"));
				paciente.setNome(result.getString("nome"));
				paciente.setEmail(result.getString("email"));
				paciente.setEstado(result.getString("estado"));
				paciente.setSexo(result.getString("sexo"));
				paciente.setTipoUsu(result.getString("tipoUsu"));
				paciente.setUsuario(result.getString("usuario"));
				paciente.setSenha(result.getString("senha"));
				paciente.setStatus(result.getString("status"));
				pacienteData.add(paciente);
			}
			result.close();
			stmt.close();
			return pacienteData;
		} catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public List<Paciente> find(int cpf) throws ClassNotFoundException{
		try{
			Connection connection = new Conexao().getConexao();
			List<Paciente> pacienteData = new ArrayList<Paciente>();
			String sqlFind = "SELECT * FROM paciente WHERE cpf IN ("+cpf+")";
			PreparedStatement stmt = connection.prepareStatement(sqlFind);
			ResultSet result = stmt.executeQuery();
			while(result.next()){
				//cpf,idade,nome,email,estado,sexo,tipoUsu,usuario,senha,status
				Paciente paciente = new Paciente();
				paciente.setCpf(result.getInt("cpf"));
				paciente.setIdade(result.getInt("idade"));
				paciente.setNome(result.getString("nome"));
				paciente.setEmail(result.getString("email"));
				paciente.setEstado(result.getString("estado"));
				paciente.setSexo(result.getString("sexo"));
				paciente.setTipoUsu(result.getString("tipoUsu"));
				paciente.setUsuario(result.getString("usuario"));
				paciente.setSenha(result.getString("senha"));
				paciente.setStatus(result.getString("status"));
				pacienteData.add(paciente);				
			}
			result.close();
			stmt.close();
			return pacienteData;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
