package Controller;

import java.io.IOException;  
import java.io.PrintWriter;  
import javax.servlet.*; 
import javax.servlet.http.*;
import Model.Login.LoginBean;
import Model.Login.LoginDao;
 
public class LoginServlet extends HttpServlet {
 
    public LoginServlet() // default constructor
    {
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Here username and password are the names which I have given in the input box in Login.jsp page. Here I am retrieving the values entered by the user and keeping in instance variables for further use.
 
        String email = request.getParameter("email");
        String password = request.getParameter("password");
 
        LoginBean loginBean = new LoginBean(); //creating object for LoginBean class, which is a normal java class, contains just setters and getters. Bean classes are efficiently used in java to access user information wherever required in the application.
 
        loginBean.setEmail(email); //setting the username and password through the loginBean object then only you can get it in future.
         loginBean.setPassword(password);
 
        LoginDao loginDao = new LoginDao(); //creating object for LoginDao. This class contains main logic of the application.
        String userValidate = loginDao.authenticateUser(loginBean); //Calling authenticateUser function
        String fullname = loginDao.getfullname();
        System.out.println("LoginServlet fullname: "+fullname);

        HttpSession session = request.getSession();

        if(userValidate.equals("SUCCESS_ADMIN")) //If function returns success string then user will be rooted to Home page
         {    
             //request.setAttribute("email", email); //with setAttribute() you can define a "key" and value pair so that you can get it in future using getAttribute("key")
             session.setAttribute("fullname", fullname);
             request.getRequestDispatcher("/admin.jsp").forward(request, response);//RequestDispatcher is used to send the control to the invoked page.
             request.getRequestDispatcher("/RegisterFaculty.jsp").forward(request, response);
         }
         else if(userValidate.equals("SUCCESS_STUDENT")) //If function returns success string then user will be rooted to Home page
         {
             System.out.println("if statement fullname: "+fullname);
             session.setAttribute("fullname", fullname);
             request.getRequestDispatcher("/student_home.jsp").forward(request, response);//RequestDispatcher is used to send the control to the invoked page.
         }
         else if(userValidate.equals("SUCCESS_FACULTY")) //If function returns success string then user will be rooted to Home page
         {
             System.out.println("if statement faculty fullname: "+fullname);
             session.setAttribute("fullname", fullname);
             request.getRequestDispatcher("/faculty_home.jsp").forward(request, response);//RequestDispatcher is used to send the control to the invoked page.
         }
         else
         {
             request.setAttribute("errMessage", userValidate); //If authenticateUser() function returnsother than SUCCESS string it will be sent to Login page again. Here the error message returned from function has been stored in a errMessage key.
             request.getRequestDispatcher("/Login.jsp").forward(request, response);//forwarding the request
         }
    }
}