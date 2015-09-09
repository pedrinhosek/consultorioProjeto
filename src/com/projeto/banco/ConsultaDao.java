package com.projeto.banco;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
