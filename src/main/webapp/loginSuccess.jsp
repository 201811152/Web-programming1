<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title> 관리자 로그인 </title>
</head>
<body>
   Home > 관리자 로그인
   <hr>
   <%
      String u_id = request.getParameter("uID");
      String u_pw = request.getParameter("uPW");
      
      String sql = "select id, passwd, manager from members where id=? and passwd=?";
      PreparedStatement sm = conn.prepareStatement(sql);
      sm.setString(1, u_id);
      sm.setString(2, u_pw);
      ResultSet rs = sm.executeQuery();
      
      if(rs.next()){
         String id = rs.getString("id");
         String pwd = rs.getString("passwd");
         String man = rs.getString("manager");
         
         session.setAttribute("memberId", u_id);
         session.setAttribute("memberPw", u_pw);
         session.setAttribute("memberMG", man);

            if(man.equals("1")){
               response.sendRedirect("membersList.jsp");
            }
            else{
               response.sendRedirect("membership.jsp");
            }
         }
      else {
            response.sendRedirect("loginErr.jsp");
      }	
   %>
   <table border="0">
      <tr>   
         <td>
            <form action="bang.jsp" method="post" >
               <input type="submit" value=" ◀ 서비스 이용하기" >
            </form>
         </td>
         <td>
            <form action="logout.jsp" method="post" >
               <input type="submit" value=" 로그 아웃 ▶" >
            </form>
         </td>
   </table>        
</body>
</html>