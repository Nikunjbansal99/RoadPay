
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
        <div class="logo"> <h1 id="login-header">Tax Deduction</h1></div>
       
<div class="content2">
        <div class="left">
        <form id="login-form"  action="trigger.jsp" method="post">
            <!-- <input type="number" name="amount" id="username-field" class="login-form-field" placeholder="Amount" min='1' max='1000' > -->
            <input type="text" name="vehiclenum" id="username-field" class="login-form-field" placeholder="Vehicle number" >
            <input type="submit" value="Submit" id="login-form-submit">
          
        </form>

        </div>
        
          <div class="options2">
            <button class="buttons"><a href="admin.jsp">Back</a></button>
            <button class="buttons"><a href="records.jsp">User Records</a></button>
            <button class="buttons"><a href="adminTransaction.jsp">Transactions</a></button>
            
            
            
            <form action="Logout" method="post">
      <input class="buttons" type="submit" value="Logout">
   </form>
   
</div>
                
        
</div>
    </main>
  	
  
</body>

</html>  