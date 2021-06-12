<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Verify Account</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    <script type="text/javascript">
        function ctck() {
            var sds = document.getElementById("dum");

        }
    </script>

</head>

<body>

    <main id="main-holder">
    <div class="alignment">
     <div class="logo"> <h1 id="login-header">Create Account</h1></div>
       <span>We already send a verification  code to your email.</span>
<div class="form-container">
    <form action="VerifyCode" method="POST" class="form-wrap">
    
        <!--  <h2 id="login-header">Reset Password</h2>-->
        <div class="form-box">
     		<input type="text" name="authcode" class="login-form-field" placeholder="Code">
            <input type="submit" value="Verify" id="login-form-submit">
          
                </div>
    </form>
</div>
        </div>
         
    
    </main>
  	
  	
  
</body>

</html>