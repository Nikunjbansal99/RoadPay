<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>RoadPay</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function ctck() {
            var sds = document.getElementById("dum");
        }
    </script>

</head>

<body>
<%
long value = (long)request.getAttribute("phone");
%>
    <main id="main-holder">
        <div class="logo"> <h1 id="login-header"><%out.print(value); %></h1></div>
       
<div class="content">
        
</div>
    </main>
  	
  	<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %>
  
</body>

</html>  