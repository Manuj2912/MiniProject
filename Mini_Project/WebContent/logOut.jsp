<%@ page import="java.util.*"%>
<%
session.invalidate();System.out.println("session destroyed...");
session=request.getSession();
response.sendRedirect("Main.html");




%>