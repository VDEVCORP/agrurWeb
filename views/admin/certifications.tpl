<div class="row">
    <div class="col-lg-7">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Liste des certifications</h5>
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
                            <th>Libelle</th>
                            <th></th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($certifications as $certification){ ?>
                        <tr>
                            <td><?= $certification["idCertification"] ?></td>
                            <td><?= $certification["libelleCertification"] ?></td>
                            <td class="text-right">
                                <div class="btn-group">
                                    <a class="btn btn-info btn-sm" href="/admin/certifications/edit?id=<?= $certification['idCertification'] ?>">Editer</a>
                                    <button class="certification-delete btn btn-danger btn-sm" id="<?= $certification['idCertification'] ?>">
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
    <div class="col-lg-5">
        <?php if(isset($askCertification)){ ?>
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
                <form action="" method="POST">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="certification" value="<?= $askCertification['idCertification'] ?>" >
                    <div class="form-group">
                        <label for="nom">Libelle de la certification</label>
                        <input type="text" name="libelle" class="form-control" value="<?= $askCertification['libelleCertification'] ?>">
                    </div>

                    <button type="submit" class="btn btn-warning btn-lg">Modification</button>
                </form>
            </div>
        </div>
        <?php } ?>

        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Ajouter une certification</h5>
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
                <form action="" method="POST">
                    <input type="hidden" name="action" value="add">
                    <div class="form-group">
                        <label for="nom">Libelle de la certification</label>
                        <input type="text" name="libelle" class="form-control" required>
                    </div>
                    
                    <button type="submit" class="btn btn-primary btn-lg">Ajouter</button>
                </form>
            </div>
        </div>
    </div>
</div>