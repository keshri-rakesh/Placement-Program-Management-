package Model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import Model.Student.StudentBean;
import Model.DBConnectivity.DBConnection;

public class Insert_Values {
	
	
	public void insert_values(String prn,String student_name,String std_class,String placement_status,String company_name){
		
		Connection con = null;
		PreparedStatement ps=null;
	
		try {
			con = DBConnection.createConnection();
		
			String query="insert into student(prn,student_name,std_class,placement_status,company_name) values(?,?,?,?,?)";
			ps=con.prepareStatement(query);
			ps.setString(1, prn);
			ps.setString(2, student_name);
			ps.setString(3, std_class);
			ps.setString(4, placement_status);
			ps.setString(5, company_name);
			
			ps.executeUpdate();
			
			
			
			
			} catch (Exception e) {
				System.err.println(e);
			}
		 
	}
	
	
	

}
