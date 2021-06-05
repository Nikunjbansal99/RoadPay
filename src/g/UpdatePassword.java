package g;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import g.GetCon;
public class UpdatePassword {
static int status=0;


public static int update(String newpass,long phone){
	Connection con=GetCon.getCon();
	PreparedStatement ps;
	try {
		ps = con.prepareStatement("UPDATE users SET password = ? WHERE phone = ?");
		
		
		ps.setString(1,newpass);
	    ps.setLong(2,phone);
		
		        
                System.out.println(phone);
                System.out.println(newpass);
               
                
		
		status=ps.executeUpdate();
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return status;
	
}
}
