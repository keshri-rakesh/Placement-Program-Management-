<%@page import="Model.Company.EditValuesDaoCompany"%>
<%@page import="Model.Company.CompanyBean"%>

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
			<li><a href="student_chart.jsp">Placement Analysis</a></li>
			<li><a href="logout.jsp">Logout</a></li>
		  </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      <!--<a href="Login.jsp" class="get-started-btn">Login</a>-->

    </div>
  </header><!-- End Header -->


<%
    String company_id=request.getParameter("company_id");
    String company_name=request.getParameter("company_name");
    String language=request.getParameter("language");
	String job_type=request.getParameter("job_type");
	String location=request.getParameter("location");
	String status=request.getParameter("status");
	String upcoming_date=request.getParameter("upcoming_date");


    CompanyBean obj_User_Bean=new CompanyBean();
    obj_User_Bean.setcompany_id(company_id);
    obj_User_Bean.setcompany_name(company_name);
    obj_User_Bean.setlanguage(language);
	obj_User_Bean.setjob_type(job_type);
	obj_User_Bean.setlocation(location);
	obj_User_Bean.setstatus(status);
	obj_User_Bean.setupcoming_date(upcoming_date);
    

    EditValuesDaoCompany obj_Edit_values=new EditValuesDaoCompany();

    obj_Edit_values.edit_user(obj_User_Bean);

%>

<script type="text/javascript">

 window.location.href="http://localhost:8080/ppm/ViewCompanyFaculty.jsp"
</script>


</body>
</html>