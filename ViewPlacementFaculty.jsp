<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Model.DBConnectivity.*"%>
<%@page import="Model.Student.Read_Values"%>
<%@page import="Model.Student.StudentBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Placement Program Management</title> 
        <style>
            tr,td,th{
                padding: 20px;
                text-align: center;
            }
        </style>
        <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
    </head>
    <body>
        <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto">Welcome <a style="color:	#5DE495">${fullname}</a>!</h1>

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
            <li><a class="active" href="faculty_home.jsp">Home</a></li>
            <li><a href="UploadFileFaculty.jsp">Upload Files</a></li>
            <li class="dropdown"><a href="#"><span>View Files</span> <i class="bi bi-chevron-down"></i></a>
              <ul>
                <li><a href="ViewFileFaculty.jsp">Uploaded Files</a></li>
                <li><a href="ViewStudentResumeFaculty.jsp">Student's Resume</a></li>
                <li><a href="ViewStudentOfferFaculty.jsp">Student's Signed Offer Letter</a></li>
              </ul>
            </li>
            <li><a href="ViewPlacementFaculty.jsp">Students</a></li>
            <li><a href="ViewCompanyFaculty.jsp">Companies</a></li>
            <li><a href="ViewScheduleFaculty.jsp">Schedule</a></li>
            <li><a href="student_chartFaculty.jsp">Placement Analysis</a></li>
            <li><a href="logout.jsp">Logout</a></li>
          </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      <!--<a href="Login.jsp" class="get-started-btn">Login</a>-->

    </div>

    <script>
        function myFunction() {
          var input, filter, table, tr, td, i, txtValue;
          input = document.getElementById("myInput");
          filter = input.value.toUpperCase();
          table = document.getElementById("myTable");
          tr = table.getElementsByTagName("tr");
          for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1];
            if (td) {
              txtValue = td.textContent || td.innerText;
              if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
              } else {
                tr[i].style.display = "none";
              }
            }       
          }
        }
        </script>
  </header><!-- End Header -->
        <br><br><br>
        <center style="padding-top: 2%;">
            <h1>Student Details</h1> <br>
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by Names..." title="Type in a name" style="width: 61%;"><br><br>
        <%
        Read_Values obj_Read_Values=new Read_Values();
        
        List<StudentBean> list=obj_Read_Values.get_values(); 
        
        Iterator<StudentBean> it_list=list.iterator();

        %>
        <table border="2" id="myTable">
            <tr>
                <th>PRN</th><th>Student Name</th><th>Class</th><th>Placement Status</th><th>Company</th><th>Edit</th><th>Delete</th>
            </tr>
        <%
        while(it_list.hasNext()){
            StudentBean obj_User_Bean=new StudentBean();
            obj_User_Bean=it_list.next();
        %>
                    <tr>	
                            <td><%=obj_User_Bean.getprn() %></td>
                            <td><%=obj_User_Bean.getstudentName() %></td>
                            <td><%=obj_User_Bean.getclass() %></td>
                            <td><%=obj_User_Bean.getplacementStatus() %></td>
                            <td><%=obj_User_Bean.getcompany() %></td>	
                            
                            <td>
                            <a href="edit.jsp?prn=<%=obj_User_Bean.getprn()%>">Edit</a>
                            </td>
                            <td>
                            <a href="delete_controller.jsp?prn=<%=obj_User_Bean.getprn()%>">Delete</a>
                            </td>	  
                    </tr>
        <%	 
        }
        %>
        </table> 

        <br><a href="insert_values.jsp" class="get-started-btn">Add Student</a><br><br>
    </center>
    
    </body>
</html>