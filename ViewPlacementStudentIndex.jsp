<%@page import="Model.DBConnectivity.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.html">Placement Program</a></h1>

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
            <li><a class="active" href="index.html">Home</a></li>
            <li><a href="ViewPlacementStudentIndex.jsp">Placed Students</a></li>
            <li><a href="ViewCompanyStudentIndex.jsp">Companies</a></li>
            <li><a href="student_chartIndex.jsp">Placement Analysis</a></li>
          </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      <a href="Login.jsp" class="get-started-btn">Login</a>

    </div>
  </header><!-- End Header -->

        <br><br><br>
	
    <center style="padding-top: 2%;">
        <h1>Placed Students</h1> <br>
        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by Name..." title="Type in a name" style="width: 50%;"><br><br>
        <%!
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
        %>
        <table border="2" id="myTable">
            <tr>
                <th>PRN</th><th>Student Name</th><th>Class</th><th>Placement Status</th><th>Company</th>
            </tr>
            <%
                con = DBConnection.createConnection();
                String sql = "select * from student where placement_status='placed'";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
            %>
            <tr>
                <td><%=rs.getInt(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><%=rs.getString(4)%></td>
                <td><%=rs.getString(5)%></td>
            </tr>
            <%
                }
            %>
            
        </table><br>
    </center>
    </body>
</html>