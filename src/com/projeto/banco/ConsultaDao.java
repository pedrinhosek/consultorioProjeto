package com.projeto.banco;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.projeto.conexao.Conexao;
import com.projeto.objeto.Consulta;
import com.projeto.objeto.Convenio;

public class ConsultaDao {
	
	public boolean insert(Consulta consulta) throws SQLException, ClassNotFoundException{
		Connection connection = new Conexao().getConexao();
		String sqlInsert = "INSERT INTO consulta "
				+ "(cod_consulta, status_consulta, hora_consulta, data_consulta, especialidade_consulta, "
				+ "descricao_consulta, nome_paciente, email_paciente, idade_paciente, sexo_paciente, estado_paciente, "
				+ "crm_medico, nome_medico, especialidade_medico) VALUES "
				+ "(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement stmt = connection.prepareStatement(sqlInsert);
		try{
			stmt.setInt(1, consulta.getCod_consulta());
			stmt.setString(2, consulta.getStatus_consulta());
			stmt.setString(3, consulta.getHora_consulta());
			stmt.setString(4, consulta.getData_consulta());
			stmt.setString(5, consulta.getEspecialidade_consulta());
			stmt.setString(6, consulta.getDescricao_consulta());
			stmt.setString(7, consulta.getNome_paciente());
			stmt.setString(8, consulta.getEmail_paciente());
			stmt.setString(9, consulta.getIdade_paciente());
			stmt.setString(10, consulta.getSexo_paciente());
			stmt.setString(11, consulta.getEstado_paciente());
			stmt.setString(12, consulta.getCrm_medico());
			stmt.setString(13, consulta.getNome_medico());
			stmt.setString(14, consulta.getEspecialidade_medico());
			boolean execute = stmt.execute();
			stmt.close();
			return execute;
		} catch (Exception e) {
			return false;
		}
	}
	
	public List<Consulta> List() throws ClassNotFoundException{
		try{
			Connection connection = new Conexao().getConexao();
			List<Consulta> consultaData = new ArrayList<Consulta>();
			String SqlList = "SELECT * FROM consulta ORDER BY data_consulta ASC";
			PreparedStatement stmt = connection.prepareStatement(SqlList);
			ResultSet result = stmt.executeQuery();
			while(result.next()){
				Consulta consulta = new Consulta();
				consulta.setCod_consulta(result.getInt("cod_consulta"));
				consulta.setStatus_consulta(result.getString("status_consulta"));
				consulta.setHora_consulta(result.getString("hora_consulta"));
				consulta.setData_consulta(result.getString("data_consulta"));
				consulta.setEspecialidade_consulta(result.getString("especialidade_consulta"));
				consulta.setDescricao_consulta(result.getString("descricao_consulta"));
				consulta.setNome_paciente(result.getString("nome_paciente"));
				consulta.setEmail_paciente(result.getString("email_paciente"));
				consulta.setIdade_paciente(result.getString("idade_paciente"));
				consulta.setSexo_paciente(result.getString("sexo_paciente"));
				consulta.setEstado_paciente(result.getString("estado_paciente"));
				consulta.setCrm_medico(result.getString("crm_medico"));
				consulta.setNome_medico(result.getString("nome_medico"));
				consulta.setEspecialidade_medico(result.getString("especialidade_medico"));
				consultaData.add(consulta);
			}
			result.close();
			stmt.close();
			return consultaData;
		} catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public boolean updateDelete(int codConsulta, String status) throws ClassNotFoundException {
		String sqlUpdateDelete = "UPDATE consulta SET status_consulta=? WHERE cod_consulta=?;";
		try{
			Connection connection = new Conexao().getConexao();
			PreparedStatement stmt = connection.prepareStatement(sqlUpdateDelete);
			stmt.setString(1, status);
			stmt.setInt(2, codConsulta);
			return stmt.execute();
		}catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
