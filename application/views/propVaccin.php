<!-- page content -->
<div class="right_col" role="main">
    <div class="">
    <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-12 col-sm-12 ">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Proposition Vaccination </h2>
                    
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                    <!-- Smart Wizard -->
                    <p>Nous vous suggérons des vaccins correspondants à vos informations.</p>
                        <div id="wizard" class="form_wizard wizard_horizontal">
                            <div id="step-1">
                                <form class="form-horizontal form-label-left" style="font-size:16px;" action="<?php  echo base_url("VaccinController/getResultProp") ?>" method="post">
                                    <div class="form-group row">
                                        <label class="col-form-label col-md-3 col-sm-3 label-align" >Age: </label>
                                        <div class="col-md-2 col-sm-2 ">
                                              <input type="number" class="form-control" name="age" required>
                                        </div>
                                    </div>
                                        <label class="col-form-label col-md-3 col-sm-3 label-align">Maladies:</label>
                                    <div class="form-group row">
                                    <input type="hidden" value="aucun" name="maladie[]">
                                            <?php foreach($maladie as $mal) { ?>
                                                <input type="checkbox" class="flat" name="maladie[]" value="<?php echo $mal['id']; ?>"><label ><?php echo $mal['label']; ?></label>
                                            <?php } ?>
                                    </div>
                                    <div class="form-group row">
                                        <button class="form-control" type="submit">Valider</button>
                                    </div>
                                </form>
                                <?php if(isset($retour)) { 
                                    if (is_string($result)) { ?>
                                    <p style="color:red;"><?php echo $result ?></p>
                                <?php } else { ?> <ul style="  list-style-type: none;">
                                    <p>Liste des vaccins proposés: </p>
                                   
                                        <?php foreach($result as $res) { ?>
                                            <li><?php echo $res['vaccin'] ?> <a style="color:red;"><?php echo $res['message'] ?></a></li>
                                        <?php } ?>
                                    </ul>
                                <?php } } ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
        <!-- /page content -->

    <!-- jQuery -->
    <script src="<?php echo site_url("assets/vendors/jquery/dist/jquery.min.js") ?>" ></script>
    <!-- Bootstrap -->
   <script src="<?php echo site_url("assets/vendors/bootstrap/dist/js/bootstrap.bundle.min.js") ?>" ></script>
    <!-- FastClick -->
    <script src="<?php echo site_url("assets/vendors/fastclick/lib/fastclick.js") ?>" ></script>
    <!-- NProgress -->
    <script src="<?php echo site_url("assets/vendors/nprogress/nprogress.js") ?>" ></script>
    <!-- jQuery Smart Wizard -->
    <script src="<?php echo site_url("assets/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js") ?>" ></script>
    <!-- Custom Theme Scripts -->
    <script src="<?php echo site_url("assets/build/js/custom.min.js") ?>" ></script>
