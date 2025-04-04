<%@page import="java.sql.*"%>
<%@page import="blooodbank.ConnectionProvider"%>
<%@include file="header.html"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="email"], select,input[type="number"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	padding:15px;
	width:60%;	
	border-radius: 25px;
	margin-left:20%;
}
h2,h1
{	
	margin-left:20%;
}
hr
{
width:60%;	
}
</style>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<font color="red" size="5">successfully submitted</font>
<%} %>
<%
if("invalid".equals(msg))
{
%>
<font color="red" size="5">some thing went wrong</font>
<%} %>
<%
int id=1;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from donor");
	if(rs.first())
	{
		id=rs.getInt(1);
		id=id+1;
	}%>
	<div class="container">
	<h1 style="colore:red;">Donor ID:<%out.println(id);%></h1></div> 	
<%
}
catch(Exception e)
{}
%>
<div class="container">
<form action="addNewDonorAction.jsp" method="post">
<input type="hidden" name="id" value="<%out.println(id); %>">
<hr>
<h2> Name</h2>
<input type="text" placeholder="Enter Name" name="name">
<hr>
<h2>Father Name</h2>
<input type="text" placeholder="Enter Father Name" name="father">
<hr>
<h2>Mother Name</h2>
<input type="text" placeholder="Enter Mother Name" name="mother">
<hr>
<h2>Mobile Number</h2>
<input type="number" placeholder="Enter Mobile Number" name="mobilenumber">
<hr>
<h2>Gender</h2>
<select name="gender">
<option value="gender">gender</option>
<option value="male">male</option>
<option value="female">female</option>
<option value="others">others</option>
</select>
<hr>
<h2>Email</h2>
<input type="email" placeholder="Enter Email" name="email">
<hr>
<h2>Blood Group</h2>
<select name="bloodgroup">
<option value="bloodgroup">bloodgroup</option>
<option value="A+">A+</option>
<option value="A-">A-</option>
<option value="B+">B+</option>
<option value="B-">B-</option>
<option value="O+">O+</option>
<option value="O-">O-</option>
<option value="AB+">AB+</option>
<option value="AB-">AB-</option>
</select>
<hr>
<h2>Address</h2>
<input type="text" placeholder="Enter Address" name="address">
<center><button type="submit" class="button">Save</button></center>
</form>
</div>
</body>
</html>


