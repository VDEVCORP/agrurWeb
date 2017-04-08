<?php $count = 0; foreach($produits as $produit): ?>
    <?= $count != 0 && $count%4 == 0 ? '</div>' : false ?>
    <?= $count == 0 || $count%4 == 0 ? '<div class="row">' : false ?>
    <div class="col-md-3">
        <div class="ibox">
            <div class="ibox-content product-box">
                <img class="img-responsive" src="/includes/images/noix/<?= $produit['idVariete'] ?>.jpg">
                <div class="product-desc">
                    <a href="/client/home/add?id="><span class="product-price">
                        <i class="fa fa-plus"></i>
                    </span></a>
                    <small class="text-muted"><?= $produit['nomVariete'] ?></small>
                    <p class="product-name"><?= $produit['libelleConditionnement'] ?></p>

                    <div class="small m-t-xs">
                        <ul>
                            <li><strong>Quantité : </strong><?= $produit['poidsConditionnee'] ?> Kg</li>
                            <li><strong>Calibre : </strong><?= $produit['intervalle'] ?></li>
                        </ul>
                    </div>
                    <div class="m-t text-righ">

                        <a href="#" class="btn btn-xs btn-outline btn-primary">Info <i class="fa fa-long-arrow-right"></i> </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php $count++; endforeach ?>
</div>
