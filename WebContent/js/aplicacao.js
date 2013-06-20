$(function () { 
	function removeCampo() { 
		$(".removerCampo").unbind("click"); 
		$(".removerCampo").bind("click", function () { 
			i=0; 
			$(".telefones p.campoTelefone").each(function () { 
				i++; 
			}); 
			if (i>1) { 
				$(this).parent().remove(); 
				} 
			}); 
		} 
	removeCampo(); 
	$(".adicionarCampo").click(function () { 
		novoCampo = $(".telefones p.campoTelefone:first").clone(); 
		novoCampo.find("input").val(""); 
		novoCampo.insertAfter(".telefones p.campoTelefone:last"); 
		removeCampo(); 
		});
	
	$(".add").click(function(){

        var elemento = document.createElement('input');
        var objContainer = document.getElementsByTagName('label')[0];
        var cria = objContainer.appendChild(elemento);

		});

	});