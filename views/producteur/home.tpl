<div class="row">
    <div class="col-lg-6">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Exploitations</h5>
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
            <?php foreach($vergers as $verger) { ?>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="fa fa-angle-right"></i> <?= $verger['nomVerger'] ?>
                        <?= $verger['aoc'] ? '<span class="pull-right label label-primary"><i class="fa fa-star"></i> AOC</span>' : false ?>
                    </div>
                    <div class="panel-body">
                        <p>
                            <i class="fa fa-pagelines"></i><small> Variété: </small><strong> <?= $verger['nomVariete'] ?> </strong>
                            <?= $verger['aocVariete'] ? '</strong><span class="badge badge-danger">AOC</span>' : false ?>
                            <span  class="pull-right"><strong><?= $verger['superficie'] ?></strong> Hectares || <?= $verger['nbrArbreParHect'] ?> Arbres/Ha</span>
                        </p>
                        <p>
                            <i class="fa fa-map-marker"></i> <?= $verger['nomCommune'] ?> - <?= $verger['codePostal'] ?> 
                            <?= $verger['aocCommune'] ? '<span class="badge badge-warning">Commune AOC</span>' : false ?>
                        </p>
                    </div>
                </div>
            <?php } ?>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Historique des livraisons</h5>
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
                            <th>Date</th>
                            <th>Verger</th>
                            <th>Quantité</th>
                            <th>Type</th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($livraisons as $livraison){ ?>
                        <tr>
                            <td><?= $livraison["dateLivraison"] ?></td>
                            <td><?= $livraison["nomVerger"] ?></td>
                            <td><?= $livraison["quantite"] ?></td>
                            <td><?= $livraison["libelleTypeProduit"] ?></td>
                        </tr>
                    <?php } ?>
                    </tbody>
                </table>                
            </div>
        </div>
    </div>
</div>