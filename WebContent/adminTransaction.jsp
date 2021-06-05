<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>RoadPay</title>
    <link href="css/style.css" rel="stylesheet" type="text/css">
    

</head>

<body>

    <main id="main-holder">
          <div class="logo"> <h1 id="login-header">Transactions</h1></div>
       <div class="content2">
     
     <div style="width:20%;">   <form  id="login-form"  action="search.jsp" method="post">
            <input type="number" name="phone" id="phone" class="login-form-field" placeholder="phone">
            <input type="submit" value="Search" id="login-form-submit">
          
</form></div>
        <div class="details2">


     
        
        <%
        
        
        Connection con=GetCon.getCon();
       

        
        
        
        try{
        	String url ="jdbc:oracle:thin:@localhost:1521:XE";
        	con = DriverManager.getConnection(url, "system", "root");
        	
        	PreparedStatement ps2=con.prepareStatement("SELECT COUNT (*) FROM trans");

        	 ResultSet rs2=ps2.executeQuery();
        	  
        	int transidLessen=0;
        	 while(rs2.next()){
        		 
        		 transidLessen=rs2.getInt(1) -10; 
        		 System.out.print( "transid inside loop 46"+ transidLessen  );
        	 }

        	  PreparedStatement ps=con.prepareStatement("Select * from trans where transid > ?");
        	  ps.setInt(1,transidLessen);
        	  ResultSet rs=ps.executeQuery();
        	
        	  
        	  //Statement stmt = con.createStatement();
        	//ResultSet rs = stmt.executeQuery ("SELECT * from trans where phone=8726421795");
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	
        	if(rs.next()==false){
        		System.out.println("RESult set is empty");
        	}else{
        		
        		out.print("<table id='trans-table'>");
        		 out.print("<tr>"); 
    			 out.print("<th>Transaction Id </th>");
					 out.print("<th>Transaction time </th>");
					 out.print("<th>Debit </th>");
					 out.print("<th>Credit </th>");
					 out.print("<th>Balance </th>");
    			 out.print("</tr>");
        		do{
        			//int transid = rs.getInt("transid");        			
        			//long phonee = rs.getLong("phone");     
        			//System.out.println("Record present "+ transid);
        			//System.out.println("Record present " + phonee);
        			//out.print("<td>" + transid + "</td>");// Printing transid
                   // out.print("<td>" + phonee + "</td>");// Printing timestmp		
        			System.out.println("Record present ");
        			
        			int transid = rs.getInt("transid");        			
        			Timestamp timestmp = rs.getTimestamp("time");
        			//long phon = rs.getLong("phone");
        			int debit = rs.getInt("debit");
        			int credit = rs.getInt("credit");
        			int balance = rs.getInt("balance");
                    
                    
                    
        			
                    
        			 out.print("<tr>");
                     out.print("<td> trno" + transid + "7890</td>");// Printing transid
                     out.print("<td>" + timestmp + "</td>");// Printing timestmp
                     out.print("<td> &#8377;" + debit + "</td>");// Printing debit
                     out.print("<td> &#8377;" + credit + "</td>");// Printing credit
                     out.print("<td> &#8377;" + balance + "</td>");// Printing balance
                     out.print("</tr>");
                    
                    
 				
        			
        		}while(rs.next());
        		 
        		         	}
        	out.print("</table>");
        }catch (SQLException e) { e.printStackTrace(); }
       
      
    
  
        %>
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
  	
  	<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %> 

</body>

</html>