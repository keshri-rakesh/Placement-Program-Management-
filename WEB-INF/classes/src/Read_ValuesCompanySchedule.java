package Model.Company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import Model.Company.CompanyBean;
import Model.DBConnectivity.DBConnection;

public class Read_ValuesCompanySchedule {

	
	public static void main(String[] args) {
		Read_ValuesCompanySchedule obj_Read_Values=new Read_ValuesCompanySchedule();
		
		obj_Read_Values.get_values();
	}
	
	public List<CompanyBean> get_values(){
		
		Connection con = null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		 List<CompanyBean> list=new ArrayList<CompanyBean>();
		
		try {
			con = DBConnection.createConnection();
			String querry="select * from company where status='upcoming'";
			ps=con.prepareStatement(querry);		
			rs=ps.executeQuery();
			
			
			while(rs.next()){
				
				CompanyBean obj_User_Bean=new CompanyBean();
				System.out.println(rs.getString("company_id"));
				System.out.println(rs.getString("company_name"));
				System.out.println(rs.getString("language"));
				System.out.println(rs.getString("job_type"));
				System.out.println(rs.getString("location"));
				System.out.println(rs.getString("status"));
				System.out.println(rs.getString("upcoming_date"));
				
				
				obj_User_Bean.setcompany_id(rs.getString("company_id"));
				obj_User_Bean.setcompany_name(rs.getString("company_name"));
				obj_User_Bean.setlanguage(rs.getString("language"));
				obj_User_Bean.setjob_type(rs.getString("job_type"));
				obj_User_Bean.setlocation(rs.getString("location"));
				obj_User_Bean.setstatus(rs.getString("status"));
				obj_User_Bean.setupcoming_date(rs.getString("upcoming_date"));
				
				list.add(obj_User_Bean);
				
			}
		} catch (Exception e) {
				System.out.println(e);
		}
		return list;
	}
}
