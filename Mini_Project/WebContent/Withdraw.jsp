
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%
 
if(("POST").equalsIgnoreCase(request.getMethod())){
	if(request.getParameter("withdraw")!=null){
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
			int d=Integer.parseInt(request.getParameter("withdraw"));
			int b=rs.getInt("Balance");
			int newBalance=b-d;
		String User	=session.getAttribute("TheUser").toString();
			q="update MiniProject set Balance=? where Email=?";
			
			ps=con.prepareStatement(q);
			ps.setInt(1,newBalance);
			ps.setString(2,User);
		ps.executeUpdate();
		System.out.println(newBalance);
		response.sendRedirect("Main.html");
		}}

		catch(SQLException e){
			e.printStackTrace();
		}

		}}



%>



<html>
<head>
<style type="text/css">
body{
  background: url(Simple.png);
            background-repeat: no-repeat;
            background-size: cover;}
            #div1{
            position:fixed;
           top:40%;
           left:40%;
           transform:tranlate(-50%,-50%);
            
            }
</style>
</head>
<body>
<h1 style="color:white"> <%out.println("Welcome User " + session.getAttribute("TheUser").toString()); %></h1>
<div id="div1">
<form action="" method="post">
<input type="text" name="withdraw" placeholder="Enter the amount to be withdrawn" style="width:220px;height:40px;"/><br><br>
<button style="margin-left:60px">Withdraw</button>
</form>
</div>
</body>
</html>