package Model.Register;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import Model.Register.RegisterBean;
import Model.DBConnectivity.DBConnection;
 
public class RegisterDao { 
     public String registerUser(RegisterBean registerBean)
     {
         String fullName = registerBean.getFullName();
         String email = registerBean.getEmail();
         String password = registerBean.getPassword();
         String phone = registerBean.getPhone();
         
         Connection con = null;
         PreparedStatement preparedStatement = null;         
         try
         {
             con = DBConnection.createConnection();
             String query = "insert into candidates(Uid,fullName,email,password,phone,role) values (NULL,?,?,?,?,DEFAULT)"; //Insert user details into the table 'candidates'
             preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
             preparedStatement.setString(1, fullName);
             preparedStatement.setString(2, email);
             preparedStatement.setString(3, password);
             preparedStatement.setString(4, phone);
             
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