<?php session_start();?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Sign-Up</title>
<link href="https://static.zmtcdn.com/gencss/t-22ad81b76bbc7f79e3d68512c6d4bf4e/l-H4sIAAAAAAAAA8vPy8nMS43PL0pJLcrMS49PLCjQy0ktLgYAMQSvpBgAAAA/h-047a1144fd3d9ed03609c54df1802b21" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:600,700" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link href="https://static.zmtcdn.com/gencss/t-22ad81b76bbc7f79e3d68512c6d4bf4e/l-H4sIAAAAAAAAA8vPy8nMS43PL0pJLcrMS49PLCjQy0ktLgYAMQSvpBgAAAA/h-047a1144fd3d9ed03609c54df1802b21" rel="stylesheet">

</head>

<body class="container fluid" style="background-color:#f9f9f9;">
<div class="row" style="margin-top:3%;font-family:"Times New Roman";">
<div class="col-lg-3">
</div>
<div class="col-lg-6">
<h1 align="center">Register Here</h1>
<p align="center">
Having hands on experience in creating innovative designs,I do offer design solutions which harness.
</p>
<br>
<h3 style="color:#D82023;">Personal Information</h3>
<br>

<form method="post" action="adminsignup">
<div class="form-group">
<span><label>First Name :</label><input type="text" class="form-control" name="name" required></span>
</div>
<div class="form-group">
<span><label>Reasturant ID :</label><input type="text" class="form-control" name="id" required></span>
</div>
<div class="form-group">
<span><label>Email :</label><input type="email" class="form-control" name="email" required></span>
</div>
<br>
<h3  style="color:#D82023;">Login Information</h3>
<br>
<div>
<label>Password* :</label><input type="password" class="form-control" name="pass" required>
</div>
<div>
<label>Confrim Password* :</label><input type="password" class="form-control" name="repassword" required>
</div>
<br>
<br>
<div align="left" class="form-group col-lg-8">

<button  style="border-radius:0; padding:0% 14%;background-color: #D82023;color: #fff;" type="submit" class="btn btn-lg" name="submit">Submit</button>
</div>
<div class="col-lg-4">
<h4 align="right">Go To <a href="adminlogin.jsp" style="text-decoration:none;">Log In</a></h4>
</div>
</form>

</div >
<div class="col-lg-3">

</div>
</div>

</body>
</html>