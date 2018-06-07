<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="google-signin-client_id" content="887428532616-jl4svqjq01ofjvm252br9ue8g7cnle6f.apps.googleusercontent.com">
<title>Insert title here</title>
</head>
<body>
<%
session.invalidate();
%>

<jsp:include page="index.jsp"/>  <!-- jsp with getVar() defined -->
<script>
$(document).ready(function(){
signOut();
  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
});
</script>
<script>
	//logout();
  change();
</script>	
</body>
</html>