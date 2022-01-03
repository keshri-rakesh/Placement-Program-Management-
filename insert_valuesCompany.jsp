<%@page import="java.util.Iterator"%>
<%@page import="Model.Company.CompanyBean"%>
<%@page import="java.util.List"%>
<%@page import="Model.Company.Read_ValuesCompany"%>
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
		function validate()
		{ 
			 var company_name = document.form.company_name.value;
			 var language = document.form.language.value; 
			 var job_type = document.form.job_type.value;
			 var location = document.form.location.value;
			 var upcoming_date = document.form.upcoming_date.value;
			 
			 if (company_name==null || company_name=="")
			 { 
			 alert("Company Name can't be blank"); 
			 return false; 
			 }
			 else if (language==null || language=="")
			 { 
			 alert("Language can't be blank"); 
			 return false; 
			 }
			 else if (job_type==null || job_type=="")
			 { 
			 alert("Job type can't be blank"); 
			 return false; 
			 }
			 else if (location==null || location=="")
			 { 
			 alert("Location can't be blank"); 
			 return false; 
			 }
			 else if (upcoming_date==null || upcoming_date=="")
			 { 
			 alert("Date can't be blank"); 
			 return false; 
			 }
		 } 
		</script> 
		<script>
			$( function() {
				$.datepicker.setDefaults({
			onClose:function(date, inst){
				$("#datepicker").html(date);
			}
		});
				$( "#datepicker" ).datepicker({ dateFormat: 'yy-mm-dd' });
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
<h1>Add Company Details</h1>
<table border="2">
<form name="form" action="insert_controllerCompany.jsp" onsubmit="return validate()">

		<tr><td style="text-align: right;">Company Name:</td><td style="text-align: left;"><input type="text" name="company_name"></td></tr>
	    <tr><td style="text-align: right;">Language:</td><td style="text-align: left;"><select name="language">
			<option value="Java">Java</option>
			<option value="Python">Python</option>
			<option value=".Net">.Net</option>
			<option value="Android">Android</option></select> </td></tr>
		<tr><td style="text-align: right;">Job Type:</td><td style="text-align: left;"><select name="job_type">
			<option value="FullTime">FullTime</option>
			<option value="Intern">Intern</option></select> </td></tr>
		<tr><td style="text-align: right;">Location:</td><td style="text-align: left;"><input type="text" name="location"></td></tr>
		<tr><td style="text-align: right;">Status:</td><td style="text-align: left;"><select name="status">
			<option value="upcoming">upcoming</option>
			<option value="done">done</option></select> </td></tr>
			<tr><td style="text-align: right;">Date:</td><td style="text-align: left;"><input type="text" id="datepicker" name="upcoming_date"></td>
	</table>
<br><input type="submit" value="Insert" class="get-started-btn">
<a href="http://localhost:8080/ppm/ViewCompanyFaculty.jsp" class="get-started-btn">Cancel</a>
</form>

</center>

</body>
</html>