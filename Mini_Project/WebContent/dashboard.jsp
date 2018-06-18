 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%
System.out.println("entry point...");
//coding if session is already present and showing the login page result to tthe user
session=request.getSession(false);//returns current session if current session exits ,then new session not creates
//checking if session with attribute name "TheUser" is already present
if(session.getAttribute("TheUser")!=null){
	System.out.println("entry point1...");
	Connection con=null;
	PreparedStatement ps;
	ResultSet rs;
	String q;
	
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
	}
		catch(Exception e){
			e.printStackTrace();
		}
	
	try{
		String url="jdbc:mysql://localhost/student";
		 con =DriverManager.getConnection(url,"root","root");
		
		 q="select * from MiniProject where Email=?";
	 ps=con.prepareStatement(q);
		ps.setString(1,session.getAttribute("TheUser").toString());
		rs=ps.executeQuery();
		if(rs.next()){
			
			response.sendRedirect("Main.html");
			System.out.println("SEssion Created..");
			//JOptionPane.showMessageDialog(null,"welcome");
			//out.println("<div style=\"float:left;\">");
			//out.println("Welcome"+rs.getString("Name")+"!!!!");
			//out.println("<br><br> Session created for you.....");//out.println do not understand the new line character-'/n'
	//creating the log out button
	//out.println("<form action=\"logOut.jsp\" method=\"post\">");
	//out.println("<input type=\"submit\" name=\"logout\" value=\"LogOut\"/>");
	//out.println("</form>");
		//out.println("</div>");
		}
}
	catch(SQLException e){
		e.printStackTrace();
	}
}
if("POST".equalsIgnoreCase(request.getMethod()))
{System.out.println("entry point2...");
if(request.getParameter("login")!=null){
	System.out.println("entry point3...");
	//if(request.getParameter("login").equals("Login")){
		System.out.println("entry point4...");
		Connection con=null;
		PreparedStatement ps;
		ResultSet rs;
		
		String email=request.getParameter("emailLogin");
		String password=request.getParameter("passLogin");
		
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/student";
		 con=DriverManager.getConnection(url,"root","root");
		 System.out.println("connection done....");
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
	
	try{
		
		String q="select * from MiniProject where Email=? and Password=?";
	 ps=con.prepareStatement(q);
		ps.setString(1,email);
		ps.setString(2,password);
	 rs=ps.executeQuery();
	 System.out.println("Query executed....");
		if(rs.next()){
		session=request.getSession();//creating the session 
		session.setAttribute("TheUser",email);
		//starting the session with unique email name
		
		System.out.println("session created....");
		response.sendRedirect("dashboard.jsp");//redirecting the page from server side to the same page i.e dashboard itself to show the login result
		
		
	}
	}
	catch(SQLException e){
		e.printStackTrace();
	}
	
	
	
	
	
	}
		
		
		
		
		
		
	}
		
		
	
//	}

%>
