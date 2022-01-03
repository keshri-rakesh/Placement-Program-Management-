<html>
<head>
    <link rel="stylesheet" type="text/css" href="newlogin.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Placement Program Management</title> 
<script type="text/JavaScript">
  function preventBack(){
    window.history.forward();
  }
  setTimeout("preventBack()",0);
  window.onunload = function () { null };
</script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Favicons             index.html css -->
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

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex justify-content-center align-items-center">
    <div class="container position-relative" data-aos="zoom-in" data-aos-delay="100">
      <h1>Learning Today,<br>Leading Tomorrow</h1>
      <h2>Our students are shining around the world.</h2>
      <!--<a href="Login.jsp" class="btn-get-started">Login</a>-->
    </div>
  </section><!-- End Hero -->

  <main id="main">

  <!-- Register Form -->
<form name="form" action="UploadServletFaculty" method="post" enctype="multipart/form-data" class="box" style="width: 50%;">
    <h1 style="text-transform: capitalize;">Upload File</h1></br>
    <input type="file" name="file" required="" style="color: aliceblue; padding-left: 20%;"/>
    <span style="color:red"><%=(request.getAttribute("errMessage") == null) ? ""
         : request.getAttribute("errMessage")%></span>
    <input type="submit" value="Upload"/>
    <span style="color:green"><%=(request.getAttribute("msg") == null) ? ""
      : request.getAttribute("msg")%></span>
  </form>
  <!-- End of Register Form -->

</body>
</html>