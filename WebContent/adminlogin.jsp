<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>Sign-in</title>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
.back
{
	background-image:url(3.jpg);
	background-size:100%;
	background-repeat:no-repeat;
	width:510px;
}
</style>
</head>

<body class="container-fluid" style="background-color:#f9f9f9;">
<div class="row">
<div class="col-lg-3">
</div>
<div align="center" class="col-lg-6 row" style="margin-top:10%;width:510px;height:155px;background-color:#FFF;">
<div class="col-lg-12 row back" style="height:155px;">
<h1 style="color:#186A1C;padding:9%;" align="center">Sign In To <span style="color:#FFF;">Admin</span></h1>
</div>
<form method="post" action="adminlogin">
<div class="col-lg-12 row form-group"  style="margin-top:10%">
<input type="email" placeholder="Email" class="form-control " name="email">
</div>
<div class="col-lg-12 form-group row">
<input type="password" placeholder="Password" class="form-control" name="pass">
</div>
<div class="col-lg-12">
<button type="submit" class="btn btn-success btn-lg" style="border-radius:0;" name="submit" >Log In</button>
</div>
</form>
<div class="col-lg-12 row" style="margin-top:4%">
<div class="checkbox col-lg-6">

</div>
<div class="col-lg-6" align="right">
<h4 align="right">Go To <a href="adminsignup.jsp" style="text-decoration:none;">Sign Up</a></h4>
</div>
</div>
</div>
</div>
<div class="col-lg-3">
</div>
</div>
</body>
</html>