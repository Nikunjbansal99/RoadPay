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

    <main id="main-holder">
        <div class="logo"> <h1 id="login-header">Change Password</h1></div>
       
<div class="content2">
        <div class="left">
        <form id="login-form"  action="change.jsp" method="post">
            <input type="text" name="password" id="password" class="login-form-field" placeholder="Current password">
            <input type="text" name="newpassword" id="newpassword" class="login-form-field" placeholder="New password">
            <input type="text" name="confirmpassword" id="confirmpassword" class="login-form-field" placeholder="Confirm password">
                      
            <input type="submit" value="Submit" id="login-form-submit">
          
        </form>

        </div>
        
          <div class="options2">
            <button class="buttons"><a href="dashboard.jsp">Back</a></button>
   
              <form action="Logout" method="post">
     			 <input class="buttons" type="submit" value="Logout">
   			  </form>
   
</div>
                
        
</div>
    </main>
  	
  
</body>

</html> 