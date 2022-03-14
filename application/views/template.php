<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <!-- Meta, title, CSS, favicons, etc. -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="<?php echo site_url("assets/images/vaccin.png") ?>" type="image/ico" />

  <title>Vaccin </title>

  <!-- Bootstrap -->
  <link href="<?php echo site_url("assets/vendors/bootstrap/dist/css/bootstrap.min.css") ?>" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="<?php echo site_url("assets/vendors/font-awesome/css/font-awesome.min.css") ?>" rel="stylesheet">
  <!-- NProgress -->
  <link href="<?php echo site_url("assets/vendors/nprogress/nprogress.css") ?>" rel="stylesheet">
  <!-- iCheck -->
  <link href="<?php echo site_url("assets/vendors/iCheck/skins/flat/green.css") ?>" rel="stylesheet">

  <!-- bootstrap-progressbar -->
  <link href="<?php echo site_url("assets/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css") ?>" rel="stylesheet">
  <!-- JQVMap -->
  <link href="<?php echo site_url("assets/vendors/jqvmap/dist/jqvmap.min.css") ?>" rel="stylesheet" />
  <!-- bootstrap-daterangepicker -->
  <link href="<?php echo site_url("assets/vendors/bootstrap-daterangepicker/daterangepicker.css") ?>" rel="stylesheet">

  <!-- Custom Theme Style -->
  <link href="<?php echo site_url("assets/build/css/custom.min.css") ?>" rel="stylesheet">
</head>

<body class="nav-md">
  <div class="container body">
    <div class="main_container">
      <div class="col-md-3 left_col">
        <div class="left_col scroll-view">
          <div class="navbar nav_title" style="border: 0;">
            <a href="index.html" class="site_title"><i class="fa fa-empire"></i> <span>Vaccination </span></a>
          </div>

          <div class="clearfix"></div>

          <!-- menu profile quick info -->
          <div class="profile clearfix">
            <div class="profile_pic">
              <img src="<?php echo site_url("assets/images/vaccin.png") ?>" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
              <span></span>
              <h2>Covid 19 </h2>
            </div>
          </div>
          <!-- /menu profile quick info -->

          <br />

          <!-- sidebar menu -->
          <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
              <h3>General</h3>
              <ul class="nav side-menu">
                <li><a href="<?php echo base_url("StatistiqueController") ?>"><i class="fa fa-bar-chart-o"></i>   Statistiques </a>
                </li> 
                <li><a href="<?php echo base_url("ReservationController") ?>"><i class="fa fa-edit"></i> Reservation</a>
                </li>
                <li> <a href="<?php echo base_url("VaccinController") ?>"><i class="fa fa-search-plus"></i> Proposition</a>
                </li>
                <li> <a href="<?php echo base_url("CentreController") ?>"><i class="fa fa-university"></i> Liste des centres</a>
                </li>
                <li> <a href="<?php echo base_url("ArticleController") ?>"><i class="fa fa-newspaper-o"></i> Nouvelles</a>
                </li>
              </ul>
            </div>

          </div>
          <!-- /sidebar menu -->

          <!-- /menu footer buttons -->
          <div class="sidebar-footer hidden-small">
            <a data-toggle="tooltip" data-placement="top" title="Settings">
              <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="FullScreen">
              <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Lock">
              <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
            </a>
            <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
              <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
            </a>
          </div>
          <!-- /menu footer buttons -->
        </div>
      </div>

      <!-- top navigation -->
      <div class="top_nav">
        <div class="nav_menu">
          <div class="nav toggle">
            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
          </div>
          <nav class="nav navbar-nav">
            
          </nav>
        </div>
      </div>
      <!-- /top navigation -->

      <!-- page content -->
      
      <?php  include($view.".php"); ?>
      <!-- /page content -->

      <!-- footer content -->
      <footer>
        <div class="pull-right">
          Vaccination Inf by <a href="">Teams</a>
        </div>
        <div class="clearfix"></div>
      </footer>
      <!-- /footer content -->
    </div>
  </div>

  <!-- jQuery -->
  <script src="<?php echo site_url("assets/vendors/jquery/dist/jquery.min.js") ?>"></script>
  <!-- Bootstrap -->
  <script src="<?php echo site_url("assets/vendors/bootstrap/dist/js/bootstrap.bundle.min.js") ?>"></script>
  <!-- FastClick -->
  <script src="<?php echo site_url("assets/vendors/fastclick/lib/fastclick.js") ?>"></script>
  <!-- NProgress -->
  <script src="<?php echo site_url("assets/vendors/nprogress/nprogress.js") ?>"></script>
  <!-- Chart.js -->
  <script src="<?php echo site_url("assets/vendors/Chart.js/dist/Chart.min.js") ?>"></script>
  <!-- gauge.js -->
  <script src="<?php echo site_url("assets/vendors/gauge.js/dist/gauge.min.js") ?>"></script>
  <!-- bootstrap-progressbar -->
  <script src="<?php echo site_url("assets/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js") ?>"></script>
  <!-- iCheck -->
  <script src="<?php echo site_url("assets/vendors/iCheck/icheck.min.js") ?>"></script>
  <!-- Skycons -->
  <script src="<?php echo site_url("assets/vendors/skycons/skycons.js") ?>"></script>
  <!-- Flot -->
  <script src="<?php echo site_url("assets/vendors/Flot/jquery.flot.js") ?>"></script>
  <script src="<?php echo site_url("assets/vendors/Flot/jquery.flot.pie.js") ?>"></script>
  <script src="<?php echo site_url("assets/vendors/Flot/jquery.flot.time.js") ?>"></script>
  <script src="<?php echo site_url("assets/vendors/Flot/jquery.flot.stack.js") ?>"></script>
  <script src="<?php echo site_url("assets/vendors/Flot/jquery.flot.resize.js") ?>"></script>
  <!-- Flot plugins -->
  <script src="<?php echo site_url("assets/vendors/flot.orderbars/js/jquery.flot.orderBars.js") ?>"></script>
  <script src="<?php echo site_url("assets/vendors/flot-spline/js/jquery.flot.spline.min.js") ?>"></script>
  <script src="<?php echo site_url("assets/vendors/flot.curvedlines/curvedLines.js") ?>"></script>
  <!-- DateJS -->
  <script src="<?php echo site_url("assets/vendors/DateJS/build/date.js") ?>"></script>
  <!-- JQVMap -->
  <script src="<?php echo site_url("assets/vendors/jqvmap/dist/jquery.vmap.js") ?>"></script>
  <script src="<?php echo site_url("assets/vendors/jqvmap/dist/maps/jquery.vmap.world.js") ?>"></script>
  <script src="<?php echo site_url("assets/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js") ?>"></script>
  <!-- bootstrap-daterangepicker -->
  <script src="<?php echo site_url("assets/vendors/moment/min/moment.min.js") ?>"></script>
  <script src="<?php echo site_url("assets/vendors/bootstrap-daterangepicker/daterangepicker.js") ?>"></script>

  <!-- Custom Theme Scripts -->
  <script src="<?php echo site_url("assets/build/js/custom.min.js") ?>"></script>

</body>

</html>