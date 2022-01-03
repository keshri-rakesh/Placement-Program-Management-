package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
 
import Model.Register.RegisterBean;
import Model.Register.RegisterDao;
 
public class RegisterServlet extends HttpServlet {

   JFrame f = new JFrame();
 
     public RegisterServlet() {
     }
 
     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Copying all the input parameters in to local variables
         String fullName = request.getParameter("fullname");
         String email = request.getParameter("email");
         String password = request.getParameter("password");
         String phone = request.getParameter("phone");
        //String role = request.getParameter("role");

         
         RegisterBean registerBean = new RegisterBean();
        //Using Java Beans - An easiest way to play with group of related data
         registerBean.setFullName(fullName);
         registerBean.setEmail(email);
         registerBean.setPassword(password); 
         registerBean.setPhone(phone);
         
         RegisterDao registerDao = new RegisterDao();
         
        //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
         String userRegistered = registerDao.registerUser(registerBean);
         
         if(userRegistered.equals("SUCCESS"))   //On success, you can display a message to user on Home page
         {
            request.setAttribute("successMessage", userRegistered);
            request.getRequestDispatcher("/index.html").forward(request, response);
         }
         else   //On Failure, display a meaningful message to the User.
         {
            request.setAttribute("errMessage", userRegistered);
            request.getRequestDispatcher("/Register.jsp").forward(request, response);
         }
     }
}