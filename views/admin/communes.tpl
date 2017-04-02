<div class="row">
    <div class="col-lg-7">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Liste des communes</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Commune</th>
                            <th>Code Postal</th>
                            <th>AOC</th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($communes as $commune){ ?>
                        <tr>
                            <td><?= $commune["idCommune"] ?></td>
                            <td><?= $commune["nomCommune"] ?></td>
                            <td><?= $commune["codePostal"] ?> </td>
                            <td><?= $commune["aocCommune"] ? '<i class="fa fa-check"></i>' : '<i class="fa fa-times"></i>' ?></td>
                        </tr>
                    <?php } ?>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
    <div class="col-lg-5">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Ajouter une nouvelle commune</h5>
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <form action="" method="POST" class="form-horizontal">

                    <div class="form-group">
                        <label for="nom" class="col-sm-2 control-label">Nom</label>
                        <div class="col-sm-10">
                            <input type="text" name="nom" id="nom" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="codePostal" class="col-sm-2 control-label">Code Postal</label>
                        <div class="col-sm-10">
                            <input type="text" name="codePostal" id="codePostal" class="form-control">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="aocCommune" value="1">
                                    Commune AOC
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary btn-lg">Ajouter</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>