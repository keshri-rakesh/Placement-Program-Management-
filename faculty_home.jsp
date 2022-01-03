<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Model.DBConnectivity.*"%>
<%@page import="Model.Company.Read_ValuesSchedule"%>
<%@page import="Model.Company.ScheduleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
 
  <title>Placement Program Management</title> 
  <script type="text/JavaScript">
    function preventBack(){
      window.history.forward();
    }
    setTimeout("preventBack()",0);
    window.onunload = function () { null };
  </script>
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

      <h1 class="logo me-auto">Welcome <a style="color:	#5DE495; ">${fullname}</a>!</h1>

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
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero_faculty" class="d-flex justify-content-center align-items-center">
    <div class="container position-relative" data-aos="zoom-in" data-aos-delay="100">
      <h1>Learning Today,<br>Leading Tomorrow</h1>
      <h2>Our students are shining around the world.</h2>
      <!--<a href="Login.jsp" class="btn-get-started">Login</a>-->
    </div>
  </section><!-- End Hero -->

  <style>
    /*adding row numbers through css*/
    .css-serial {
        counter-reset: serial-number; /* Set the serial number counter to 0 */
    }
    
        .css-serial td:first-child:before {
            counter-increment: serial-number; /* Increment the serial number counter */
            content: counter(serial-number); /* Display the counter */
        }
    
    </style>

<center style="padding-top: 2%;">
  <h2 style="color: #5DE495;">Scheduled Company Meetings</h2> <br>
  <%
  Read_ValuesSchedule obj_Read_Values=new Read_ValuesSchedule();
  
  List<ScheduleBean> list=obj_Read_Values.get_values(); 
  
  Iterator<ScheduleBean> it_list=list.iterator();

  %>
  <table border="2" style="width: 70%; font-size: 20px;" class="css-serial">
      <tr>
          <th>Sr. No</th><th>Company Name</th><th>Language</th><th>Job Type</th><th>Location</th><th>Date</th><th>Time Slot</th><th>Edit</th><th>Delete</th>
      </tr>
  <%
  while(it_list.hasNext()){
    ScheduleBean obj_User_Bean=new ScheduleBean();
      obj_User_Bean=it_list.next();
  %>
              <tr>	
                      <td></td>
                      <td><%=obj_User_Bean.getcompany_name() %></td>
                      <td><%=obj_User_Bean.getlanguage() %></td>
                      <td><%=obj_User_Bean.getjob_type() %></td>
                      <td><%=obj_User_Bean.getlocation() %></td>
                      <td><%=obj_User_Bean.getupcoming_date() %></td>	
                      <td><%=obj_User_Bean.gettime_slot() %></td>
                      
                      <td>
                      <a href="editSchedule.jsp?company_id=<%=obj_User_Bean.getcompany_id()%>">Edit</a>
                      </td>
                      <td>
                      <a href="delete_controllerSchedule.jsp?company_id=<%=obj_User_Bean.getcompany_id()%>">Delete</a>
                      </td>	  
              </tr>
  <%	 
  }
  %>
  </table> 
</center>

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>Placement Program</h3>
            <p>
              Navarangpura Ahmedabad-380009,
              Gujarat, INDIA. <br><br>
              <strong>office:</strong> 079-12345678, 87456321-43<br>
              <strong>Email:</strong> ppm@yahoo.in<br>
            </p>
          </div>

        </div>
      </div>
    </div>

  </footer><!-- End Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/purecounter/purecounter.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>