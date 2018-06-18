<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%

if(("POST").equalsIgnoreCase(request.getMethod())){
	if(request.getParameter("Register")!=null){
		if(request.getParameter("Register").equals("New User")){
			String name = request.getParameter("Name");
			String email = request.getParameter("eMail");
			String password= request.getParameter("pass");
			String re_password= request.getParameter("Re-pass");
			String aadhar= request.getParameter("Aadhar");
			String pan = request.getParameter("Pan");
			String MobNo = request.getParameter("Mob-No");
			String Deposit=request.getParameter("Deposit");
			if((!name.isEmpty())&&(!email.isEmpty())&&(!password.isEmpty())&&(!re_password.isEmpty())&&(!aadhar.isEmpty())&&(!pan.isEmpty())&&(!MobNo.isEmpty()&&(!Deposit.isEmpty()))){
			if(password.equals(re_password)){
				
				Connection con=null;
				PreparedStatement ps;
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
					 q="insert into MiniProject(Name,Email,PanNo,AdharNo,Password,RePassword,MobileNo,Balance) values(?,?,?,?,?,?,?,?)";
							 ps=con.prepareStatement(q);
							 ps.setString(1,name);
							 ps.setString(2,email);
							 ps.setString(3,pan);
							 ps.setString(4,aadhar);
							 ps.setString(5,password);
							 ps.setString(6,re_password);
							 ps.setString(7,MobNo);
							 ps.setString(8,Deposit);
							 ps.executeUpdate();
							 session=request.getSession();
							 session.setAttribute("TheUser",email);
							 response.sendRedirect("dashboard.jsp");
							 
				
				}
				catch(SQLException e){
					e.printStackTrace();
				}
				
			
			}
			
			
		}}}
	
}




%>

<html>
 <head>
 
    <style type="text/css">
        body{
            
            background: url(Simple.png);
            background-repeat: no-repeat;
            background-size: cover;
            
        }
        #details{
            position:fixed;
            top:50%;
            left:65%;
            transform: translate(-50%, -50%);
            
            height:50%;
            width:50%;
            background-color:" #00FFFFFF";
            
            
        }
        
        #form1 input{
            background:  transparent;
            font-weight: bold;
            
        }
        #form1 button{
            background: transparent;
        }
        input::-webkit-input-placeholder {
    color: white;
    font-weight: bolder;
        }
        button{
            color: white;
            margin-left: 70px;
        }
        Span{
        color:red;
        display:none;
        
        
        }
         
     </style>
     <script type="text/javascript">
     function validate(){
    	 var span=document.getElementById('MbNo');
    	 span.style.display='inline';
    	 var mob =document.getElementById('mob').value;
    	 var pattern=/^\d{10}$/;
    	 if(pattern.test(mob)){
    		 span.style.color='Green';
    	 span.innerHTML="Valid Number";}
     else{
    	 span.style.color='Red';
	 span.innerHTML="Invalid Number";
    	 
     }}
     function NameValid(){
    	 var span=document.getElementById('Name');
    	 span.style.display='inline';
    	 var mob =document.getElementById('naam').value;
    	 var pattern=/^[a-z A-Z]+$/;
    	 if(pattern.test(mob)){
    		 span.style.color='Green';
    	 span.innerHTML="Valid Name";}
     else{
    	 span.style.color='Red';
	 span.innerHTML="Invalid Name";
    	 
     }}
     function EmailValid(){
    	 var span=document.getElementById('mail');
    	 span.style.display='inline';
    	 var mob =document.getElementById('email').value;
    	 var pattern=/^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
    	 if(pattern.test(mob)){
    		 span.style.color='Green';
    	 span.innerHTML="Valid Email";}
     else{
    	 span.style.color='Red';
	 span.innerHTML="Invalid Email";
    	 
     }}	 
     function AadharValid(){
    	 var span=document.getElementById('AAdhar');
    	 span.style.display='inline';
    	 var mob =document.getElementById('aAdhar').value;
    	 var pattern=/^\d{12}$/;
    	 if(pattern.test(mob)){
    		 span.style.color='Green';
    	 span.innerHTML="Valid Aadhar Number";}
     else{
    	 span.style.color='Red';
	 span.innerHTML="Invalid Aadhar Number";
    	 
     }}	 
     function PanValid(){
    	 var span=document.getElementById('pan');
    	 span.style.display='inline';
    	 var mob =document.getElementById('PAN').value;
    	 var pattern= /^([a-zA-Z]){5}([0-9]){4}([a-zA-Z]){1}?$/;
    	 if(pattern.test(mob)){
    		 span.style.color='Green';
    	 span.innerHTML="Valid Pan Number";}
     else{
    	 span.style.color='Red';
	 span.innerHTML="Invalid Pan Number";
    	 
     }}	 
     function PassValid(){
    	 var span=document.getElementById('PASS');
    	 span.style.display='inline';
    	 var mob =document.getElementById('pass').value;
    	 var pattern= /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;
    	 if(pattern.test(mob)){
    		 span.style.color='Green';
    	 span.innerHTML="Valid Password";}
     else{
    	 span.style.color='Red';
	 span.innerHTML="Atleast one numeric digit and a special character";
    	 
     }}	 
     function DEPVAL(){
    	 var span=document.getElementById('DEP');
    	 span.style.display='inline';
    	 var mob =document.getElementById('dep').value;
    	 var pattern= /^\d{0,5}$/;
    	 if(pattern.test(mob)){
    		 span.style.color='Green';
    	 span.innerHTML="Correct Amount";}
     else{
    	 span.style.color='Red';
	 span.innerHTML="Incorrect Amount";
    	 
     }}	 
     
     
     
     
     
     
     
     
     
     </script>
    
    </head>   
<body>
    <div id="details">
        <form  id="form1" action="" method="post">
           <input type="text"  id="naam" name="Name" placeholder="NAME" style="width:230px;height:35px;color:#FFFFFF;" onchange="NameValid()"/>
           <span id="Name" >Incorrect Name</span><br><br>
           <input type="text"id="email" name="eMail" placeholder="E-MAIL" style="width:230px;height:35px;color:#FFFFFF;"onchange="EmailValid()"/>
          <span id="mail" >Incorrect Email</span> <br><br>
            <input id ="pass" type="password" name="pass" placeholder="PASSWORD" style="width:230px;height:35px;color:#FFFFFF;"onchange="PassValid()"/>
            <span id="PASS" >InCorrect Password </span><br><br>
            <input type="password" name="Re-pass" placeholder="RE-PASSWORD" style="width:230px;height:35px;color:#FFFFFF;"/><br><br>
            <input type="text" id="mob" name="Mob-No" placeholder="MOBILE NO" style="width:230px;height:35px;color:#FFFFFF;" onchange="validate()"/>
            <span id="MbNo" >Invalid Number</span><br><br>
            <input type="text"  id="aAdhar" name="Aadhar" placeholder="AADHAR NO" style="width:230px;height:35px;color:#FFFFFF;"onchange="AadharValid()"/>
          <span id="AAdhar" >Incorrect Aadhar</span> <br><br>
            <input  id="PAN" type="text" name="Pan" placeholder="PAN NO" style="width:230px;height:35px;color:#FFFFFF;"onchange="PanValid()"/>
           <span id="pan" >Incorrect Pan</span>  <br><br>
            <input  id="dep" type="text" name="Deposit" placeholder="DEPOSIT" style="width:230px;height:35px;color:#FFFFFF;" onchange="DEPVAL()"/>
             <span id="DEP" >Incorrect Amount</span><br><br>
            <button name="Register" Value="New User" style="font-weight: bold;">SUBMIT</button>
            
            
               </form>
    </div>
    
    
    </body>
</html>