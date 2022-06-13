<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<% 
      String u_id = request.getParameter("userID");
      String u_pw = request.getParameter("userPW");
      String u_mail = request.getParameter("userMAIL");
      String u_name = request.getParameter("userNAME");
      int isManager;
      String u_manager = request.getParameter("userMANAGER");
      if(u_manager == null) {
    	  isManager = 0;
      }
      else if (u_manager.equals("on")) {
    	  isManager = 1;
      }
      else {
    	  isManager = 0;
      }
      

	String sql = "update members set passwd = ?, email = ?, name = ?, manager = ? WHERE  id = ?";
	
	PreparedStatement sm = conn.prepareStatement(sql);
	sm.setString(1, u_pw);
	sm.setString(2, u_mail);
	sm.setString(3, u_name);
	sm.setInt(4, isManager);
	sm.setString(5, u_id);
	int count = sm.executeUpdate();
	
	if(count == 1){
		response.sendRedirect("membersList.jsp");
	}else{
		response.sendRedirect("drawErr.jsp");
	}
	sm.close();
	conn.close();	
%>