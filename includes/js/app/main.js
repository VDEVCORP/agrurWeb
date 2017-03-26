$(".profession").on('change', function(){
    if($(".profession:checked").val() == "producteur"){
        $("#adherent").css('display','block')
    } else {
        $("#adherent").css('display','none')
    }
})

$("#edit").click(function(e){
    
})

$("#delete").click(function(e){

})