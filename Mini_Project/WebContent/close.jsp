<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%
 
if(("POST").equalsIgnoreCase(request.getMethod())){
	if(request.getParameter("remove")!=null){
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
			String email=request.getParameter("email");
			int password=Integer.parseInt(request.getParameter("password"));
			 q="Delete from MiniProject where Email=? && Password=?";;
		 ps=con.prepareStatement(q);
			ps.setString(1,email);
			ps.setInt(2, password);
			ps.executeUpdate();
		
		response.sendRedirect("Main.html");
		}

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
<div id="div1">
<form action="" method="post">
<input type="text" name="email" placeholder="Enter the Email to be deleted" style="width:220px;height:40px;"/><br><br>
<input type="password" name="password" placeholder="Enter the password" style="width:220px;height:40px;"/><br><br>
<button style="margin-left:60px" name="remove" value="del">DELETE</button>
</form>
</div>
</body>
</html>