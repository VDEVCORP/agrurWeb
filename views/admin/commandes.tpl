<div class="ibox float-e-margins">
    <div class="ibox-title">
        <h5>Historique des commandes </h5>
        <div class="ibox-tools">
            <a href="http://agrur.vdev/admin/commandes" class="btn btn-default btn-xs"><i class="fa fa-repeat"></i> Rafraîchir</a>
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
                    <th>Référérence</th>
                    <th>Client</th>
                    <th>Faite le</th>
                    <th>Nbr unités</th>
                    <th>Préparation le</th>
                    <th>Expediée le</th>
                    <th>Status</th>
                    <th></th>
                    <th></th>
                </tr>
            <thead>
            <tbody>
            <?php foreach($commandes as $commande) : ?>
                <tr>
                    <td><?= $commande['refCommande'] ?></td>
                    <td><?= $commande['nomClient'] ?></td>
                    <td><?= $commande['soumission'] ?></td>
                    <td><?= $commande['nbrItem'] ?></td>
                    <td><?= $commande['preparation'] ? $commande['preparation'] : ' - '?></td>
                    <td><?= $commande['expedition'] ? $commande['expedition'] : ' - '?></td>
                    <td><p class="status-text	<?php 	switch($commande['libelleStatus']){
                                                case('en attente') :
                                                    echo 'text-danger'; break;
                                                case('en cours') :
                                                    echo 'text-success'; break;
                                                case('expedié') :
                                                    echo 'text-info'; break;
                                                }
                                                ?>">
                        <?= ucfirst($commande['libelleStatus'])?>
                    </p></td>
                    <td class="text-right">
                        <div class="btn-group">
                            <a class="change-status btn btn-warning btn-xs" href="/admin/commandes/attente?id=<?= $commande['idCommande'] ?>"
                            id="attente" <?= $commande['libelleStatus'] == 'en attente' || $commande['libelleStatus'] == 'expedié' ? 'disabled' : false;?>>
                                Attente</a>
                            <a class="change-status btn btn-success btn-xs" href="/admin/commandes/encours?id=<?= $commande['idCommande'] ?>"
                            id="encours" <?= $commande['libelleStatus'] == 'en cours' || $commande['libelleStatus'] == 'expedié' ? 'disabled' : false;?>>
                                En cours</a>
                            <a class="change-status btn btn-primary btn-xs" href="/admin/commandes/expedie?id=<?= $commande['idCommande'] ?>"
                            id="expedie" <?= $commande['libelleStatus'] == 'expedié' || $commande['libelleStatus'] == 'en attente' ? 'disabled' : false;?>>
                                Expedié</a>
                        </div>
                    </td>
                    <td class="text-right">
                        <div class="btn-group">
                            <button class="commande-delete btn btn-danger btn-sm" id="<?= $commande["idCommande"] ?>" <?= $commande['libelleStatus'] == 'expedié' ? 'disabled' : false ?>>
                                Annuler
                            </button>
                            <a class="btn btn-info btn-sm" href="/client/bonCommande/?id=<?= $commande['idCommande'] ?>">Détails</a>
                        </div>
                    </td>
                </tr>
            <?php endforeach ?>
            </tbody>
        </table>
    </div>
</div>