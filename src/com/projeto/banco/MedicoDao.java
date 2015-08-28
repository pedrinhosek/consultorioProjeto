package com.projeto.banco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import com.projeto.conexao.Conexao;
import com.projeto.objeto.Medico;
import com.projeto.objeto.Paciente;

public class MedicoDao {
	
	public boolean insert(Medico medico) throws ClassNotFoundException, SQLException {
		Connection connection = new Conexao().getConexao();
		String sqlInsert = "INSERT INTO medico(crm, nome, email, cargo, especialidade, jornada, tipoUsu, status, login, senha) VALUES (?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement stmt = connection.prepareStatement(sqlInsert);
		try{
			stmt.setInt(1, medico.getCrm());
			stmt.setString(2, medico.getNome());
			stmt.setString(3, medico.getEmail());
			stmt.setString(4, medico.getCargo());
			stmt.setString(5, medico.getEspecialidade());
			stmt.setString(6, medico.getJornada());
			stmt.setString(7, medico.getTipoUsu());
			stmt.setString(8, medico.getStatus());
			stmt.setString(9, medico.getLogin());
			stmt.setString(10, medico.getSenha());
			return stmt.execute();
		}catch (Exception e) {
			return false;
		}
	}
	
	public List<Medico> listMedicos() throws ClassNotFoundException {
		try{
			Connection connection = new Conexao().getConexao();
			List<Medico> listMedicos = new ArrayList<Medico>();
			String sqlList = "SELECT * FROM medico ORDER BY nome ASC";
			PreparedStatement stmt = connection.prepareStatement(sqlList);
			ResultSet result = stmt.executeQuery();
			while(result.next()){
				Medico medico = new Medico();
				medico.setCrm(result.getInt("crm"));
				medico.setNome(result.getString("nome"));
				medico.setEmail(result.getString("email"));
				medico.setCargo(result.getString("cargo"));
				medico.setEspecialidade(result.getString("especialidade"));
				medico.setJornada(result.getString("jornada"));
				medico.setTipoUsu(result.getString("tipoUsu"));
				medico.setStatus(result.getString("status"));
				medico.setLogin(result.getString("login"));
				medico.setSenha(result.getString("senha"));
				listMedicos.add(medico);
			}
			result.close();
			stmt.close();
			return listMedicos;
		}catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public boolean updateDelete(int crm) throws ClassNotFoundException {
		String sqlUpdateDelete = "UPDATE medico SET status='excluido' WHERE crm=?;";
		try{
			Connection connection = new Conexao().getConexao();
			PreparedStatement stmt = connection.prepareStatement(sqlUpdateDelete);
			stmt.setInt(1, crm);
			return stmt.execute();
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	public List<Medico> find(int crm) throws ClassNotFoundException {
		try{
			Connection connection = new Conexao().getConexao();
			List<Medico> medicoData = new ArrayList<Medico>();
			String sqlFind = "SELECT * FROM medico WHERE crm IN ("+crm+")";
			PreparedStatement stmt = connection.prepareStatement(sqlFind);
			ResultSet result = stmt.executeQuery();
			while (result.next()){
				//crm, nome, email, cargo, especialidade, jornada, tipoUsu, status, login, senha
				Medico medico = new Medico();
				medico.setCrm(result.getInt("crm"));
				medico.setNome(result.getString("nome"));
				medico.setEmail(result.getString("email"));
				medico.setCargo(result.getString("cargo"));
				medico.setEspecialidade(result.getString("especialidade"));
				medico.setJornada(result.getString("jornada"));
				medico.setTipoUsu(result.getString("tipoUsu"));
				medico.setStatus(result.getString("status"));
				medico.setLogin(result.getString("login"));
				medico.setSenha(result.getString("senha"));
				medicoData.add(medico);
			}
			result.close();
			stmt.close();
			return medicoData;
		}catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	
	
	
	

}
