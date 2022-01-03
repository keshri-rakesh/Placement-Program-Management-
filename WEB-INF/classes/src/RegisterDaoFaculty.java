package Model.Register;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Model.Register.RegisterBeanFaculty;
import Model.DBConnectivity.DBConnection;
 
public class RegisterDaoFaculty { 
     public String registerUser(RegisterBeanFaculty registerBeanFaculty)
     {
         String fullName = registerBeanFaculty.getFullName();
         String email = registerBeanFaculty.getEmail();
         String password = registerBeanFaculty.getPassword();
         String phone = registerBeanFaculty.getPhone();
         String role = registerBeanFaculty.getRole();
         
         Connection con = null;
         PreparedStatement preparedStatement = null;         
         try
         {
             con = DBConnection.createConnection();
             String query = "insert into candidates(Uid,fullName,email,password,phone,role) values (NULL,?,?,?,?,?)"; //Insert user details into the table 'USERS'
             preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
             preparedStatement.setString(1, fullName);
             preparedStatement.setString(2, email);
             preparedStatement.setString(3, password);
             preparedStatement.setString(4, phone);
             preparedStatement.setString(5, role);
             
             int i= preparedStatement.executeUpdate();
             
             if (i!=0)  //Just to ensure data has been inserted into the database
             return "SUCCESS"; 
         }
         catch(SQLException e)
         {
            e.printStackTrace();
         }       
         return "user already exists...!";  // On failure, send a message from here.
     }
}