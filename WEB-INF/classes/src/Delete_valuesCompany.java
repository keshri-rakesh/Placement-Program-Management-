package Model.Company;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
import Model.Company.CompanyBean;
import Model.DBConnectivity.DBConnection;

public class Delete_valuesCompany {

	
	public void delete_value(String company_id){
		
		Connection con = null;
		PreparedStatement ps=null;
		 
		try {
			con = DBConnection.createConnection();
			String querry="delete from company where company_id=?";
			ps=con.prepareStatement(querry);		
			ps.setString(1, company_id);
			ps.executeUpdate();
			
		} catch (Exception e) {
				System.out.println(e);
		}
		
	}

}
