<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Reservation de Vaccination </h3>
            </div>

            <div class="title_right">

            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">

            <div class="x_panel">
                <div class="x_title">
                    <h2>Formulaire de reservation de vaccin <small>S'inscrire pour eviter la queue</small></h2>
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
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div class="x_content">
                        <br />
                        <form class="form-label-left input_mask" method="post" action="<?php echo base_url("ReservationController/insertReservation") ?>">

                            <div class="col-md-6 col-sm-6  form-group has-feedback">
                                <input type="text" class="form-control has-feedback-left" id="inputSuccess2" name="nom" placeholder="Nom " value="nom">
                                <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                            </div>

                            <div class="col-md-6 col-sm-6  form-group has-feedback">
                                <input type="text" class="form-control" id="inputSuccess3" name="prenom" placeholder="Prenom" value="prenom">
                                <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                            </div>

                            <div class="col-md-6 col-sm-6  form-group has-feedback">
                                <input type="email" class="form-control has-feedback-left" name="email" id="inputSuccess4" placeholder="Email" value="princia@yahoo.com">
                                <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>
                            </div>

                            <div class="col-md-6 col-sm-6  form-group has-feedback">
                                <input type="tel" class="form-control" id="inputSuccess5" name="numero" placeholder="Telephone" value="0324568576">
                                <span class="fa fa-phone form-control-feedback right" aria-hidden="true"></span>
                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-md-3 col-sm-3 ">Date de Naissance <span class="required">*</span>
                                </label>
                                <div class="col-md-9 col-sm-9 ">
                                    <input class="date-picker form-control" placeholder="dd-mm-yyyy" name="dateNaissance" type="text" onfocus="this.type='date'" onmouseover="this.type='date'" onclick="this.type='date'" onblur="this.type='text'" onmouseout="timeFunctionLong(this)">
                                    <script>
                                        function timeFunctionLong(input) {
                                            setTimeout(function() {
                                                input.type = 'text';
                                            }, 60000);
                                        }
                                    </script>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-md-3 col-sm-3">Sexe</label>
                                <div class="col-md-6 col-sm-6 ">
                                    <label> <input type="radio" class="flat" name="sexe" value="H">Homme</label>
                                    <label><input type="radio" class="flat" name="sexe" value="F">Femme</label>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-md-3 col-sm-3 ">CIN</label>
                                <div class="col-md-9 col-sm-9 ">
                                    <input type="text" class="form-control" name="cin" placeholder="CIN" data-inputmask=" 'mask' : '(999) 999-9999' " value="1234556676">
                                    <span class=" fa fa-user form-control-feedback right" aria-hidden="true"></span>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="col-form-label col-md-3 col-sm-3 ">Adresse</label>
                                <div class="col-md-9 col-sm-9 ">
                                    <input type="text" class="form-control" name="adresse" placeholder="Adresse" value="adresse">
                                </div>
                            </div>

                            <div class="form-group row">
                                <label class="control-label col-md-3 col-sm-3 ">Centre</label>
                                <div class="col-md-9 col-sm-9 ">
                                    <select class="select2_single form-control" tabindex="-1" name="idCentre" value="1">
                                        <?php for ($i = 0; $i < count($centres); $i++) { ?>
                                            <option value="<?php echo $centres[$i]['id'] ?>"><?php echo $centres[$i]['label'] ?></option>
                                        <?php } ?>

                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="control-label col-md-3 col-sm-3 ">Vaccin </label>
                                <div class="col-md-9 col-sm-9 ">
                                    <select class="select2_single form-control" tabindex="-1" name="idVaccin" value="1">
                                        <?php for ($i = 0; $i < count($vaccins); $i++) { ?>
                                            <option value="<?php echo $vaccins[$i]['id'] ?>"><?php echo $vaccins[$i]['label'] ?></option>
                                        <?php } ?>

                                    </select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-form-label col-md-3 col-sm-3 ">Date prévue de vaccination<span class="required">*</span>
                                </label>
                                <div class="col-md-9 col-sm-9 ">
                                    <input class="date-picker form-control" placeholder="dd-mm-yyyy" name="dateVaccin" type="text" onfocus="this.type='date'" onmouseover="this.type='date'" onclick="this.type='date'" onblur="this.type='text'" onmouseout="timeFunctionLong(this)">
                                    <script>
                                        function timeFunctionLong(input) {
                                            setTimeout(function() {
                                                input.type = 'text';
                                            }, 60000);
                                        }
                                    </script>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-sm-3  control-label">Maladies
                                    <br>
                                    <small class="text-navy">(Selectioner si vous avez ces maladies)</small>
                                </label>

                                <div class="col-md-9 col-sm-9 ">
                                    <div class="checkbox">
                                        <!-- <input type="hidden" class="flat" name="idMaladies[]" value="0"> -->
                                        <?php for ($i = 0; $i < count($maladies); $i++) { ?>
                                            <label>
                                                <input type="checkbox" class="flat" name="idMaladies[]" value="<?php echo $maladies[$i]['id'] ?>"> <?php echo $maladies[$i]['label'] ?>
                                            </label>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="form-group row">
                                <div class="col-md-3 col-sm-3  control-label">

                                </div>
                                <div class="col-md-9 col-sm-9 ">
                                    <?php 
                                    if (isset($message)) {
                                        if ($message[0] == 'D') { ?>
                                            <h5 style="color:red"><?php echo $message ?> </h5>
                                        <?php  } else { ?>
                                            <h5 style="color:green"><?php echo $message ?></h5>
                                    <?php }
                                    }  ?>
                                </div>
                            </div>
                            <div class="ln_solid"></div>
                            <div class="form-group row">
                                <div class="col-md-9 col-sm-9  offset-md-3">
                                    <input type="submit" class="btn btn-primary" value="Enregistrer">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-3"></div>

            </div>

        </div>
    </div>