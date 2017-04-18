<div class="row">
    <div class="col-lg-6"><div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Dernières éditions Clients</h5>
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
                            <th>Le</th>
                            <th>Organisation</th>
                            <th>Nom</th>
                            <th>Prénom</th>
                            <th class="text-right">Mail</th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($lastCustomers as $lastCustomer){ ?>
                        <tr>
                            <td><?= $lastCustomer['last_edit'] ?></td>
                            <td><a href="/admin/utilisateurs/details?role=cli&id=<?= $lastCustomer['idClient'] ?>"><?= $lastCustomer['nomClient'] ?></a></td>
                            <td><?= $lastCustomer['nomRepresentant'] ?></td>
                            <td><?= $lastCustomer['prenomRepresentant'] ?></td>
                            <td class="text-right"><?= $lastCustomer['email'] ?></td>
                        </tr>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Dernières éditions Producteurs</h5>
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
                            <th>Le</th>
                            <th>Nom</th>
                            <th>Prénom</th>
                            <th class="text-center">Adhérent</th>
                            <th>Mail</th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($lastProducers as $lastProducer){ ?>
                        <tr>
                            <td><?= $lastProducer['last_edit'] ?></td>
                            <td><a href="/admin/utilisateurs/details?role=prod&id=<?= $lastProducer['idProducteur'] ?>"><?= $lastProducer['nomResponsable'] ?></a></td>
                            <td><?= $lastProducer['prenomResponsable'] ?></td>
                            <td class="text-center"><?= $lastProducer['adherent'] ? '<i class="fa fa-check"></li>' : '<i class="fa fa-times"></li>' ?></td>
                            <td><?= $lastProducer['email'] ?></td>
                        </tr>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>  
    </div>
</div>

<div class="row">
    <div class="col-lg-6">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Dernières Commandes passées</h5>
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
                            <th>Le</th>
                            <th>Référérence</th>
                            <th>Client</th>
                            <th>Status</th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($lastCommandes as $lastCommande) : ?>
                        <tr>
                            <td><?= $lastCommande['soumission'] ?></td>
                            <td><a href="/client/boncommande/?id=<?= $lastCommande['idCommande'] ?>"><?= $lastCommande['refCommande'] ?></a></td>
                            <td><?= $lastCommande['nomClient'] ?></td>
                            <td><p class="status-text	<?php 	switch($lastCommande['libelleStatus']){
                                                        case('en attente') :
                                                            echo 'text-danger'; break;
                                                        case('en cours') :
                                                            echo 'text-success'; break;
                                                        case('expedié') :
                                                            echo 'text-info'; break;
                                                        }
                                                        ?>">
                                <?= ucfirst($lastCommande['libelleStatus'])?>
                            </p></td>
                        </tr>
                    <?php endforeach ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-lg-6">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Dernières Livraisons</h5>
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
                            <th>Le</th>
                            <th>Provenance</th>
                            <th>Type</th>
                            <th class="text-right">Quantité (kg)</th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($lastLivraisons as $lastLivraison){ ?>
                        <tr>
                            <td><?= $lastLivraison["dateLivraison"] ?></td>
                            <td><a href="/admin/livraisons/edit?id=<?= $lastLivraison['idLivraison'] ?>"><?= $lastLivraison["nomVerger"] ?></a></td>
                            <td><?= $lastLivraison["libelleTypeProduit"] ?></td>
                            <td class="text-right"><?= $lastLivraison["quantite"] ?></td>
                        <tr>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>

<div class="row">
    <div class="col-lg-6">
    </div>

    <div class="col-lg-6">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Dernières Vergers édités</h5>
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
                            <th>Nom</th>
                            <th>Responsable</th>
                            <th class="text-right">Commune</th>
                            <th class="text-right">Variete</th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($lastVergers as $lastVerger){ ?>
                        <tr>
                            <td><?= $lastVerger["verger_last_edit"] ?></td>
                            <td><?= $lastVerger["nomVerger"] ?></a></td>
                            <td><?php echo substr($lastVerger["prenomResponsable"], 0, 1) ?>. <?= $lastVerger["nomResponsable"] ?></td>
                            <td class="text-right"><?= $lastVerger["nomCommune"] ?><?= $lastVerger["aocCommune"] ? ' (AOC)' : false ?></td>
                            <td class="text-right"><?= $lastVerger["nomVariete"] ?><?= $lastVerger["aocVariete"] ? ' (AOC)' : false ?></td>
                        </tr>
                    <?php } ?>
                    </tbody>
                </table>
    
    </div>
</div>

