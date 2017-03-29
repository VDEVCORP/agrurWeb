$('.profession').on('change', function(){
    if($(".profession:checked").val() == "producteur"){
        $("#adherent").css('display','block')
    } else {
        $("#adherent").css('display','none')
    }
})

$('.user-disable').click(function () {
    $element = $(this)
    var id = $element.attr('id')
    swal({
        title: "Êtes-vou sûr?",
        text: "Une fois désactivé, l'utilisateur ne pourra plus accéder à son compte!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Oui, désactiver!",
        closeOnConfirm: false
    }, function() { 
        $.ajax(
            {
                type: "get",
                url: "/admin/utilisateurs/remove",
                data: "id="+id,
                success: function(data){
                }
            }
        )
        .done(function(data) {
            swal("Désactivé!", "L'utilisateur à bien été désactivé!", "success");
        })
        .error(function(data) {
            swal("Oops", "Une erreur s'est produite lors de la modification!", "error");
        });
    });
});