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
	<%! String email;
	String pwd;%>
		<%
		request.setCharacterEncoding("utf-8");
		email = request.getParameter("email");
		pwd = request.getParameter("password");
		if (email.equals("hanguk@naver.com")&&pwd.equals("1234")) {
				response.addCookie(Cookies.createCookie("AUTH", email, "/", -1));
				response.sendRedirect("../main/index.jsp?email=" + email);
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