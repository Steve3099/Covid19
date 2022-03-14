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

        <div style="width:500px">
        <canvas id="myChart2" width="400" height="400"></canvas>
        </div>


    <br />

    <script>


const tab2 = [];

const val2 = [];


<?php foreach($vacParResultat as $el){ ?>
    tab2.push('<?php echo $el['resultat']; ?>')
 <?php } ?>
      
<?php foreach($vacParResultat as $el){ ?>
    val2.push(<?php echo $el['nb']; ?>)
 <?php } ?>
      
        const data2 = {
          labels: tab2,
          datasets: [{
            label: 'Nombre par Résultat Vaccination',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: val2,
          }]
        };
      
        const config2 = {
  type: 'bar',
  data: data2,
  options: {
    scales: {
      y: {
        beginAtZero: true
      }
    }
  },
};
</script>
<script>
    const myChart2 = new Chart(
      document.getElementById('myChart2'),
      config2
    );
  </script>

        </div>

      </div>
