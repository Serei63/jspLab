<%@ page contentType="text/html; charset=utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<title>가입 완료</title>
</head>
<body>
<script type="text/javascript">
alert("${param.name}님, 회원 가입에 성공했습니다.");
location.href= "login.do";
</script>
<br/>
</body>
</html>