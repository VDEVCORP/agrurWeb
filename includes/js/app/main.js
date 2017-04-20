$('.profession').on('change', function(){
    if($(".profession:checked").val() == "producteur"){
        $("#adherent").css('display','block')
    } else {
        $("#adherent").css('display','none')
    }
})

// Désactive un Utilisateur
$('.user-disable').click(function () {
    $element = $(this)
    var id = $element.attr('id')
    swal({
        title: "Êtes-vous sûr?",
        text: "Une fois désactivé, l'utilisateur ne pourra plus accéder à son compte!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Oui, désactiver!",
        cancelButtonText: "Retour",
        closeOnConfirm: false
    }, function() { 
        $.ajax(
            {
                type: "get",
                url: "/admin/utilisateurs/remove",
                data: "id="+id,
                success: function(data) {
                    swal("Fait!", "L'utilisateur à bien été désactivé!", "success");
                    $element.removeClass('user-disable').addClass('user-enable')
                    $element.removeClass('btn-danger').addClass('btn-success')
                    $element.text('Activer')
                }
            }
        )
        .error(function(data) {
            swal("Oops", "Une erreur s'est produite lors de la modification!", "error");
        });
    });
});

// Active un utilisateur
$('.user-enable').click(function(){
    $element = $(this)
    var id = $element.attr('id')
    $.ajax(
        {
            type: "get",
            url: "/admin/utilisateurs/activate",
            data: "id="+id,
            success: function(data){
            }
        }
    ).done(function(data){
        swal({
            title: "Fait!",
            text: "L'utilisateur à bien été activé!",
            type: "success"
        })
        $element.removeClass('user-enable').addClass('user-disable')
        $element.removeClass('btn-success').addClass('btn-danger')
        $element.text('Désactiver')
    }).error(function(data) {
        swal("Oops", "Une erreur s'est produite lors de la modification!", "error");
    });
});

// Supprime une commune
$('.commune-delete').click(function () {
    $element = $(this)
    var id = $element.attr('id')
    swal({
        title: "Êtes-vous sûr ?",
        text: "Cette information disparaitra également partout où elle apparait !",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Supprimer!",
        cancelButtonText: "Retour",
        closeOnConfirm: false
    }, function() { 
        $.ajax(
            {
                type: "get",
                url: "/admin/communes/delete",
                data: "id="+id,
                success: function(data) {
                    swal("Fait!", "La commune à bien été supprimée!", "success");
                    $element.closest('tr').remove()
                }
            }
        )
        .error(function(data) {
            swal("Oops", "Une erreur s'est produite lors de la suppression!", "error");
        });
    });
});

// Supprime une variété

$('.variete-delete').click(function () {
    $element = $(this)
    var id = $element.attr('id')
    swal({
        title: "Êtes-vous sûr ?",
        text: "Cette information disparaitra également partout où elle apparait !",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Supprimer!",
        cancelButtonText: "Retour",
        closeOnConfirm: false
    }, function() { 
        $.ajax(
            {
                type: "get",
                url: "/admin/varietes/delete",
                data: "id="+id,
                success: function(data) {
                    swal("Fait!", "La variété à bien été supprimée!", "success");
                    $element.closest('tr').remove()
                }
            }
        )
        .error(function(data) {
            swal("Oops", "Une erreur s'est produite lors de la suppression!", "error");
        });
    });
});

// Supprimer une livraison
$('.livraison-delete').click(function () {
    $element = $(this)
    var id = $element.attr('id')
    swal({
        title: "Êtes-vous sûr ?",
        text: "Cette information disparaitra également partout où elle apparait !",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Supprimer!",
        cancelButtonText: "Retour",
        closeOnConfirm: false
    }, function() { 
        $.ajax(
            {
                type: "get",
                url: "/admin/livraisons/delete",
                data: "id="+id,
                success: function(data) {
                    swal("Fait!", "La livraison à bien été supprimée!", "success");
                    $element.closest('tr').remove()
                }
            }
        )
        .error(function(data) {
            swal("Oops", "Une erreur s'est produite lors de la suppression!", "error");
        });
    });
});

// Supprimer un verger
$('.verger-delete').click(function () {
    $element = $(this)
    var id = $element.attr('id')
    swal({
        title: "Êtes-vous sûr ?",
        text: "Cette information disparaitra également partout où elle apparait !",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Supprimer!",
        cancelButtonText: "Retour",
        closeOnConfirm: false
    }, function() { 
        $.ajax(
            {
                type: "get",
                url: "/producteur/vergers/delete",
                data: "id="+id,
                success: function(data) {
                    swal("Fait!", "Le verger à bien été supprimé!", "success");
                    $element.closest('tr').remove()
                }
            }
        )
        .error(function(data) {
            swal("Oops", "Une erreur s'est produite lors de la suppression!", "error");
        });
    });
});

// Supprimer un lot
$('.lot-delete').click(function () {
    $element = $(this)
    var id = $element.attr('id')
    swal({
        title: "Êtes-vous sûr ?",
        text: "Cette information disparaitra également partout où elle apparait !",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Supprimer!",
        cancelButtonText: "Retour",
        closeOnConfirm: false
    }, function() { 
        $.ajax(
            {
                type: "get",
                url: "/admin/lots/delete",
                data: "id="+id,
                success: function(data) {
                    swal("Fait!", "Le lot à bien été supprimé!", "success");
                    $element.closest('tr').remove()
                }
            }
        )
        .error(function(data) {
            swal("Oops", "Une erreur s'est produite lors de la suppression!", "error");
        });
    });
});

// Supprimer un verger
$('.verger-delete').click(function () {
    $element = $(this)
    var id = $element.attr('id')
    swal({
        title: "Êtes-vous sûr ?",
        text: "Cette information disparaitra également partout où elle apparait !",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Supprimer!",
        cancelButtonText: "Retour",
        closeOnConfirm: false
    }, function() { 
        $.ajax(
            {
                type: "get",
                url: "/producteur/vergers/delete",
                data: "id="+id,
                success: function(data) {
                    swal("Fait!", "Le verger à bien été supprimé!", "success");
                    $element.closest('tr').remove()
                }
            }
        )
        .error(function(data) {
            swal("Oops", "Une erreur s'est produite lors de la suppression!", "error");
        });
    });
});

// Supprimer un lot
$('.certification-delete').click(function () {
    $element = $(this)
    var id = $element.attr('id')
    swal({
        title: "Êtes-vous sûr ?",
        text: "Cette information disparaitra également partout où elle apparait !",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Supprimer!",
        cancelButtonText: "Retour",
        closeOnConfirm: false
    }, function() { 
        $.ajax(
            {
                type: "get",
                url: "/admin/certifications/delete",
                data: "id="+id,
                success: function(data) {
                    swal("Fait!", "La certification à bien été supprimée!", "success");
                    $element.closest('tr').remove()
                }
            }
        )
        .error(function(data) {
            swal("Oops", "Une erreur s'est produite lors de la suppression!", "error");
        });
    });
});

// Supprimer un Conditionnement
$('.conditionnement-delete').click(function () {
    $element = $(this)
    var id = $element.attr('id')
    swal({
        title: "Êtes-vous sûr ?",
        text: "Cette information disparaitra également partout où elle apparait !",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Supprimer!",
        cancelButtonText: "Retour",
        closeOnConfirm: false
    }, function() { 
        $.ajax(
            {
                type: "get",
                url: "/admin/conditionnement/delete",
                data: "id="+id,
                success: function(data) {
                    swal("Fait!", "Le conditionnement à bien été supprimé!", "success");
                    $element.closest('tr').remove()
                }
            }
        )
        .error(function(data) {
            swal("Oops", "Une erreur s'est produite lors de la suppression!", "error");
        });
    });
});

// Supprimer une Commande (si possible :P)
$('.commande-delete').click(function () {
    $element = $(this)
    var id = $element.attr('id')
    swal({
        title: "Êtes-vous sûr ?",
        text: "La commande ainsi que ses détails seront perdus à jamais !",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Annuler!",
        cancelButtonText: "Retour",
        closeOnConfirm: false
    }, function() { 
        $.ajax(
            {
                type: "get",
                url: "/client/profil/delete",
                data: "id="+id,
                success: function(data) {
                    swal("Fait!", "La commande à bien été annulée!", "success");
                    $element.closest('tr').remove()
                }
            }
        )
        .error(function(data) {
            swal("Oops", "Une erreur s'est produite lors de l'annulation'!", "error");
        });
    });
});

// Ajout produit au panier
$('.add-panier').click(function (event){
    event.preventDefault()
    $.get($(this).attr('href'), {}, function(data){
        if(data.error){
            swal({
                title: "Error!",
                text: data.message,
                type: "error",
                confirmButtonText: "retour"
            })
        } else {
            swal({
                title: data.message,
                type: "success",
                showConfirmButton: false,
                timer: 900,
            })
        }
    }, 'json')
    return false
})

$('.remove-product').click(function(event){
    event.preventDefault()
    $.get($(this).attr('href'), {}, function(data){})
    $(this).closest('.ibox-content').remove()
})

$('.clear-panier').click(function(event){
    event.preventDefault()
    $.get($(this).attr('href'), {}, function(data){
        $('.item').each(function(){
            $(this).remove()
        })
    })
})

$('.change-status').click(function(event){
    event.preventDefault()
    $.get($(this).attr('href'), {}, function(data){})
    var tdpStatus = $(this).closest('td').prev().contents()
    switch($(this).attr('id')){
        case "encours" :
            $(this).prev().removeAttr('disabled')
            $(this).next().removeAttr('disabled')
            $(this).attr('disabled', true)
            tdpStatus.removeClass('text-danger')
            tdpStatus.removeClass('text-info')
            tdpStatus.addClass('text-success')
            tdpStatus.text('En cours')
            break
        case "expedie" :
            var btnExpedie = $(this).attr('disabled', true)
            var btnEncours = btnExpedie.prev().attr('disabled', true)
            btnEncours.prev().attr('disabled', true)
            tdpStatus.removeClass('text-success')
            tdpStatus.removeClass('text-danger')
            tdpStatus.addClass('text-info')
            tdpStatus.text('Expedié')
            break
        case "attente" :
            $(this).attr('disabled', true)
            var btnEncours = $(this).next().removeAttr('disabled')
            tdpStatus.removeClass('text-info')
            tdpStatus.removeClass('text-success')
            tdpStatus.addClass('text-danger')
            tdpStatus.text('En attente')
            break
    }
})