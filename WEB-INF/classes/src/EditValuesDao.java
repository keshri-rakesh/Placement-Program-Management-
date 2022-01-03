package Model.Student;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import Model.Student.StudentBean;
import Model.DBConnectivity.DBConnection;
 
public class EditValuesDao {
    
	
	public StudentBean get_value_of_user(String prn){
		
       
        Connection con = null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		StudentBean obj_User_Bean=new StudentBean();
		
		try {
            con = DBConnection.createConnection();
            System.out.println("prn: "+prn);
			String querry="select * from student where prn=?";
			ps=con.prepareStatement(querry);		
			ps.setString(1, prn);
			rs=ps.executeQuery();
			
			while(rs.next()){	
				obj_User_Bean.setprn(rs.getString("prn"));
				obj_User_Bean.setstudentName(rs.getString("student_name"));
				obj_User_Bean.setclass(rs.getString("std_class"));
				obj_User_Bean.setplacementStatus(rs.getString("placement_status"));
				obj_User_Bean.setcompany(rs.getString("company_name"));	
			}	
		} catch (Exception e) {
				System.out.println(e);
		}
		return obj_User_Bean;	
	}

	public void edit_user(StudentBean obj_User_Bean){

		Connection con = null;
		PreparedStatement ps=null;
        String prns = obj_User_Bean.getprn();
        System.out.println("Prn stud new: "+prns);
        String pstat = obj_User_Bean.getplacementStatus();
        System.out.println("Placement Status new: "+pstat);
        String comp = obj_User_Bean.getcompany();
        System.out.println("Company new: "+comp);
        
			 
		try {
            con = DBConnection.createConnection();
			String querryy="update student set student_name=?,std_class=?,placement_status=?,company_name=? where prn=?";
			ps=con.prepareStatement(querryy);
			ps.setString(1, obj_User_Bean.getstudentName());
			ps.setString(2, obj_User_Bean.getclass());		
			ps.setString(3, obj_User_Bean.getplacementStatus());
			ps.setString(4, obj_User_Bean.getcompany());
			ps.setString(5, obj_User_Bean.getprn());
			ps.executeUpdate();	
		} catch (Exception e) {
				System.out.println(e);
		}	
	}
}