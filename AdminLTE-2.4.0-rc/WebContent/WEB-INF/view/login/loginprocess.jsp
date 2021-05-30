<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="util.Cookies"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post">
	<%!  String email;
		String pwd;
		String remember="off"; %>
		<%
		request.setCharacterEncoding("utf-8");
		email = request.getParameter("email");
		
		if(request.getParameter("remember")!=null){
			remember = request.getParameter("remember");
		}
		
		pwd = request.getParameter("password");
		if (email.equals("hanguk@naver.com")&&pwd.equals("1234")) {
			if(remember.equals("on")){
				response.addCookie(Cookies.createCookie("AUTH", email, "/", -1));
			} else if (remember.equals("off")){
				session.setAttribute("AUTH", email);
			}
		response.sendRedirect("../main/index.jsp");
		} else {
		%>
		<script>
			alert("이메일/비밀번호를 확인해주세요!");
			history.back();
		</script>
		<%
			}
		%>
	</form>
</body>
</html>