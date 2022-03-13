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
                    
                    <div class="col-md-3"></div>
                    <div class="col-md-6">
                    <h6>Nous vous suggérons des vaccins correspondants à vos maladies chroniques  . 
                        Pour mieux vous aider a choisir les vaccins qui vous sont compatibles , 
                        pour mieu prevenir les risques de complications .   </h6>
                        <br>
                        <hr>
                        <br>
                        <div id="wizard" class="form_wizard wizard_horizontal">
                            <div id="step-1">
                                <form class="form-horizontal form-label-left" style="font-size:16px;" action="<?php  echo base_url("VaccinController/getResultProp") ?>" method="post">
                                    <div class="form-group row">
                                        <label class="col-md-3 col-sm-3  control-label">Age
                                            <br>
                                            <small class="text-navy">(Veuillez entrez votre age )</small>
                                        </label>
                                        <div class="col-md-9 col-sm-9 ">
                                            <label>
                                                <input type="number" class="form-control" name="age" required>
                                            </label>
                                            
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label class="col-md-3 col-sm-3  control-label">Maladies
                                            <br>
                                            <small class="text-navy">(Selectioner si vous avez ces maladies)</small>
                                        </label>

                                        <div class="col-md-9 col-sm-9 ">
                                            <div class="checkbox">
                                            <input type="hidden" value="aucun" name="maladie[]">
                                                <?php foreach($maladie as $mal) { ?>
                                                    <label>    
                                                        <input type="checkbox" class="flat" name="maladie[]" value="<?php echo $mal['id']; ?>"><label >  <?php echo "   ". $mal['label'] ; ?></label>
                                                    </label>
                                                    <?php } ?>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <button class="form-control btn-secondary" type="submit">Valider</button>
                                    </div>
                                </form>
                                <?php if(isset($retour)) { 
                                    if (is_string($result)) { ?>
                                    <p style="color:red;"><?php echo $result ?></p>
                                <?php } else { ?> <ul style="  list-style-type: none;">
                                    <p>Liste des vaccins proposés: </p>
                                   
                                        <?php foreach($result as $res) { ?>
                                            <li><span ><?php echo $res['vaccin'] ?></span> <a style="color:red;"><?php echo $res['message'] ?></a></li>
                                        <?php } ?>
                                    </ul>
                                <?php } } ?>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3"></div>
                    
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
