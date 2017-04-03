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



function updateLinks(){
    
}