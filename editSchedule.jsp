<%@page import="Model.Company.EditValuesDaoSchedule"%>
<%@page import="Model.Company.ScheduleBean"%>
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

	  <!--Date Picker-->
	  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
      <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	  <!-- Main CSS File -->
	  <link href="assets/css/style.css" rel="stylesheet">
	  
	  <script>
			$( function() {
				$.datepicker.setDefaults({
			onClose:function(date, inst){
				$("#datepicker").html(date);
			}
		});
				$( "#datepicker" ).datepicker({ minDate:0, dateFormat: 'yy-mm-dd' });
			});
	  </script>
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
	<h1>Edit Schedule Details</h1>
	<%
		String company_id=(String)request.getParameter("company_id");
		
		EditValuesDaoSchedule obj_Edit_values=new EditValuesDaoSchedule();
		
		ScheduleBean obj_User_Bean=obj_Edit_values.get_value_of_user(company_id);
	
	%>
	<table border="2">

	<form action="edit_controllerSchedule.jsp">
		<center>
		<tr><td style="text-align: right;">Sr. No:</td><td style="text-align: left;"><input type="text" name="company_id" value="<%=company_id%>" readonly></td></tr>
		<tr><td style="text-align: right;">Company Name:</td><td style="text-align: left;"><input type="text" name="company_name" value="<%=obj_User_Bean.getcompany_name()%>" readonly></td></tr>
	    <tr><td style="text-align: right;">Language:</td><td style="text-align: left;"><input type="text" name="language" value="<%=obj_User_Bean.getlanguage()%>" readonly> </td></tr>
		<tr><td style="text-align: right;">Job Type:</td><td style="text-align: left;"><input type="text" name="job_type" value="<%=obj_User_Bean.getjob_type()%>" readonly> </td></tr>
		<tr><td style="text-align: right;">Location:</td><td style="text-align: left;"><input type="text" name="location" value="<%=obj_User_Bean.getlocation()%>" readonly></td></tr>
		<tr><td style="text-align: right;">Date:</td><td style="text-align: left;"><input type="text" id="datepicker" name="upcoming_date" value="<%=obj_User_Bean.getupcoming_date()%>"></td>
		<tr><td style="text-align: right;">Time Slot:</td><td style="text-align: left;"><select name="time_slot" value="<%=obj_User_Bean.gettime_slot()%>">
				<option value="<%=obj_User_Bean.gettime_slot()%>"><%=obj_User_Bean.gettime_slot()%></option>
				<option value="11:00">11:00</option>
				<option value="14:00">14:00</option></select> </td></tr>
</table> 
	<br><input type="submit" value="Edit" class="get-started-btn"> 
	<a href="http://localhost:8080/ppm/faculty_home.jsp" class="get-started-btn">Cancel</a>
	</form>

</center>
</body>
</html>