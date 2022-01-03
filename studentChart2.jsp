<%@page import="Model.DBConnectivity.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>

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
				<li><a class="active" href="student_home.jsp">Home</a></li>
				<li><a href="ViewFileStudent.jsp">View Files</a></li>
				<li><a href="ViewPlacementStudent.jsp">Placed Students</a></li>
				<li><a href="ViewCompanyStudent.jsp">Companies</a></li>
				<li class="dropdown"><a href="#"><span>Upload File</span> <i class="bi bi-chevron-down"></i></a>
				  <ul>
					<li><a href="UploadResumeStudent.jsp">Upload Resume</a></li>
					<li><a href="UploadOfferStudent.jsp">Upload Signed Offer Letter</a></li>
				  </ul>
				</li>
				<li><a href="student_chartStudent2.jsp">Placement Analysis</a></li>
				<li><a href="logout.jsp">Logout</a></li>
			  </ul>
			<i class="bi bi-list mobile-nav-toggle"></i>
		  </nav><!-- .navbar -->
	
		  <!--<a href="Login.jsp" class="get-started-btn">Login</a>-->
	
		</div>
	  </header><!-- End Header -->
	  
	<div class="container" style="height: 40%; width:50%; padding-top: 6%;">
		<h1><center>Placement Graphical Data</h1>
		<center><form name="chartForm" method="post" action="studentChart2.jsp" >
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
			  <br>
			  Selected Class: <%=request.getParameter("selectedClass") %><br>
			  Selected Batch: <%=request.getParameter("selectedBatch") %> 
			  <!--<a>Class: <span class="output"></span> </a> &emsp14;&emsp14;&emsp14; <a>Batch: </a>
					<script type="text/javascript">
							function getOption() {
								selectElement = document.querySelector('#selclass');
								output = selectElement.value;
								document.querySelector('.output').textContent = output;
							}
					</script>
				-->
			</center>
			
		 <canvas id="myChart"></canvas>
	</div>
	
	<script>	
{
	let myChart=document.getElementById('myChart').getContext('2d');
	var companyName=[];
	var companyValue=[];
	var counter=0;
	
	
	
	<%
		String selClass=request.getParameter("selectedClass");
		String selBatch=request.getParameter("selectedBatch");
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		con = DBConnection.createConnection();
		//int counter=0;
		if(selBatch.equals("2020")){
		String sql = "SELECT company_name, Count(*) FROM student2020 where std_class='"+selClass+"' GROUP BY company_name ";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
	%>
	
	companyName[counter]="<%=rs.getString(1)%>"
	companyValue[counter]="<%=rs.getString(2)%>"
	counter=counter+1;
	
	<%
			}
			}
	%>
	<%
	if(selBatch.equals("2021")){
		String sql = "SELECT company_name, Count(*) FROM student where std_class='"+selClass+"' GROUP BY company_name ";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
	%>
	
	companyName[counter]="<%=rs.getString(1)%>"
	companyValue[counter]="<%=rs.getString(2)%>"
	counter=counter+1;
	
	<%
			}
			}
	%>
	
	//Global Options
	//Chart.defaults.global.defaultFontFamily = 'Lato';
	//Chart.defaults.global.defaultFontSize = 18;
	//Chart.defaults.global.defaultFontSize = '#777';
	
	let studentChart=new Chart(myChart,{
		type:'doughnut',//bar,horizontal,pie,line,doughnut
		data:{
			labels: companyName,
			datasets:[{
				label:'No. Of Students Placed',
				data:companyValue,
				backgroundColor:[
					'rgba(255, 99, 132, 0.7)',
					'rgba(54, 162, 235, 0.7)',
					'rgba(255, 206, 86, 0.7)',
					'rgba(75, 506, 192, 0.7)',
					'rgba(153, 102, 255, 0.7)',
					'rgba(255, 159, 64, 0.7)',
					'rgba(858, 89, 18, 0.7)'
				],
				borderWidth:1,
				borderColor:'#777',
				hoverBorderWidth:3,
				hoverBorderColor:'#000'
			}]
			},
		options:{
			/*title:{
				display:true,
				text:'Number Of Students Placed in different Companies',
				fontSize:25
			},*/
			/*legend:{
				display:false,
				position:'right',
				labels:{
					fontColor:'#000'
				}
			},*/
			layout:{
				padding:{
					left:50,
					right:0,
					bottom:0,
					top:0
				}
			},
		}
	});
	
	}
	</script>
	
	
</body>
</html>