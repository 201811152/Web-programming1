<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%  
String m = (String)session.getAttribute("memberMG");

if(session.getAttribute("memberId")==null)
{
	response.sendRedirect("login.jsp");
}
else if(m.equals("0"))
{
	response.sendRedirect("login.jsp");
}
else
{
	out.print("");
}
%>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title> Members List </title>
</head>
<body>
   Home > 관리자 전용 공간
   <hr>
   <회원 정보>
   <table border="1">
   <% 
      String u_id = request.getParameter("userID");
      String u_pw = request.getParameter("userPW");
      String u_mail = request.getParameter("userMAIL");
      String u_name = request.getParameter("userNAME");
      String u_manager = request.getParameter("userMANAGER");
      
      Statement sm = conn.createStatement();
      ResultSet rs = sm.executeQuery("SELECT id, passwd, email, name, manager FROM members");
      
      String str = "";
      int count = 1;
      
      while(rs.next()){
          str += "<tr>" + "<td align = 'center'>"+ count + "</td>" +"<td>" + rs.getString("id") + "</td>" + "<td>" + rs.getString("email")
          + "</td>" + "<td>" + rs.getString("name")+ "</td>" + "<td>" + rs.getInt("manager") + "</td>" + 
         "<td><center><a href='modify.jsp?userID=" + rs.getString("id") + "&userPW=" + rs.getString("passwd")+ "&userMAIL=" + rs.getString("email") + "&userNAME=" + rs.getString("name")+ "&userMANAGER=" + rs.getInt("manager") + "'> 수정 </a></center></td>"+
         "<td><center><a href='drawCheck.jsp?userID=" + rs.getString("id") + "'> X </a></center></td>" +  "</tr>";
          count++;
       }

        out.print("<tr> <td> 번호 </td> <td>아이디</td> <td>이메일</td> <td>이름</td> <td>관리자</td> <td>수정</td> <td>삭제</td> </tr>");
      out.print(str);
      
      rs.close();
      sm.close();
      conn.close();   
   %>
   <table border="1">
      <tr>
     		<fieldset style="width:230px">
			<legend> 검색 </legend><p>
	
			검색 항목 <br><hr>
			<form action="membersList_search.jsp" method="post" >
			<input type="radio" name="userSEARCH" value="id"> 아이디<br>
			<input type="radio" name="userSEARCH" value="name"> 이름<br>
			<input type="radio" name="userSEARCH" value="email"> 이메일
			
			<hr>
			검색:
			<input type="text" name="userCHECK" value=""> <br><br> &nbsp; &nbsp; &nbsp; &nbsp;
					<input type="submit" value=" 검색하기 " >
			<br><br>
			</form>
		</fieldset>  
         	<td>
				<form action="logout.jsp" method="post" >
					<input type="submit" value=" ◀ 로그아웃 " >
				</form>
			</td>
      </tr>
   </table>        
</body>
</html>   