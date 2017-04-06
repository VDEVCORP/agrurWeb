<div class="row">
    <div class="col-lg-7">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>Liste des variétés</h5>
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
                            <th>Variété</th>
                            <th>AOC</th>
                            <th></th>
                        </tr>
                    <thead>
                    <tbody>
                    <?php foreach($varietes as $variete){ ?>
                        <tr>
                            <td><?= $variete["idVariete"] ?></td>
                            <td><?= $variete["nomVariete"] ?></td>
                            <td><?= $variete["aocVariete"] ? '<i class="fa fa-check"></li>' : '<i class="fa fa-times"></li>' ?></td>
                            <td class="text-right">
                                <div class="btn-group">
                                    <a class="btn btn-info btn-sm" href="/admin/varietes/edit?id=<?= $variete['idVariete'] ?>">Editer</a>
                                    <button class="variete-delete btn btn-danger btn-sm" id="<?= $variete["idVariete"] ?>">
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
    <?php if(isset($askVariete)){ ?>
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
                    <input type="hidden" name="variete" value="<?= $askVariete['idVariete'] ?>">
                    <div class="form-group">
                        <label for="nom" class="col-sm-2 control-label">Nom</label>
                        <div class="col-sm-10">
                            <input type="text" name="nom" id="nom" class="form-control" value="<?= $askVariete['nomVariete'] ?>" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="aocVariete" value="1" <?= $askVariete['aocVariete'] ? 'checked' : false ?>>
                                    Commune AOC
                                </label>
                            </div>
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
                <h5>Ajouter une nouvelle variété</h5>
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
                            <input type="text" name="nom" id="nom" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="aocVariete" value="1">
                                    Variété AOC
                                </label>
                            </div>
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