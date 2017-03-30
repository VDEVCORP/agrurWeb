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
                            <th>#</th>
                            <th>Nom</th>
                            <th>Prénom</th>
                            <th>Téléphone</th>
                            <th class="text-right">Adhérent</th>
                            <th></th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($producers as $producer){ ?>
                        <tr <?= !$producer['valid'] ? 'class="text-danger"' : false ?>>
                            <td><?= $producer['idProducteur'] ?></td>
                            <td><?= $producer['nomResponsable'] ?></td>
                            <td><?= $producer['prenomResponsable'] ?></td>
                            <td><?= $producer['telephone'] ?></td>
                            <td class="text-right"><?= $producer['adherent'] ? '<i class="fa fa-check"></li>' : '<i class="fa fa-times"></li>' ?></td>

                            <td class="text-right">
                                <div class="btn-group">
                                    <a class="btn btn-info" id="edit" href="/admin/utilisateurs/edit?role=prod&id=<?= $producer['idProducteur'] ?>">Editer</a>
                                    <button <?= $producer['valid'] ? 'class="btn btn-danger user-disable"' : 'class="btn btn-success user-enable"' ?> id="<?= $producer['fk_id_user'] ?>">
                                        <?= $producer['valid'] ? 'Désactiver' : 'Activer' ?>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Clients</h5>
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
                            <th>Organisation</th>
                            <th>Nom</th>
                            <th>Prénom</th>
                            <th class="text-right">Téléphone</th>
                            <th></th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($customers as $customer){ ?>
                        <tr <?= !$customer['valid'] ? 'class="text-danger"' : false ?>>
                            <td><?= $customer['idClient'] ?></td>
                            <td><?= $customer['nomClient'] ?></td>
                            <td><?= $customer['nomRepresentant'] ?></td>
                            <td><?= $customer['prenomRepresentant'] ?></td>
                            <td class="text-right"><?= $customer['telephone'] ?></td>
                            <td class="text-right">
                                <div class="btn-group">
                                    <a class="btn btn-info" href="/admin/utilisateurs/edit?role=cli&id=<?= $customer['idClient'] ?>">Editer</a>
                                    <button <?= $customer['valid'] ? 'class="btn btn-danger user-disable"' : 'class="btn btn-success user-enable"' ?> id="<?= $customer['fk_id_user'] ?>">
                                        <?= $customer['valid'] ? 'Désactiver' : 'Activer' ?>
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
                <h5>Détails</h5>
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
            <?php if(isset($askProducer)){ ?>
                <div class="ibox-content profile-content">
                    <h3><strong><?= $askProducer['nomResponsable'] ?> <?= $askProducer['prenomResponsable']?></strong></h3>   
                    <?= isset($askProducer['nomSociete']) && !empty($askProducer['nomSociete']) ? '<h3><small>Société: </small>' . $askProducer['nomSociete'] . '</h3>' : false ?> 
                    
                    <p><i class="fa fa-map-marker"></i> <?= $askProducer['adresse'] ?>, <?= $askProducer['ville'] ?> <?= $askProducer['codePostal'] ?></p>
                    <hr>
                    <h4 class="text-center">Contacts</h4>
                    <p><strong>Email: </strong><?= $askProducer['email'] ?></p>
                    <p><strong>Telephone: </strong><?= $askProducer['telephone'] ?></p>
                    <hr>
                </div>
            <?php } ?>

            <?php if(isset($askCustomer)){ ?>
                <div class="ibox-content profile-content">
                    <h3><strong><?= $askCustomer['nomRepresentant'] ?> <?= $askCustomer['prenomRepresentant']?></strong></h3>   
                    <?= isset($askCustomer['nomClient']) && !empty($askCustomer['nomClient']) ? '<h3><small>Société: </small>' . $askCustomer['nomClient'] . '</h3>' : false ?> 
                    
                    <p><i class="fa fa-map-marker"></i> <?= $askCustomer['adresse'] ?>, <?= $askCustomer['ville'] ?> <?= $askCustomer['codePostal'] ?></p>
                    <hr>
                    <h4 class="text-center">Contacts</h4>
                    <p><strong>Email: </strong><?= $askCustomer['email'] ?></p>
                    <p><strong>Telephone: </strong><?= $askCustomer['telephone'] ?></p>
                    <hr>
                </div>
            <?php } ?>
            </div>
        </div>
    </div>
</div>