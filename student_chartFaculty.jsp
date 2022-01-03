<%@page import="Model.DBConnectivity.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compitable" content="ie=edge">
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.6.2/dist/chart.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
	
	<title>Placement Program Management</title> 

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
	  
	<div class="container" style="height: 40%; width:50%; padding-top: 6%;">
		<h1><center>Placement Graphical Data</h1>
			<center><form name="chartForm" method="post" action="studentChartFaculty2.jsp" >
				<label> Select Class </label>  
				  <select name="selectedClass">  
				  <option value = "MCA3"> MCA3  </option>  
				  <option value = "MCA5"> MCA5  </option>  
				  <option value = "Msc AIML"> Msc AIML  </option>  
				  </select>  
				  <!--<%= request.getParameter("selectedClass")%>-->
				  <label> Select Batch </label>  
				  <select name="selectedBatch">  
				  <option value = "2021"> 2021  </option>  
				  <option value = "2020"> 2020  </option>  
				  </select>
				  <!--<%= request.getParameter("selectedBatch")%>-->
				  <input type="submit">
				 
			  </form>
			</center>
	</div>
	
</body>
</html>