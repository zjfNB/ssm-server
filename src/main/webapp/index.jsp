<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'index.jsp' starting page</title>
		<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
	</head>

	<body>
		<script>
			window.location.href="<%=basePath%>/login/login"
		</script>

	</body>
	
	<form action="save.action"  method="post">
		<input type="text" name="user.username" />
	     <input type="submit"  />
	</form>
	
	
</html>
