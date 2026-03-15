<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String email = request.getParameter("userEmail");
	String pw = request.getParameter("userPassword");
	
	String savedEmail = (String)application.getAttribute("registerEmail");
	String savedPw = (String)application.getAttribute("registerPassword");

	/* 로그인 검사 */
	if (email != null && pw != null &&
		savedEmail != null && savedPw != null &&
		email.equals(savedEmail) && pw.equals(savedPw)) {

		session.setAttribute("loginUser", email);
		response.sendRedirect("Tour.jsp");
	} else {
		response.sendRedirect("Login.jsp?error=1");
	}
%>
