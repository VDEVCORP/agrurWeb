$(".profession").on('change', function(){
    if($(".profession:checked").val() == "producteur"){
        $("#adherent").css('display','block')
    } else {
        $("#adherent").css('display','none')
    }
})