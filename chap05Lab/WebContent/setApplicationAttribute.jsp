<%@ page contentType = "text/html; charset=utf-8" %>
<%
	String name = request.getParameter("name");
	String value = request.getParameter("value");
	
	if (name != null && value != null) {
		application.setAttribute("name", name);
		application.setAttribute("value", value);
	}
%>

<html>
<head><title>application 속성 지정</title></head>
<body>
<%
	if (name != null && value != null) {
%>
application 기본 객체의 속성 설정:
 <%= application.getAttribute("name") %> = <%= application.getAttribute("value") %>
<%
	} else {
%>
application 기본 객체의 속성 설정 안 함
<%
	}
%>
</body>
</html>
