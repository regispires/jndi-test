<%@page import="javax.naming.*"%>
<%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JNDI Resources</title>
</head>
<body>
<h1>JNDI Resources</h1>
<h2>Context ""</h2>
<ul>
<%	
	Context ctx = new InitialContext();
	NamingEnumeration<NameClassPair> list = ctx.list("");
	while (list.hasMore()) {
		out.println("<li>");
		out.println(list.next().getName());
		out.println("</li>");
	}
%>
</ul>

<h2>Context "java:"</h2>
<ul>
<%	
	Context javaContext  = (Context)ctx.lookup("java:");	
	list = javaContext.list("");
	while (list.hasMore()) {
		out.println("<li>");
		out.println(list.next().getName());
		out.println("</li>");
	}
%>
</ul>

<h2>Context "java:/comp/env"</h2>
<ul>
<%	
	Context envContext  = (Context)ctx.lookup("java:/comp/env");	
	list = envContext.list("");
	while (list.hasMore()) {
		out.println("<li>");
		out.println(list.next().getName());
		out.println("</li>");
	}
%>
</ul>
</body>
</html>