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
                            <th>Quantité</th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($lots as $lot){ ?>
                        <tr>
                            <td><?= $lot["reference"] ?></td>
                            <td><?= $lot["nomVerger"] ?> <?= $lot["aocCommune"] ? '(AOC)' : false ?></td>
                            <td><?= $lot["nomVariete"] ?> <?= $lot["aocVariete"] ? '(AOC)' : false ?></td>
                            <td><?= $lot["libelleTypeProduit"] ?></td>
                            <td><?= $lot["intervalle"] ?></td>
                            <td><?= $lot["quantiteLot"] ?></td>
                        </tr>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-lg-4">
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

                    <div class="form-group">
                        <label for="nom" class="col-sm-2 control-label">Ref</label>
                        <div class="col-sm-10">
                            <input type="text" name="reference" id="reference" class="form-control">
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
                            <input type="number" name="quantite" id="quantite" class="form-control">
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