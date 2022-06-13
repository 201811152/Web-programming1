<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%  
if(session.getAttribute("memberId")==null)
{
	response.sendRedirect("login.jsp");
}
%>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 일반 사용자 전용 공간 </title>
</head>
<body>
	Home > 일반 사용자 전용 공간
	<hr>
	<내 정보>
	<table border="1">
	<%
	String i = (String)session.getAttribute("memberId");

    Statement sm = conn.createStatement();
    ResultSet rs = sm.executeQuery("SELECT id, passwd, email, name, manager FROM members where id like '%" + i + "%'");

    String str = "";
    int count = 1;
    
    while(rs.next()){
        str += "<tr>" + "<td align = 'center'>"+ count + "</td>" +"<td>" + rs.getString("id") + "</td>" + "<td>" + rs.getString("email")
        + "</td>" + "<td>" + rs.getString("name")+ "</td>" + "<td>" + rs.getInt("manager") + "</td>" + 
       "<td><center><a href='modify_user.jsp?userID=" + rs.getString("id") + "&userPW=" + rs.getString("passwd")+ "&userMAIL=" + rs.getString("email") + "&userNAME=" + rs.getString("name")+ "&userMANAGER=" + rs.getInt("manager") + "'> 수정 </a></center></td>"+
       "<td><center><a href='drawCheck.jsp?userID=" + rs.getString("id") + "'> X </a></center></td>" +  "</tr>";
        count++;
     }

    out.print("<tr> <td> 번호 </td> <td>아이디</td> <td>이메일</td> <td>이름</td> <td>관리자</td> <td>수정</td> <td>탈퇴</td> </tr>");
    out.print(str);
    
    rs.close();
    sm.close();
    conn.close();
	%>
	</table>
	<table border="1">
		<tr>
			<td>
				<form action="logout.jsp" method="post" >
					<input type="submit" value=" ◀ 로그아웃 " >
				</form>
			</td>
		</tr>	
	</table>	 	
</body>
</html>