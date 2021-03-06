<div class="row">
    <div class="col-lg-6">
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
                    <input type="hidden" name="action" value="add">
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">Nom/Identifiant</label>
                        <div class="col-sm-9">
                            <input type="text" name="name" id="name" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="superficie" class="col-sm-3 control-label">Superficie</label>
                        <div class="col-sm-5">
                            <input type="number" name="superficie" id="superficie" class="form-control" placeholder="* en ha" required>
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
                            <select class="form-control" name="commune" id="commune" required>
                                <option selected disabled value>-- Selectionnez une commune --</option>
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
                            <select class="form-control" name="variete" id="variete" required>
                                <option selected disabled value>-- Selectionnez une variété --</option>
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

    <div class="col-lg-6">
    <?php if(isset($askVerger)) { ?>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Modifier le verger</h5>
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
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="verger" value="<?= $askVerger['idVerger'] ?>">
                    <div class="form-group">
                        <label for="name" class="col-sm-3 control-label">Nom/Identifiant</label>
                        <div class="col-sm-9">
                            <input type="text" name="name" id="name" class="form-control" value="<?= $askVerger['nomVerger'] ?>" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="superficie" class="col-sm-3 control-label">Superficie</label>
                        <div class="col-sm-5">
                            <input type="number" name="superficie" id="superficie" class="form-control" value="<?= $askVerger['superficie'] ?>" placeholder="* en ha" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nbArbres" class="col-sm-3 control-label">Nbr arbres/ha</label>
                        <div class="col-sm-5">
                            <input type="number" name="nbArbres" id="nbArbres" value="<?= $askVerger['nbrArbreParHect'] ?>" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="commune" class="col-sm-3 control-label">Commune</label>
                        <div class="col-sm-9">
                            <select class="form-control" name="commune" id="commune">
                                <?php foreach($communes as $commune){ ?>
                                    <option value="<?= $commune['idCommune'] ?>" <?= $commune['idCommune'] == $askVerger['idCommune'] ? 'selected' : false ?>>
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
                                    <option value="<?= $variete['idVariete'] ?>" <?= $variete['idVariete'] == $askVerger['idVariete'] ? 'selected' : false ?>>
                                         <?= $variete['nomVariete'] ?> <?= $variete["aocVariete"] ? '(AOC)' : false ?>
                                    </option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-4"></div>
                        <button class="btn btn-lg btn-warning col-sm-4" type="submit">Modifier</button>
                        <div class="col-sm-4"></div>
                    </div>
                </form>
            </div>
        </div>
    <?php } ?> 
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
                            <th></th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($vergers as $verger){ ?>
                        <tr>
                            <td><?= $verger["nomVerger"] ?></td>
                            <td><?= $verger["nomCommune"] ?></td>
                            <td><?= $verger["nomVariete"] ?></td>
                            <td><?= $verger["aoc"] ? '<i class="fa fa-check"></li>' : '<i class="fa fa-times"></li>' ?></td>
                            <td class="text-right">
                                <div class="btn-group">
                                    <a class="btn btn-info btn-xs" href="/producteur/vergers/edit?id=<?= $verger['idVerger'] ?>">Editer</a>
                                    <button class="verger-delete btn btn-danger btn-xs" id="<?= $verger['idVerger'] ?>">
                                        Supprimer
                                    </button>
                                </div>
                            </td>
                        </tr>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>