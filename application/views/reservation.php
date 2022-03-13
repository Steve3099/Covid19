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
                        <form class="form-label-left input_mask">

                            <div class="col-md-6 col-sm-6  form-group has-feedback">
                                <input type="text" class="form-control has-feedback-left" id="inputSuccess2" name="nom" placeholder="Nom ">
                                <span class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
                            </div>

                            <div class="col-md-6 col-sm-6  form-group has-feedback">
                                <input type="text" class="form-control" id="inputSuccess3" name="prenom" placeholder="Prenom">
                                <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                            </div>

                            <div class="col-md-6 col-sm-6  form-group has-feedback">
                                <input type="email" class="form-control has-feedback-left" name="email" id="inputSuccess4" placeholder="Email">
                                <span class="fa fa-envelope form-control-feedback left" aria-hidden="true"></span>
                            </div>

                            <div class="col-md-6 col-sm-6  form-group has-feedback">
                                <input type="tel" class="form-control" id="inputSuccess5" name="numero" placeholder="Telephone">
                                <span class="fa fa-phone form-control-feedback right" aria-hidden="true"></span>

                            </div>
                    </div>


                    <div class="form-group row">
                        <label class="col-form-label col-md-3 col-sm-3 ">Date de Naissance <span class="required">*</span>
                        </label>
                        <div class="col-md-9 col-sm-9 ">
                            <input class="date-picker form-control" placeholder="dd-mm-yyyy" name="dateNaissance" required="required" type="text" onfocus="this.type='date'" onmouseover="this.type='date'" onclick="this.type='date'" onblur="this.type='text'" onmouseout="timeFunctionLong(this)">
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
                            <p>
                                Homme <input type="radio" class="flat" name="gender" id="genderM" value="M" checked="" required />
                                Femme <input type="radio" class="flat" name="gender" id="genderF" value="F" />
                            </p>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-md-3 col-sm-3 ">CIN</label>
                        <div class="col-md-9 col-sm-9 ">
                            <input type="text" class="form-control" name="cin" placeholder="CIN" data-inputmask="'mask' : '(999) 999-9999'>
                            <span class=" fa fa-user form-control-feedback right" aria-hidden="true"></span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-form-label col-md-3 col-sm-3 ">Adresse</label>
                        <div class="col-md-9 col-sm-9 ">
                            <input type="text" class="form-control" name="adresse" placeholder="Adresse">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 ">Centre</label>
                        <div class="col-md-9 col-sm-9 ">
                            <select class="select2_single form-control" tabindex="-1" name="idCentre">
                                <option>Centre</option>
                                <option value="AK">Alaska</option>
                                <option value="HI">Hawaii</option>
                                <option value="CA">California</option>
                                <option value="NV">Nevada</option>
                                <option value="OR">Oregon</option>

                            </select>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="control-label col-md-3 col-sm-3 ">Vaccin disponible</label>
                        <div class="col-md-9 col-sm-9 ">
                            <select class="select2_single form-control" tabindex="-1" name="idVaccin">
                                <option>Vaccin</option>
                                <option value="AK">Alaska</option>
                                <option value="HI">Hawaii</option>
                                <option value="CA">California</option>
                                <option value="NV">Nevada</option>
                                <option value="OR">Oregon</option>

                            </select>
                        </div>
                    </div>
                    <div class="ln_solid"></div>
                    <div class="form-group row">
                        <div class="col-md-9 col-sm-9  offset-md-3">
                            <button type="button" class="btn btn-primary">Cancel</button>
                            <button class="btn btn-primary" type="reset">Reset</button>
                            <button type="submit" class="btn btn-success">Submit</button>
                        </div>
                    </div>

                    </form>
                </div>
            </div>
            <div class="col-md-3"></div>

        </div>

    </div>
</div>