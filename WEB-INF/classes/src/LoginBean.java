package Model.Login;

public class LoginBean
{
     private String email;
     private String password;
 
    public String getEmail() {
       System.out.println("Bean email: "+email);
        return email;
     }
    public void setEmail(String email) {
        this.email = email;
     }
     public String getPassword() {
        return password;
     }
     public void setPassword(String password) {
        this.password = password;
     }
     
}