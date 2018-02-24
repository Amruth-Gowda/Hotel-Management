package com.control;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Admin;
import com.model.User;

@WebServlet("/LoginControl")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String entered_email = request.getParameter("email");
		String entered_password = request.getParameter("password");
		HttpSession session = request.getSession();
		
		if (Admin.isAdmin(entered_email, entered_password)) {
			System.out.println("Redirecting to admin");
			response.sendRedirect("admin_home.jsp");
		}
		
		else if(User.isUser(entered_email, entered_password)) {
			System.out.println("Redirecting to user");
			User user = User.getDetails(entered_email);
			session.setAttribute("user_details",user);
			System.out.println("session set complete!");
			response.sendRedirect("user_home.jsp");
		}
		else {
			PrintWriter printWriter = response.getWriter();
			printWriter.println("<html><script type='text/javascript'>alert('invalid email/password'); "
					+ "window.location.href='index.jsp';</script></html>");
		}
	}
}
