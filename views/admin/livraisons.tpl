<div class="row">
    <div class="col-lg-7">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Liste des livraisons</h5>
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
                            <th>Date de livraison</th>
                            <th>Provenance</th>
                            <th>Quantité (kg)</th>
                            <th></th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($livraisons as $livraison){ ?>
                        <tr>
                            <td><?= $livraison["idLivraison"] ?></td>
                            <td><?= $livraison["dateLivraison"] ?></td>
                            <td><?= $livraison["nomVerger"] ?> </td>
                            <td><span class="pull-right"><?= $livraison["quantite"] ?></span></td>
                            <td class="text-right">
                                <div class="btn-group">
                                    <a class="btn btn-info btn-xs" href="/admin/livraisons/edit?id=<?= $livraison['idLivraison'] ?>">Editer</a>
                                    <button class="livraison-delete btn btn-danger btn-xs" id="<?= $livraison["idLivraison"] ?>">
                                        Supprimer
                                    </button>
                                </div>
                            </td>
                        <tr>
                    <?php } ?>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
    <div class="col-lg-5">
    <?php if(isset($askLivraison)){ ?>
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Editer</h5>
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
                    <input type="hidden" name="livraison" value="<?= $askLivraison['idLivraison'] ?>" >
                    <div class="form-group">
                        <label for="dateLivraison" class="col-sm-2 control-label">Date</label>
                        <div class="col-sm-10">
                            <input type="date" name="dateLivraison" id="dateLivraison" class="form-control" value="<?= $askLivraison['dateLivraison'] ?>" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="verger" class="col-sm-2 control-label">Verger</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="verger" id="verger">
                                <?php foreach($vergers as $verger){ ?>
                                    <option value="<?= $verger['idVerger'] ?>" <?= $verger['idVerger'] == $askLivraison['idVerger'] ? 'selected' : false ?>>
                                        <?= $verger['nomVerger'] ?> [<?= $verger['nomResponsable'] ?> <?= $verger['prenomResponsable'] ?>] (<?= $verger['nomVariete'] ?>)
                                    </option>
                                <?php } ?>
                            </select>
                            <p class="help-block">Nom du verger [Responsable] (Variété)</p>
                        </div>
                    </div>
                    <hr>
                    <div class="form-group">
                        <label for="typeProduit" class="col-sm-2 control-label">Type</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="typeProduit" id="typeProduit">
                                <?php foreach($typesProduits as $typeProduit){ ?>
                                    <option value="<?= $typeProduit['idTypeProduit'] ?>" <?= $typeProduit['idTypeProduit'] == $askLivraison['idTypeProduit'] ? 'selected' : false ?>>
                                        <?= $typeProduit['libelleTypeProduit'] ?>
                                    </option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="quantite" class="col-sm-2 control-label">Quantité</label>
                        <div class="col-sm-10">
                            <input type="number" name="quantite" id="quantite" class="form-control" value="<?= $askLivraison['quantite'] ?>" placeholder="*en Kg" required>
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
                <h5>Renseigner un livraison</h5>
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
                        <label for="dateLivraison" class="col-sm-2 control-label">Date</label>
                        <div class="col-sm-10">
                            <input type="date" name="dateLivraison" id="dateLivraison" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="verger" class="col-sm-2 control-label">Verger</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="verger" id="verger" required>
                                <option selected disabled value>-- Selectionnez un verger --</option>
                                <?php foreach($vergers as $verger){ ?>
                                    <option value="<?= $verger['idVerger'] ?>">
                                        <?= $verger['nomVerger'] ?> [<?= $verger['nomResponsable'] ?> <?= $verger['prenomResponsable'] ?>] (<?= $verger['nomVariete'] ?>)
                                    </option>
                                <?php } ?>
                            </select>
                            <p class="help-block">Nom du verger [Responsable] (Variété)</p>
                        </div>
                    </div>
                    <hr>
                    <div class="form-group">
                        <label for="typeProduit" class="col-sm-2 control-label">Type</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="typeProduit" id="typeProduit" required>
                                <option selected disabled value>-- Selectionnez un type --</option>
                                <?php foreach($typesProduits as $typeProduit){ ?>
                                    <option value="<?= $typeProduit['idTypeProduit'] ?>">
                                        <?= $typeProduit['libelleTypeProduit'] ?>
                                    </option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="quantite" class="col-sm-2 control-label">Quantité</label>
                        <div class="col-sm-10">
                            <input type="number" name="quantite" id="quantite" class="form-control" placeholder="*en Kg" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-primary btn-lg">Enregistrer</button>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>