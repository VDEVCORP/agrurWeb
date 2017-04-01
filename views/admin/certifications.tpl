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
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($certifications as $certification){ ?>
                        <tr>
                            <td><?= $certification["idCertification"] ?></td>
                            <td><?= $certification["libelleCertification"] ?></td>
                        <tr>
                    <?php } ?>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
    <div class="col-lg-5">
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

                    <div class="form-group">
                        <label for="nom">Libelle de la certification</label>
                        <input type="text" name="libelle" class="form-control">
                    </div>

                    <button type="submit" class="btn btn-primary btn-lg">Ajouter</button>
                </form>
            </div>
        </div>
    </div>
</div>