package Model.Company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import Model.Company.CompanyBean;
import Model.DBConnectivity.DBConnection;;

public class Insert_ValuesCompany {
	
	
	public void insert_values(String company_id,String company_name,String language,String job_type,String location,String status,String upcoming_date){
		
		Connection con = null;
		PreparedStatement ps=null;
	
		try {
			con = DBConnection.createConnection();
		
			String query="insert into company(company_id,company_name,language,job_type,location,status,upcoming_date) values(?,?,?,?,?,?,?)";
			ps=con.prepareStatement(query);
			ps.setString(1, company_id);
			ps.setString(2, company_name);
			ps.setString(3, language);
			ps.setString(4, job_type);
			ps.setString(5, location);
			ps.setString(6, status);
			ps.setString(7, upcoming_date);
			
			ps.executeUpdate();
			
			} catch (Exception e) {
				System.err.println(e);
			}
		 
	}
	
	
	

}
