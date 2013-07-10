<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> -->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<body>
	<form action="<c:url value='/orcamentos/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Cadastro de Orçamento</a></li>
			</ul>
			<div id="tabs-1">
				<br><br>
				<fieldset id="formulario" style="width: 1140px;"> 
				<legend>
					Datas do Orçamento:
				</legend>
				<!--<label>ID:</label> --><input type="hidden" name="orcamento.id" value="${orcamento.id}" readonly />
					<table><tr><td align="right" width="95"> 
						<label>Data do Orçamento:</label></td> 
						<td align="left"><input	type="text" class="data" name="orcamento.data" value="${orcamento.data}" /><br></td>
						<td align="right" width="80"><label>Data Inicio:</label></td> 
						<td align="left"><input	type="text" class="data" name="orcamento.inicio" value="${orcamento.inicio}" /></td><br>
						<td align="right" width="80"><label>Data Fim:</label> </td>
						<td align="left"><input type="text" class="data" name="orcamento.fim" value="${orcamento.fim}" /> </td>
						</tr></table>
				</fieldset>
				<br/>
				
				<fieldset id="detalhe-container" style="width: 1140px;">
				<legend>
					Detalhes do Orçamento:
				</legend>
				<table align="right"><tr><td>
					<input type="button" value="Adicionar" onclick="adicionar();" icon="ui-icon-contact"/></td></tr>
				</table>
				<!--<c:forEach items="${orcamento.orcamentodetalhe}" var="orcamentodetalhe" varStatus="status">
					<div class="orcamentodetalhe">
						<label>Nome:</label>
						<input type="text" name="orcamento.orcamentodetalhe[${status.index}].produto" value="${orcamentodetalhe.produto}" />
						<input type="text" name="orcamento.orcamentodetalhe[${status.index}].quantidade" value="${orcamentodetalhe.quantidade}" />
						<input type="text" name="orcamento.orcamentodetalhe[${status.index}].preco" value="${orcamentodetalhe.preco}" />
						<input type="hidden" name="orcamento.orcamentodetalhe[${status.index}].id" value="${orcamentodetalhe.id}" />
						'<img src="${pageContext.request.contextPath}/images/remover.png" alt="-" class="button-remover" />'
					</div>
				</c:forEach>-->
					<div class="orcamentodetalhe">
					<table id="orcamentodetalhe">
					</table>
					</div>
				</fieldset><br/>
	
				<br>
				<table align="center">
					<tr><td> 
					<input type="submit" value="Salvar" class="salvar" icon="ui-icon-disk"/><br /></tr></td>
				</table>
			</div>
		</div>	
	</form>
	<div id="dialog-form" title="Adicionar produto">
			<fieldset>
		    	<label for="name">Produto:</label>
		    	<select name="name" id="name">
		    		<c:forEach items="${produtoList}" var="produto" varStatus="status">
						  <option id="p" value="${produto.nome}">${produto.nome}</option>
					</c:forEach>
				</select>
				
		  </fieldset>
	</div>
</body>
<%@ include file="../../../footer.jsp"%>

<script type="text/javascript">
var model =
    '<div class="produtointem">'+
    '<label>Produto:</label>&nbsp' +
	'<select id="produto" onchange="getpreco(value, name);" name="orcamento.orcamentodetalhe[0].produto.id" value="orcamento.orcamentodetalhe[0].produto.id">'+
	'	<option value="">Selecione um Item</option>'+
	'	<c:forEach items="${produtoList}" var="produto" varStatus="status">'+
	'		<option value="${produto.id}">${produto.nome}</option>'+
	'	</c:forEach>'+
	'</select>&nbsp&nbsp'+
	'<label>R$:</label>&nbsp' +
	'<select id="preco" name="orcamento.orcamentodetalhe[0].preco" value="orcamento.orcamentodetalhe[0].preco">'+
	'</select>&nbsp&nbsp'+
	'<label>Quantidade:</label>&nbsp' +
	'<input type="text" name="orcamento.orcamentodetalhe[0].quantidade" value="${orcamento.orcamentodetalhe[0].quantidade}" />&nbsp&nbsp'+
	'<input type="button" class="button-remover" />' +
	'</div>';
	
	function getpreco(id, nome){
		
		var indice = nome.substring(nome.indexOf('[')+1, nome.indexOf(']'));
		
	    $.ajax({  
	        url: '/sisloc/orcamentos/getprecos/',  
	        data: {p:id},  
	        type : 'get',  
	        dataType: 'json',  
	        success : function(precos) {
	            
	            	$('.produtointem').each(function(index) {

	    				var $campos = $(this).find('select'),
    					$input	,
    					name	;

    			    $campos.each(function() {
    					$input	= $(this),
    					name	= $input.attr('id');
    					npreco  = $input.attr('name');
    					index2 = npreco.substring(npreco.indexOf('[')+1, npreco.indexOf(']'));
    					if(name == 'preco' && indice == index2){
    						$input.find('option').remove();
    						for (var i = 0; i < precos.length; i++){
    							$input.append('<option value="'+precos[i].preco+'">'+precos[i].preco+'</option>');
    						}
    					}
	    			});
	            		
	            	});    
	        }  
	    });
	}
		
	$('.button-remover').live('click', function() {
		$(this).parent().remove();
		reorderIndexes();
	});
	
	$('.salvar').live('click', function() {
		alert("Dados salvos com sucesso!!");
	});

	function adicionar() {
		$('#detalhe-container').append(model);
		reorderIndexes();
	};
	
	function reorderIndexes() {
		var regex = /\[[0-9]\]/g;
		
		$('.produtointem').each(function(index) {
			
			var $campos = $(this).find('input'),
				$input	,
				name	;

			$campos.each(function() {
				
				$input	= $(this),
				name	= $input.attr('name');
				if($input.attr('type') != 'button'){
					$input.attr('name', name.replace(regex, '[' + index + ']'));
				}
			});
			
			var $campos = $(this).find('select'),
				$input	,
				name	;

		    $campos.each(function() {
			
				$input	= $(this),
				name	= $input.attr('name');
				if($input.attr('type') != 'button'){
					$input.attr('name', name.replace(regex, '[' + index + ']'));
				}
		});
			
		});
		
	};

</script>
<script>
	$(function() {
		$( "#tabs" ).tabs();
		$('input[type="submit"]').each(function () {
			   $(this).hide().after('<button>').next().button({
			        icons: { primary: $(this).attr('icon') },
			        label: $(this).val()
			    }).click(function (event) {
			         event.preventDefault();
			         $(this).prev().click();
			    });
			});
		$('input[type="button"]').each(function () {
			   $(this).hide().after('<button>').next().button({
			        icons: { primary: $(this).attr('icon') },
			        label: $(this).val()
			    }).click(function (event) {
			         event.preventDefault();
			         $(this).prev().click();
			    });
			});
		$(".data").datepicker({
		    dateFormat: 'dd/mm/yy',
		    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
		    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
		    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
		    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
		    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
		    nextText: 'Próximo',
		    prevText: 'Anterior',
		    showOn: "button",
			buttonImage: "${pageContext.request.contextPath}/images/calendar.gif",
			buttonImageOnly: true
		});
	 
		//$( "#name" ).change(function() {
		//	alert(prod.val());
		//});
		var prod = "";
		prod = $("#p");
		$( "#dialog-form" ).dialog({
	      autoOpen: false,
	      height: 300,
	      width: 350,
	      modal: true,
	      buttons: {
	        "Adicionar": function() {
	 
	            $( "#orcamentodetalhe" ).append(
	            		"<tr>" +
	            		"<td>" +
	            		"<label>Produto:</label>" +
	            		"</td>" +
	            		"<td>" +
	            		"<input type='text' value='" +
	            		prod.val() + "' />" +
	              		"</td>" +
	              		"</tr>" );
	            $( this ).dialog( "close" );
	        },
	        Cancel: function() {
	          $( this ).dialog( "close" );
	        }
	      }
	   });
	    $( "#add-prod" )
	      .click(function() {
	        $( "#dialog-form" ).dialog( "open" );
	      });
	});
	
</script>
