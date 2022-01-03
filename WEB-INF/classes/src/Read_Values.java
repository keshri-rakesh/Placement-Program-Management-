package Model.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import Model.Student.StudentBean;
import Model.DBConnectivity.DBConnection;

public class Read_Values {

	
	public static void main(String[] args) {
		Read_Values obj_Read_Values=new Read_Values();
		
		obj_Read_Values.get_values();
	}
	
	public List<StudentBean> get_values(){
		
		Connection con = null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		 List<StudentBean> list=new ArrayList<StudentBean>();
		
		try {
			con = DBConnection.createConnection();
			String querry="select * from student";
			ps=con.prepareStatement(querry);		
			rs=ps.executeQuery();
			
			
			while(rs.next()){
				
				StudentBean obj_User_Bean=new StudentBean();
				System.out.println(rs.getString("prn"));
				System.out.println(rs.getString("student_name"));
				System.out.println(rs.getString("std_class"));
				System.out.println(rs.getString("placement_status"));
				System.out.println(rs.getString("company_name"));
				
				
				obj_User_Bean.setprn(rs.getString("prn"));
				obj_User_Bean.setstudentName(rs.getString("student_name"));
				obj_User_Bean.setclass(rs.getString("std_class"));
				obj_User_Bean.setplacementStatus(rs.getString("placement_status"));
				obj_User_Bean.setcompany(rs.getString("company_name"));
				
				list.add(obj_User_Bean);
				
			}
		} catch (Exception e) {
				System.out.println(e);
		}
		return list;
	}
}
