package g;
import java.sql.*;


import g.GetCon;
public class RegisterUser {
static int status=0;
//int accountno=1;
public static int register(String firstname,String lastname,String address,long phone,String email,long aadhar, String rcnum, String password, String repassword){

	Connection con=GetCon.getCon();
	PreparedStatement ps;
	try {
		ps = con.prepareStatement("Insert into users values(?,?,?,?,?,?,?,?,?,?,?)");
		int	nextvalue1=GetCon.getPrimaryKey();
		

		ps.setInt(1,nextvalue1);
		ps.setString(2,firstname);
		ps.setString(3,lastname);
		ps.setString(4,address);
		ps.setLong(5,phone);
		ps.setString(6,email);
		ps.setLong(7,aadhar);
		ps.setString(8,rcnum);
		ps.setString(9,password);
		ps.setString(10,repassword);
		ps.setInt(11, 0);
		
		
		status=ps.executeUpdate();
		
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return status;
	
}
}
