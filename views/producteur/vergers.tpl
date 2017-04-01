<div class="row">
    <div class="col-lg-7">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Ajouter un nouveau verger</h5>
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
                <form class="form-horizontal" action="" method="POST">
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">Nom / Identifiant du verger</label>
                        <div class="col-sm-9">
                            <input type="text" name="name" id="name" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="superficie" class="col-sm-3 control-label">Superficie</label>
                        <div class="col-sm-5">
                            <input type="number" name="superficie" id="superficie" class="form-control" placeholder="* en ha">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nbArbres" class="col-sm-3 control-label">Nbr arbres/ha</label>
                        <div class="col-sm-5">
                            <input type="number" name="nbArbres" id="nbArbres" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="commune" class="col-sm-3 control-label">Commune</label>
                        <div class="col-sm-9">
                            <select class="form-control" name="commune" id="commune">
                                <?php foreach($communes as $commune){ ?>
                                    <option value="<?= $commune['idCommune'] ?>">
                                        <?= $commune['nomCommune'] ?> - <?= $commune['codePostal'] ?> <?= $commune["aocCommune"] ? '(AOC)' : false ?>
                                    </option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="commune" class="col-sm-3 control-label">Variété</label>
                        <div class="col-sm-9">
                            <select class="form-control" name="variete" id="variete">
                                <?php foreach($varietes as $variete){ ?>
                                    <option value="<?= $variete['idVariete'] ?>">
                                         <?= $variete['nomVariete'] ?> <?= $variete["aocVariete"] ? '(AOC)' : false ?>
                                    </option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4"></div>
                        <button class="btn btn-lg btn-primary col-sm-4" type="submit">Enregistrer</button>
                        <div class="col-sm-4"></div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="col-lg-5">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Vergers en production</h5>
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
                            <th>Nom</th>
                            <th>Commune</th>
                            <th>Variete</th>
                            <th>AOC</th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($vergers as $verger){ ?>
                        <tr>
                            <td><?= $verger["nomVerger"] ?></td>
                            <td><?= $verger["nomCommune"] ?></td>
                            <td><?= $verger["nomVariete"] ?></td>
                            <td><?= $verger["aoc"] ? '<i class="fa fa-check"></li>' : '<i class="fa fa-times"></li>' ?></td>
                        </tr>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>