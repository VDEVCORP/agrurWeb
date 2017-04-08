<?php if(isset($askConditionnement)) { ?>
<div class="row">
    <div class="ibox float-e-margins">
        <div class="ibox-title">
            <h5>Détails du conditionnement</h5>
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
            <div class="row">
                <div class="col-lg-4">
                    <h2>Le Produit</h2>
                    <ul>
                        <li><h3><?= $askConditionnement['libelleConditionnement'] ?></h3>
                            <ul>
                                <li><strong>quantite: </strong><?= $askConditionnement['poidsConditionnee'] ?> Kg</li>
                                <li><strong>calibre: </strong><?= $askConditionnement['intervalle'] ?></li>
                                <li><strong>variété: </strong> <?= $askConditionnement['nomVariete'] ?> <?= $askConditionnement['aocVariete'] ? '<strong>(AOC)</strong>' : false ?></li>
                                <li><strong>provenance AOC : </strong><?= $askConditionnement['aocCommune'] ? '<i class="fa fa-check"></i> OUI' : '<i class="fa fa-times"></i> NON' ?></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-4 b-r">
                    <h2>Sa provenance</h2>
                    <ul>
                        <li><h3>Lot :</h3>
                            <ul>
                                <li><strong>référence: </strong><?= $askConditionnement['reference'] ?></li>
                                <li><strong>livrée le: </strong><?= $askConditionnement['dateLivraison'] ?></li>
                            </ul>
                        </li>
                        <li><h3>Verger :</h3>
                            <ul>
                                <li><strong>nom: </strong><?= $askConditionnement['nomVerger'] ?></li>
                                <li><strong>lieu: </strong><?= $askConditionnement['nomCommune'] ?> - <?= $askConditionnement['codePostal'] ?></li>
                                <li><strong>exploitant: </strong><?= $askConditionnement['prenomResponsable'] ?> <?= $askConditionnement['nomResponsable'] ?></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="col-lg-4">
                    <form action="" method="POST" class="form-horizontal">
                        <input type="hidden" name="action" value="update">
                        <input type="hidden" name="conditionnement" value="<?= $askConditionnement['idConditionnement'] ?>">
                        <div class="form-group">
                            <label for="nom" class="col-sm-2 control-label">Nom</label>
                            <div class="col-sm-10">
                                <input type="text" name="libelleConditionnement" class="form-control" value="<?= $askConditionnement['libelleConditionnement'] ?>" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="calibre" class="col-sm-2 control-label">Lot</label>
                            <div class="col-sm-10">
                                <select class="form-control" name="lot">
                                    <?php foreach($lots as $lot){ ?>
                                        <option value="<?= $lot['idLot'] ?>" <?= $askConditionnement['idConditionnement'] == $lot['idLot'] ? 'selected' : false ?>>
                                            <?= $lot['reference'] ?> | <?= $lot['libelleTypeProduit'] ?> | <?= $lot['intervalle'] ?>
                                        </option>
                                    <?php } ?>
                                </select>
                                <p class="help-block">Référence du lot | Type de noix | Calibre</p>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="quantite" class="col-sm-2 control-label">Poids</label>
                            <div class="col-sm-10">
                                <input type="number" name="poids" class="form-control" value="<?= $askConditionnement['poidsConditionnee'] ?>" placeholder="*en Kg" required>
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
        </div>
    </div>
</div>
<?php } ?>
<div class="row">
    <div class="col-lg-8">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Producteurs</h5>
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
                            <th>Nom produit</th>
                            <th>Lot</th>
                            <th>Variete</th>
                            <th class="text-right">Livrée le</th>
                            <th></th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($conditionnements as $conditionnement){ ?>
                            <td><?= $conditionnement['libelleConditionnement'] ?></td>
                            <td><?= $conditionnement['referenceLot'] ?></td>
                            <td><?= $conditionnement['nomVariete'] ?></td>
                            <td class="text-right"><?= $conditionnement['dateLivraison'] ?></td>
                            <td class="text-right">
                                <div class="btn-group">
                                    <a class="btn btn-info btn-sm" href="/admin/conditionnement/details?id=<?= $conditionnement['idConditionnement'] ?>">Détails</a>
                                    <button class="conditionnement-delete btn btn-danger btn-sm" id="<?= $conditionnement['idConditionnement'] ?>">
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
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Ajouter un conditionnement</h5>
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
                        <label for="nom" class="col-sm-2 control-label">Nom</label>
                        <div class="col-sm-10">
                            <input type="text" name="libelleConditionnement" class="form-control" required>
                            <p class="help-block"><em>Il s'agira du nom produit affiché aux clients.</em></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="calibre" class="col-sm-2 control-label">Lot</label>
                        <div class="col-sm-10">
                            <select class="form-control" name="lot">
                                <option selected disabled value>-- Selectionnez un lot --</option>
                                <?php foreach($lots as $lot){ ?>
                                    <option value="<?= $lot['idLot'] ?>">
                                        <?= $lot['reference'] ?> | <?= $lot['libelleTypeProduit'] ?> | <?= $lot['intervalle'] ?>
                                    </option>
                                <?php } ?>
                            </select>
                            <p class="help-block">Référence du lot | Type de noix | Calibre</p>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="quantite" class="col-sm-2 control-label">Poids</label>
                        <div class="col-sm-10">
                            <input type="number" name="poids" class="form-control" placeholder="*en Kg" required>
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