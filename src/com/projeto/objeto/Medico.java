package com.projeto.objeto;

public class Medico {

	int crm;
	String Nome;
	String email;
	String Cargo;
	String Especialidade;
	String Jornada;
	String TipoUsu;
	String Login;
	String Senha;
	String status;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getJornada() {
		return Jornada;
	}
	public void setJornada(String jornada) {
		Jornada = jornada;
	}
	public int getCrm() {
		return crm;
	}
	public void setCrm(int crm) {
		this.crm = crm;
	}
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCargo() {
		return Cargo;
	}
	public void setCargo(String cargo) {
		Cargo = cargo;
	}
	public String getEspecialidade() {
		return Especialidade;
	}
	public void setEspecialidade(String especialidade) {
		Especialidade = especialidade;
	}
	public String getTipoUsu() {
		return TipoUsu;
	}
	public void setTipoUsu(String tipoUsu) {
		TipoUsu = tipoUsu;
	}
	public String getLogin() {
		return Login;
	}
	public void setLogin(String login) {
		Login = login;
	}
	public String getSenha() {
		return Senha;
	}
	public void setSenha(String senha) {
		Senha = senha;
	}
}
