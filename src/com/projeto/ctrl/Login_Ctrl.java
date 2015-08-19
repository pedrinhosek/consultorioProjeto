package com.projeto.ctrl;

import java.util.List;

import com.projeto.banco.Login_Dao;
import com.projeto.objeto.Login;

public class Login_Ctrl {

	Login_Dao bancoLogin = new Login_Dao();	
	public boolean validarLoginFuncionario(String login, String senha) throws ClassNotFoundException {
		List<Login> loginData = bancoLogin.findLoginFuncionario(login);
		for(Login loginlist : loginData){
			String loginOriginal = loginlist.getLogin();
			String senhaOriginal = loginlist.getSenha();
			if(login.equals(loginOriginal) && senha.equals(senhaOriginal)){
				return true;
			}
		}
		return false;		
	}
	
	public boolean validarLoginPaciente(String login, String senha) throws ClassNotFoundException {
		List<Login> loginData = bancoLogin.findLoginPaciente(login);
		for(Login loginlist : loginData){
			String loginOriginal = loginlist.getLogin();
			String senhaOriginal = loginlist.getSenha();
			if(login.equals(loginOriginal) && senha.equals(senhaOriginal)){
				return true;
			}
		}
		return false;		
	}	
}
