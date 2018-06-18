<%@page import="java.sql.*" %>
<%
 String user=session.getAttribute("TheUser").toString();
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
	
	 q="select Balance from MiniProject where Email=?";;
 ps=con.prepareStatement(q);
	ps.setString(1,user);
	rs=ps.executeQuery();
if(rs.next()){
System.out.println(rs.getInt("Balance"));
out.println("Your Account Balance is "+rs.getInt("Balance"));
}}

catch(SQLException e){
	e.printStackTrace();
}

%>