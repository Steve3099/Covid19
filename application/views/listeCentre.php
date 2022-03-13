<div class="right_col" role="main">
    <div class="">
      <div class="page-title">
        <div class="title_left">
          <h3>Liste Centres </h3>
        </div>

        <div class="title_right">
          <div class="col-md-5 col-sm-5   form-group pull-right top_search">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Rechercher ...">
              <span class="input-group-btn">
                <button class="btn btn-secondary" type="button">Aller!</button>
              </span>
            </div>
          </div>
        </div>
      </div>

      <div class="clearfix"></div>

      <div class="row">
        <div class="col-md-12 col-sm-12  ">
          <div class="x_panel" style="height:600px;">
            <div class="x_title">
              <h2>Liste des centres disponibles</h2>
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
              <div class="row">

                <div class="col-md-12">
                <?php for($i=0;$i<count($listeCentres);$i++) {?>
                  <!-- price element -->
                  <div class="col-md-3 col-sm-6  ">
                    <div class="pricing">
                      <div class="title">
                        <h2><?php echo $listeCentres[$i]['nomCentre'] ?> </h2>
                      </div>
                      <div class="x_content">
                        <div class="">
                          <div class="pricing_features">
                            <ul class="list-unstyled text-left">
                            <?php if(count($listeCentres[$i]['nomVaccin'])==0) { ?>
                                <i class="fa fa-times text-danger"></i> Aucun vaccin disponible pour le moment
                            <?php }else { ?>
                              <p>Liste des vaccins disponibles : </p>
                              <hr>
                            <?php }?>
                            <?php for($c=0;$c<count($listeCentres[$i]['nomVaccin']);$c++) { ?> 
                              <li><i class="fa fa-check text-success"></i><?php echo $listeCentres[$i]['nomVaccin'][$c]['nomVaccin'] ?></li>
                              <?php }?>
                            </ul>
                          </div>
                        </div>
                        <div class="pricing_footer">
                          <a href="<?php echo base_url("ReservationController") ?>" class="btn btn-secondary btn-block" role="button">Reserver  <span>  maintenant !</span></a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- price element -->
                  <?php }?>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>