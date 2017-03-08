function ajoutTab(idProduct)
{
	$.ajax
	(
		{
			type:"POST",
			url:"/actions/ajax/ajoutTab",
			data:{'refAjout' : idProduct},
			success:function(data)
			{
				document.getElementById("saisitRef").value="";
				document.getElementById("resultat").innerHTML="";
				$("#ajoutTab").html(data);
			}
	});
}
