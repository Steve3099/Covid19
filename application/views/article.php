        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div >
              <div class="x_panel">
                <div class="x_title">
                  <h2>Dernière nouvelle à propos du <small>COVID-19</small></h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                 
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Settings 1</a>
                            <a class="dropdown-item" href="#">Settings 2</a>
                          </div>
                      </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="col-md-9"> 
                    <ul class="list-unstyled timeline">
                      <?php foreach ($article as $ar) { ?>
                        <li>
                          <div class="block">
                            <div class="tags">
                              <a href="" class="tag">
                                <span><?php echo $ar['date'] ?></span>
                              </a>
                            </div>
                            <div class="block_content">
                              <h2 class="title">
                                              <a><?php echo $ar['titre'] ?></a>
                                          </h2>
                              <div class="byline">
                                <span>
                                <?php 
                                  $r = strtotime(date("Y-m-d")) - strtotime($ar['date']);
                                  $r = floor($r/ (365 * 60 * 60 * 24));
                                  if($r!=0){
                                      echo "il y a ".$r." ans";
                                    } 
                                    else
                                    {
                                      echo "cette année";
                                    }
                                ?></span>
                              </div>
                              <p class="excerpt"><?php echo $ar['texte'] ?>
                              </p>
                            </div>
                          </div>
                        </li>
                    <?php } ?>
                    </ul>
                  </div>
                  <div class="col-md-3">
                    <?php foreach ($article as $ar) { ?>
                      <img width=170 src="<?php echo site_url("assets/images/covid.jpg") ?>" /><hr>
                    <?php } ?>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="clearfix"></div>
        </div>
        <!-- /page content -->

    <!-- jQuery -->
    <script src="<?php echo site_url("assets/vendors/jquery/dist/jquery.min.js") ?>" ></script>
    <!-- Bootstrap -->
   <script src="<?php echo site_url("assets/vendors/bootstrap/dist/js/bootstrap.bundle.min.js") ?>" >   </script>
    <!-- FastClick -->
    <script src="<?php echo site_url("assets/vendors/fastclick/lib/fastclick.js") ?>" >  </script>
    <!-- NProgress -->
    <script src="<?php echo site_url("assets/vendors/nprogress/nprogress.js") ?>" > </script>
    <!-- bootstrap-progressbar -->
    <script src="<?php echo site_url("assets/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js") ?>" > </script>
    <!-- iCheck -->
    <script src="<?php echo site_url("assets/vendors/iCheck/icheck.min.js") ?>" >   </script>
    <!-- PNotify -->
    <script src="<?php echo site_url("assets/vendors/pnotify/dist/pnotify.js") ?>" > </script>
    <script src="<?php echo site_url("assets/vendors/pnotify/dist/pnotify.buttons.js") ?>" > </script>
    <script src="<?php echo site_url("assets/vendors/pnotify/dist/pnotify.nonblock.js") ?>" > </script>

    <!-- Custom Theme Scripts -->
    <script src="<?php echo site_url("assets/build/js/custom.min.js") ?>" > </script>
	
  </body>
</html>