package Model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import Model.Student.StudentBean;
import Model.DBConnectivity.DBConnection;

public class Delete_values {

	
	public void delete_value(String prn){
		
		Connection con = null;
		PreparedStatement ps=null;
		 
		try {
			con = DBConnection.createConnection();
			String querry="delete from student where prn=?";
			ps=con.prepareStatement(querry);		
			ps.setString(1, prn);
			ps.executeUpdate();
			
		} catch (Exception e) {
				System.out.println(e);
		}
		
	}

}
