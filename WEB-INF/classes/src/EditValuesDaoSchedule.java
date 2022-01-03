package Model.Company;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import Model.Company.ScheduleBean;
import Model.DBConnectivity.DBConnection;
 
public class EditValuesDaoSchedule {
    
	
	public ScheduleBean get_value_of_user(String company_id){
		
       
        Connection con = null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		ScheduleBean obj_User_Bean=new ScheduleBean();
		
		try {
            con = DBConnection.createConnection();
            System.out.println("Schedule company_id: "+company_id);
			String querry="select * from schedule where company_id=?";
			ps=con.prepareStatement(querry);		
			ps.setString(1, company_id);
			rs=ps.executeQuery();
			
			while(rs.next()){	
				obj_User_Bean.setcompany_id(rs.getString("company_id"));
				obj_User_Bean.setcompany_name(rs.getString("company_name"));
				obj_User_Bean.setlanguage(rs.getString("language"));
				obj_User_Bean.setjob_type(rs.getString("job_type"));
				obj_User_Bean.setlocation(rs.getString("location"));
				obj_User_Bean.setupcoming_date(rs.getString("upcoming_date"));
				obj_User_Bean.settime_slot(rs.getString("time_slot"));	
			}	
		} catch (Exception e) {
				System.out.println(e);
		}
		return obj_User_Bean;	
	}

	public void edit_user(ScheduleBean obj_User_Bean){

		Connection con = null;
		PreparedStatement ps=null;  
			 
		try {
            con = DBConnection.createConnection();
			String querryy="update schedule set upcoming_date=?,time_slot=? where company_id=?";
			ps=con.prepareStatement(querryy);		
			ps.setString(1, obj_User_Bean.getupcoming_date());
			ps.setString(2, obj_User_Bean.gettime_slot());
			ps.setString(3, obj_User_Bean.getcompany_id());
			ps.executeUpdate();	
		} catch (Exception e) {
				System.out.println(e);
		}	
	}
}