<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("userName");
	String email = request.getParameter("userEmail");
	String pw = request.getParameter("userPassword");
	String repw = request.getParameter("reUserPassword");
	
	if (name == null || email == null || pw == null){
		response.sendRedirect("Register.jsp?error=1");
		return;
	}
	
	// 공백 제거
	name = name.trim();
	email = email.trim();
	pw = pw.trim();
	repw = repw.trim();
	
	if (name.equals("") || email.equals("") || pw.equals((""))){
		response.sendRedirect("Register.jsp?error=1");
		return;
	}
	
	if (pw.length() < 5 || pw.length() > 8) {
		response.sendRedirect("Register.jsp?error=1");
		return;
	}
	
	if (repw.length() < 5 || repw.length() > 8) {
		response.sendRedirect("Register.jsp?error=1");
		return;
	}
	
	try {
		Integer.parseInt(pw);
		Integer.parseInt(repw);
	} catch (Exception e) {
		response.sendRedirect("Register.jsp?error=1");
		return;
	}
	
	if (!pw.equals(repw)) {
		response.sendRedirect("Register.jsp?error=1");
		return;
	}
	
	// 회원가입 정보 저장
	application.setAttribute("registerName", name);
	application.setAttribute("registerEmail", email);
	application.setAttribute("registerPassword", pw);
	
	response.sendRedirect("Login.jsp?join=1");
%>
