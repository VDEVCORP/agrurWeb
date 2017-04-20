<div class="row">
    <div class="col-md-9">
        <form action="" method="POST">
        <div class="ibox">
            <div class="ibox-title">
                <span class="pull-right">
                    <button type="submit" class="btn btn-danger btn-xs"><i class="fa fa-calculator"></i>&nbsp;Recalculer</button>
                    &nbsp;||&nbsp;
                    (<strong><span id="nbrItems"><?= $nbrItems ?></span></strong>) article<em>(s)</em>
                </span>
                <h5>Articles dans votre panier</h5>
            </div>
            <?= empty($items) ? '<div class="ibox-content"><p class="text-center">Pas encore d\'articles dans votre panier.</p></div>' : false; ?>
            <?php foreach($items as $item) : ?>
            <div class="item ibox-content">
                <div class="table-responsive">
                    <table class="table shoping-cart-table">
                        <tbody>
                        <tr>
                            <td width="90">
                                <img class="img-responsive img-circle" src="/includes/images/noix/<?= $item['idVariete'] ?>.jpg">
                            </td>
                            <td class="desc">
                                <h3> <p class="text-navy">
                                    <?= $item['libelleConditionnement'] ?>
                                </p></h3>
                                <ul class="list-inline no-margins">
                                    <li class="m-r-xl">  
                                        <dl>
                                            <dt>Produit :</dt>
                                            <dd><?= $item['nomVariete'] ?> <?= $item['aocVariete'] ? '(AOC <i class="fa fa-check"></i>)' : false ?></dd>
                                        </dl>
                                    </li>
                                    <li class="m-r-xl">  
                                        <dl>
                                            <dt>Calibre :</dt>
                                            <dd><?= $item['intervalle'] ?></dd>
                                        </dl>
                                    </li>
                                    <li>  
                                        <dl>
                                            <dt>Poids conditionné :</dt>
                                            <dd><?= $item['poidsConditionnee'] ?> Kg</dd>
                                        </dl>
                                    </li>
                                </ul>                    
                                <div class="no-margins">
                                    <a href="/client/interactPanier/remove?id=<?= $item['idConditionnement'] ?>" class="remove-product btn btn-default text-danger"><i class="fa fa-trash"></i> Retirer</a>
                                </div>
                            </td>

                            <td>
                               <!-- Espace de prix en réduction
                                POURCENTAGE REDUCTION
                                <s class="small text-muted">€ PRIX</s> 
                                -->
                            </td>
                            <td width="85" style="min-width:85px">
                                <input type="number" class="form-control" name="panier[quantity][<?= $item['idConditionnement'] ?>]" value="<?= $_SESSION['panier'][$item['idConditionnement']] ?>">
                            </td>

                            <td>
                                <h4>
                                    € PRIX
                                </h4>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <?php endforeach ?>
            </form>
            <div class="ibox-content">
                <a href="/client/interactPanier/clear" class="clear-panier btn btn-white pull-right"> Vider</a>
                <form action="/client/bonCommande" method="POST">
                    <input type="hidden" name="create" value="true">
                    <button type="submit" class="btn btn-primary pull-right m-r-sm">
                        <i class="fa fa-shopping-cart"></i>&nbsp;Commander
                    </button>
                </form>
                <a href="/client/home" class="btn btn-white"><i class="fa fa-arrow-left"></i>&nbsp;Retourner au catalogue</a>
            </div>
        </div>
    </div>

    <div class="col-md-3">
        <div class="ibox">
            <div class="ibox-title">
                <h5>Résumé de la Commande</h5>
            </div>
            <div class="ibox-content">
                <span>
                    Total HT
                </span>
                <h2 class="font-bold">
                    € PRIX
                </h2>
                <hr class="m-b-xs">
                <dl class="dl-horizontal m-b-none">
                    <dt>TVA 7%</dt>
                    <dd>€ PART TVA</dd>
                </dl>
                <hr class="m-b-xs m-t-xs">
                <dl class="dl-horizontal m-b-none">
                    <dt>Total TTC</dt>
                    <dd>€ PRIX TTC</dd>
                </dl>
                <hr class="m-t-xs">
                <span class="text-muted small">
                    * Tarifs applicables uniquement en France métropolitaine
                </span>
                <div class="m-t-sm">
                    <form action="/client/bonCommande" method="POST">
                        <input type="hidden" name="create" value="true">
                        <div class="btn-group">
                            <button type="submit" class="btn btn-primary btn-sm">
                                <i class="fa fa-shopping-cart"></i>&nbsp;Commander
                            </button>
                            <a href="/client/interactPanier/clear" class="clear-panier btn btn-white btn-sm"> Vider</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="ibox">
            <div class="ibox-title">
                <h5>Support</h5>
            </div>
            <div class="ibox-content text-center">



                <h3><i class="fa fa-phone"></i> +33 951 02 94 77</h3>
                <span class="small">
                    Vous rencontrez des difficultés avec votre commande? Joignez nous.
                </span>
                <p>De 8h à 18h, du lundi au samedi.</p>
            </div>
        </div>
    </div>
</div>
