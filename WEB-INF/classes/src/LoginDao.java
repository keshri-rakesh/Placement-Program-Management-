package Model.Login;

import java.rmi.server.SocketSecurityException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sound.sampled.SourceDataLine;

import Model.Login.LoginBean;
import Model.DBConnectivity.*;
 
public class LoginDao {

   String fullname="";
	
     public String authenticateUser(LoginBean loginBean)
     {
         String email = loginBean.getEmail(); //Assign user entered values to temporary variables.
         System.out.println("email: "+email);
         String password = loginBean.getPassword();

         Connection con = null;
         Statement statement = null;
         ResultSet resultSet = null;
 
         String emailDB = "";
         String passwordDB = "";
         String roleDB = "";
         
 
         try
         {
             con = DBConnection.createConnection(); //Fetch database connection object
             statement = con.createStatement(); //Statement is used to write queries. Read more about it
             
             resultSet = statement.executeQuery("select email,password,role,fullname from candidates"); //the table name is candidates and email,password are columns. Fetching all the records and storing in a resultSet.
 
             while(resultSet.next()) // Until next row is present otherwise it return false
             {
              emailDB = resultSet.getString("email"); //fetch the values present in database
              passwordDB = resultSet.getString("password");
              roleDB = resultSet.getString("role");
              fullname = resultSet.getString("fullname");
 
               if(email.equals(emailDB) && password.equals(passwordDB) && roleDB.equals("admin"))
               {
                  return "SUCCESS_ADMIN"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
               }
               if(email.equals(emailDB) && password.equals(passwordDB) && roleDB.equals("student"))
               {
                  return "SUCCESS_STUDENT"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
               }
               if(email.equals(emailDB) && password.equals(passwordDB) && roleDB.equals("faculty"))
               {
                  return "SUCCESS_FACULTY"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
               }
             }
		 }
             catch(SQLException e)
             {
                e.printStackTrace();
             }
             return "Invalid user credentials"; // Return appropriate message in case of failure
     }

     public String getfullname(){
        System.out.println("Dao fullname: "+fullname);
         return fullname;
     }
}