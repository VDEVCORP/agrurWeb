<div class="row">
    <div class="col-lg-8">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Liste lots</h5>
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
                            <th>Référence</th>
                            <th>Origine</th>
                            <th>Variété</th>
                            <th>Type</th>
                            <th>Calibre</th>
                            <th>Qtts</th>
                            <th></th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($lots as $lot){ ?>
                        <tr>
                            <td><?= $lot["reference"] ?></td>
                            <td><?= $lot["nomVerger"] ?> <?= $lot["aocCommune"] || $lot["aocVariete"] ? '(AOC)' : false ?></td>
                            <td><?= $lot["nomVariete"] ?></td>
                            <td><?= $lot["libelleTypeProduit"] ?></td>
                            <td><?= $lot["intervalle"] ?></td>
                            <td class="text-right"><?= $lot["quantiteLot"] ?></td>
                            <td class="text-right">
                                <div class="btn-group">
                                    <a class="btn btn-info btn-xs" href="/admin/lots/edit?id=<?= $lot['idLot'] ?>">Editer</a>
                                    <button class="lot-delete btn btn-danger btn-xs" id="<?= $lot["idLot"] ?>">
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
    <div class="col-lg-4">
        <?php if(isset($askLot)){ ?>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Modification du lot</h5>
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
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="lot" value="<?= $askLot['idLot'] ?>">
                    <div class="form-group">
                        <label for="nom" class="col-sm-2 control-label">Ref</label>
                        <div class="col-sm-10">
                            <input type="text" name="reference" id="reference" class="form-control" value="<?= $askLot['reference'] ?>" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="livraison" class="col-sm-2 control-label">Origine</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="livraison">
                                <?php foreach($livraisons as $livraison){ ?>
                                    <option value="<?= $livraison['idLivraison'] ?>" <?= $livraison['idLivraison'] == $askLot['idLivraison'] ? 'selected' : false ?>>
                                        <?= $livraison['dateLivraison'] ?> : N° <?= $livraison['idLivraison'] ?> | <?= $livraison['nomVerger'] ?>
                                    </option>
                                <?php } ?>
                            </select>
                            <p class="help-block">Date : Numéro de livraison | Verger d'origine</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="calibre" class="col-sm-2 control-label">Calibre</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="calibre">
                                <?php foreach($calibres as $calibre){ ?>
                                    <option value="<?= $calibre['idCalibre'] ?>" <?= $calibre['idCalibre'] == $askLot['idCalibre'] ? 'selected' : false ?>>
                                        <?= $calibre['intervalle'] ?>
                                    </option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="quantite" class="col-sm-2 control-label">Quantite</label>
                        <div class="col-sm-10">
                            <input type="number" name="quantite" id="quantite" value="<?= $askLot['quantiteLot'] ?>" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-warning btn-lg">Modifier</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
        <?php } ?>

        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Entrer un nouveau lot</h5>
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
                    <input type="hidden" name="action" value="add">
                    <div class="form-group">
                        <label for="nom" class="col-sm-2 control-label">Ref</label>
                        <div class="col-sm-10">
                            <input type="text" name="reference" id="reference" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="livraison" class="col-sm-2 control-label">Origine</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="livraison">
                                <?php foreach($livraisons as $livraison){ ?>
                                    <option value="<?= $livraison['idLivraison'] ?>">
                                        <?= $livraison['dateLivraison'] ?> : N° <?= $livraison['idLivraison'] ?> | <?= $livraison['nomVerger'] ?>
                                    </option>
                                <?php } ?>
                            </select>
                            <p class="help-block">Date : Numéro de livraison | Verger d'origine</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="calibre" class="col-sm-2 control-label">Calibre</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="calibre">
                                <?php foreach($calibres as $calibre){ ?>
                                    <option value="<?= $calibre['idCalibre'] ?>"><?= $calibre['intervalle'] ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="quantite" class="col-sm-2 control-label">Quantite</label>
                        <div class="col-sm-10">
                            <input type="number" name="quantite" id="quantite" class="form-control" required>
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