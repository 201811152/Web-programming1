<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<% 
      String u_id = request.getParameter("userID");
      String u_pw = request.getParameter("userPW");
      String u_mail = request.getParameter("userMAIL");
      String u_name = request.getParameter("userNAME");

	String sql = "update members set passwd = ?, email = ?, name = ? WHERE  id = ?";
	
	PreparedStatement sm = conn.prepareStatement(sql);
	sm.setString(1, u_pw);
	sm.setString(2, u_mail);
	sm.setString(3, u_name);
	sm.setString(4, u_id);
	int count = sm.executeUpdate();
	
	if(count == 1){
		response.sendRedirect("membership.jsp");
	}else{
		response.sendRedirect("drawErr.jsp");
	}
	sm.close();
	conn.close();	
%>