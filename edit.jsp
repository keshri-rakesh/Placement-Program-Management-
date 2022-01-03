<%@page import="Model.Student.EditValuesDao"%>
<%@page import="Model.Student.StudentBean"%>
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
  </header><!-- End Header -->
  <center>
	<br><br><br><br><br>
	<h1>Edit Student Values</h1>
	<%
	String prn=(String)request.getParameter("prn");
	
	EditValuesDao obj_Edit_values=new EditValuesDao();
	
	StudentBean obj_User_Bean=obj_Edit_values.get_value_of_user(prn);
	
	%>
	<table border="2">

	<form action="edit_controller.jsp">
		<center>
		<tr><td style="text-align: right;">PRN:</td><td style="text-align: left;"><input type="text" name="prn" value="<%=prn%>" readonly></td></tr>
		<tr><td style="text-align: right;">Student Name:</td><td style="text-align: left;"><input type="text" name="student_name" value="<%=obj_User_Bean.getstudentName()%>"></td></tr>
	    <tr><td style="text-align: right;">Class:</td><td style="text-align: left;"><input type="text" name="std_class" value="<%=obj_User_Bean.getclass()%>"> </td></tr>
		<tr><td style="text-align: right;">Placement Status:</td><td style="text-align: left;"><select name="placement_status" value="<%=obj_User_Bean.getplacementStatus()%>">
			<option value="placed">placed</option>
			<option value="pending">pending</option></select> </td></tr>
		<tr><td style="text-align: right;">Company:</td><td style="text-align: left;"><input type="text" name="company_name" value="<%=obj_User_Bean.getcompany()%>"></td></tr>
</table> 
	<br><input type="submit" value="Edit" class="get-started-btn"> 
	<a href="http://localhost:8080/ppm/ViewPlacementFaculty.jsp" class="get-started-btn">Cancel</a>
	</form>

</center>
</body>
</html>