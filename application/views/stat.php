<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<div class="right_col" role="main">
    <!-- top tiles -->
    <div class="row" style="display: inline;">
        <div class="tile_count">
            <div class="col-md-4 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total Vaccinées</span>
              <div class="count"><?php echo $vaccine[0]['nbr']; ?></div>
              
            </div>
            <div class="col-md-4 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i> Total des morts</span>
              <div class="count red"><?php echo $decede[0]['nbr']; ?></div>
             
            </div>
            <div class="col-md-4 col-sm-4  tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> Total des guerie</span>
              <div class="count green"><?php echo $guerie[0]['nbr']; ?></div>
              
            </div>
            
        </div>
    </div>
    <!-- /top tiles -->

    <div style="width:500px">
        <canvas id="myChart" width="400" height="400"></canvas>
        </div>
    <br />

    <script>

const tab = ["Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Aout","Septembre","Octobre","Novembre","Décembre"];

const val = [];

<?php foreach($vacParMois as $el){ ?>
    val.push(<?php echo $el['nbr']; ?>)
 <?php } ?>
      
        const data = {
          labels: tab,
          datasets: [{
            label: 'Nombre de Vaccination Par Mois',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: val,
          }]
        };
      
        const config = {
          type: 'line',
          data: data,
          options: {}
        };
</script>
<script>
    const myChart = new Chart(
      document.getElementById('myChart'),
      config
    );
  </script>


    <div class="row">


        <div class="col-md-4 col-sm-4 ">
            <div class="x_panel tile fixed_height_320">
              <div class="x_title">
                <h2>Statistique Vaccin</h2>
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
                <h4>Nombre d'Infectes par Nom de Vaccin</h4>
                <?php for($i=0;$i<count($vacMarary);$i++) { ?>
                <div class="widget_summary">
                  <div class="w_left w_25">
                    <span><?php echo $vacMarary[$i]['label']; ?></span>
                  </div>
                  <div class="w_center w_55">
                    <div class="progress">
                      <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: <?php echo $vacMarary[$i]['nbr']; ?>%;">
                        <span class="sr-only">60% Complete</span>
                      </div>
                    </div>
                  </div>
                  <div class="w_right w_20">
                    <span><?php echo $vacMarary[$i]['nbr']; ?></span>
                  </div>
                  <div class="clearfix"></div>
                </div>
                <?php } ?>
              </div>
            </div>
        </div>

        <div class="col-md-4 col-sm-4 ">
            <div class="x_panel tile fixed_height_320 overflow_hidden">
                <div class="x_title">
                    <h2>Device Usage</h2>
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
                    <table class="" style="width:100%">
                        <tr>
                            <th style="width:37%;">
                                <p>Top 5</p>
                            </th>
                            <th>
                                <div class="col-lg-7 col-md-7 col-sm-7 ">
                                    <p class="">Device</p>
                                </div>
                                <div class="col-lg-5 col-md-5 col-sm-5 ">
                                    <p class="">Progress</p>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <canvas class="canvasDoughnut" height="140" width="140" style="margin: 15px 10px 10px 0"></canvas>
                            </td>
                            <td>
                                <table class="tile_info">
                                    <tr>
                                        <td>
                                            <p><i class="fa fa-square blue"></i>IOS </p>
                                        </td>
                                        <td>75%</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p><i class="fa fa-square green"></i>Android </p>
                                        </td>
                                        <td>4%</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p><i class="fa fa-square purple"></i>Blackberry </p>
                                        </td>
                                        <td>20%</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p><i class="fa fa-square aero"></i>Symbian </p>
                                        </td>
                                        <td>15%</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p><i class="fa fa-square red"></i>Others </p>
                                        </td>
                                        <td>30%</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    

        </div>

      </div>
