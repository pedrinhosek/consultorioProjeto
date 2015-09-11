package com.projeto.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TesteServlet extends HttpServlet{
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pedro = req.getParameter("pedro");
		String data = req.getParameter("data");
		
		System.out.println(pedro);
		System.out.println(data);

		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date d = formatter.parse(data);
			System.out.println(d);
			SimpleDateFormat formatador = new SimpleDateFormat("dd-MM-yyyy");
			//Date teste = formatador.format(d);
		} catch (ParseException e) {
			e.printStackTrace();
		}


	}

}
