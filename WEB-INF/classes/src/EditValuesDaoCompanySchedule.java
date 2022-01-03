package Model.Company;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import Model.Company.CompanyBean;
import Model.DBConnectivity.DBConnection;
 
public class EditValuesDaoCompanySchedule {
    
	
	public CompanyBean get_value_of_user(String company_id){
		
       
        Connection con = null;
		PreparedStatement ps=null;
		ResultSet rs=null;

		CompanyBean obj_User_Bean=new CompanyBean();
		
		try {
            con = DBConnection.createConnection();
            System.out.println("company_id: "+company_id);
			String querry="select * from company where company_id=?";
			ps=con.prepareStatement(querry);		
			ps.setString(1, company_id);
			rs=ps.executeQuery();
			
			while(rs.next()){	
				obj_User_Bean.setcompany_id(rs.getString("company_id"));
				obj_User_Bean.setcompany_name(rs.getString("company_name"));
				obj_User_Bean.setlanguage(rs.getString("language"));
				obj_User_Bean.setjob_type(rs.getString("job_type"));
				obj_User_Bean.setlocation(rs.getString("location"));
				obj_User_Bean.setstatus(rs.getString("status"));
				obj_User_Bean.setupcoming_date(rs.getString("upcoming_date"));	
			}	
		} catch (Exception e) {
				System.out.println(e);
		}
		return obj_User_Bean;	
	}

	public void edit_user(CompanyBean obj_User_Bean){

		Connection con = null;
		PreparedStatement ps=null;
        String companyid = obj_User_Bean.getcompany_id();
        System.out.println("company_id new: "+companyid);
        String companyname = obj_User_Bean.getcompany_name();
        System.out.println("companyname new: "+companyname);
		String upcoming_date = obj_User_Bean.getupcoming_date();
        System.out.println("upcoming_date new: "+upcoming_date);
        
			 
		try {
            con = DBConnection.createConnection();
			String querryy="insert into schedule(company_id,company_name,language,job_type,location,upcoming_date,time_slot) values(?,?,?,?,?,?,?)";
			ps=con.prepareStatement(querryy);		
			ps.setString(1, obj_User_Bean.getcompany_id());
			ps.setString(2, obj_User_Bean.getcompany_name());
			ps.setString(3, obj_User_Bean.getlanguage());
			ps.setString(4, obj_User_Bean.getjob_type());
			ps.setString(5, obj_User_Bean.getlocation());
			ps.setString(6, obj_User_Bean.getupcoming_date());
			ps.setString(7, obj_User_Bean.gettime_slot());
			ps.executeUpdate();	
		} catch (Exception e) {
				System.out.println(e);
		}	
	}
}