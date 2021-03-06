<div class="row border-bottom white-bg page-heading m-r-n-md m-l-n-md p-xs m-b-md">
    <a href="<?= $_SESSION['user']['rank'] == 'admin' ? '/admin/commandes' : '/client/profil' ?>" class="btn btn-white">
        <i class="fa fa-arrow-left"></i> <?= $_SESSION['user']['rank'] == 'admin' ? 'Retourner aux commandes' : 'Retourner au profil' ?>
    </a>
    <span class="pull-right"><a href="/client/bonCommandePDF/?id=<?= $commande['idCommande'] ?>" target="_blank"class="btn btn-primary"><i class="fa fa-print"></i> Imprimer || Enregistrer <i class="fa fa-save"></i></a></span>
</div>

<div class="ibox-content p-xl">
    <div class="row">
        <div class="col-sm-6">
            <h5>De:</h5>
            <address>
                <strong>AGRUR, Coopérative.</strong><br>
                36 quai Bolivar, 47400<br>
                Tonneins, CEDEX<br>
                <abbr title="Telephone">Tel:</abbr> +33 951 02 94 77
            </address>
        </div>

        <div class="col-sm-6 text-right">
            <h4>Bon de Commande No.</h4>
            <h4 class="text-navy"><?= $commande['refCommande'] ?></h4>
            <span>A:</span>
            <address>
                <strong><?= $commande['nomClient'] ?></strong><br>
                <?= $commande['adresse'] ?><br>
                <?= $commande['ville'] ?>, <?= $commande['codePostal'] ?><br>
                <abbr title="Telephone">Tel:</abbr> <?= $commande['telephone'] ?><br>
            </address>
            <p>
                <span><strong>Représentant:</strong> <?= $commande['prenomRepresentant'] ?> <?= $commande['nomRepresentant'] ?><br></span>
            </p>
            <p>
                <span><strong>Date du bon:</strong> <?= $commande['soumission'] ?></span><br/>
            </p>
        </div>
    </div>

    <div class="table-responsive m-t">
        <table class="table invoice-table">
            <thead>
                <tr>
                    <th>Liste des articles</th>
                    <th>Quantité</th>
                    <th>Prix/U</th>
                    <th>Taxe <em>(7%)</em></th>
                    <th>Prix total</th>
                </tr>
            </thead>
            <?php foreach($commandeDetails as $commandeDetail) : ?>
            <tbody>
                <tr>
                    <td><div><strong><?= $commandeDetail['libelleConditionnement'] ?></strong></div>
                        <span class="m-l-md"><small><strong>Calibre noix :</strong> <?= $commandeDetail['intervalle'] ?></small></span>
                        <span class="m-l-md"><small><strong>Poids :</strong> <?= $commandeDetail['poidsConditionnee'] ?> Kg</small></span>
                    </td>
                    <td><?= $commandeDetail['quantiteCommandee'] ?></td>
                    <td>€Prix</td>
                    <td>€part</td>
                    <td>€PRIX</td>
                </tr>
            </tbody>
            <?php endforeach ?>
        </table>

        <table class="table invoice-total">
            <tbody>
            <tr>
                <td><strong>Sous Total :</strong></td>
                <td>€Total</td>
            </tr>
            <tr>
                <td><strong>TAX :</strong></td>
                <td>€Part</td>
            </tr>
            <tr>
                <td><strong>TOTAL :</strong></td>
                <td>€TOTAL</td>
            </tr>
            </tbody>
        </table>

    </div>
</div>
