<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> -->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<body>
	<form action="<c:url value='/locacoes/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Cadastro de Locações</a></li>
			</ul>
			<div id="tabs-1">
				<br><br>
				<fieldset id="formulario" style="width: 1140px;"> 
				<legend>
					Datas da Locação:
				</legend>
				<!--<label>ID:</label> --><input type="hidden" name="locacao.id" value="${locacao.id}" readonly />
					<table><tr><td align="right" width="95"> 
						<label>Data da Locaçõ:</label></td> 
						<td align="left"><input	type="text" class="data" name="locacao.data" value="${locacao.data}" /><br></td>
						<td align="right" width="80"><label>Data Inicio:</label></td> 
						<td align="left"><input	type="text" class="data" name="locacao.inicio" value="${locacao.inicio}" /></td><br>
						<td align="right" width="80"><label>Data Fim:</label> </td>
						<td align="left"><input type="text" class="data" name="locacao.fim" value="${locacao.fim}" /> </td>
						</tr></table>
				</fieldset>
				<br/>
				
				<fieldset id="detalhe-container" style="width: 1140px;">
				<legend>
					Detalhes da Locação:
				</legend>
				<table align="right"><tr><td>
					<input type="button" id="add-prod" value="Adicionar" icon="ui-icon-document"/></td>
					</tr>
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
					<div class="locacaodetalhe">
					<table id="locacaodetalhe" border="1">
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
		<sql:query var="qryProduto" dataSource="${ds}">
                select nome from PRODUTO
                order by nome
        </sql:query>
			<fieldset>
		    	<label for="name">Produto:</label>
		    	<select name="name">
		    		<c:forEach items="${qryProduto.rows}" var="prod">
						  <option id="prod" value="${prod.nome}">${prod.nome}</option>
						  <input type="hidden" value="${prod.id}">
					</c:forEach>
				</select>
				<sql:query var="qryPreco" dataSource="${ds}">
	                select preco from PRECO
	                where precos_id = 2
        		</sql:query>
        		<select name="preco">
		    		<c:forEach items="${qryPreco.rows}" var="preco_prod">
						  <option id="preco" value="${preco_prod.preco}">${preco_prod.preco}</option>
					</c:forEach>
				</select>
		  </fieldset>
	</div>
</body>
<%@ include file="../../../footer.jsp"%>

<script type="text/javascript">
	var model =
		'<div class="locacaodetalhe">' +
			'<label>Numero:</label>' +
			'<select id="pr" name="pr">' +
			'</select>' +
			'<input type="text" name="locacao.locacaodetalhe[${status.index}].produto" value="${locacaodetalhe.produto}" />'+
			'<input type="text" name="locacao.locacaodetalhe[${status.index}].quantidade" value="${locacaodetalhe.quantidade}" />'+
			'<input type="text" name="locacao.locacaodetalhe[${status.index}].preco" value="${locacaodetalhe.preco}" />'+
			'<input type="hidden" name="locacao.locacaodetalhe[${status.index}].id" value="${locacaodetalhe.id}" />'+
			'<img src="${pageContext.request.contextPath}/images/excluir.png" alt="-" class="button-remover" />' +
		'</div>';
		
		//$('#produto').on('change', function(){   
		//    $.ajax({  
		//        url: '/produtos/consultar',    
		//        type : 'get',  
		//        dataType: 'json',  
		//        success : function(produto) {  
		            //$('#produto').empty(); // Precisa limpar a combo antes.    
		//            for (var i = 0; i < produto.length; i++){  
		//                $('#produto').append('<option value="' + produto[i].nome + '">' + produto[i].nome + '</option>');  
		//            }  
		//        }  
		//    });  
		//});
		
		//$('#produto').live('load', function(){
		//	$.getJSON('<c:url value="/produtos/consultar/2"/>', function(json) {
		//		$('#prodlist').empty();
				//for (var i = 0; i < produto.length; i++){
		//			$('#prodlist').append('<option value="' + produto.nome + '">' + produto.nome + '</option>');
				//}
		//	});
		//});

	//function carregar() {
		//id = "container";
		//$.getJSON('<c:url value="/produtos/consultar"/>', function(json) {
			//alert("teste");
		//});
		//$.ajax({
			//url: '/produtos/consultanome',
			//data: 'container',
			//type: 'get',
			//dataType: 'json',
			//success: function (prod) {
				//$('#pr').empty();
				//for (var i = 0; i < prod.length; i++){
					//$('#pr').append('<option value="' + prod[i].nome + '">' + prod[i].nome + '</option>')
				//}
			//} 
		//});
	//}
		
	$('.button-remover').live('click', function() {
		$(this).parent().remove();
		reorderIndexes();
	});
	
	$('.salvar').live('click', function() {
		alert("Dados salvos com sucesso!!");
	});

	function adicionar() {
		$('#detalhe-container').append(model);
		//carregar();
		reorderIndexes();
	};
	
	function reorderIndexes() {
		var regex = /\[[0-9]\]/g;
	
		$('.locacaodetalhex').each(function(index) {
			var $campos = $(this).find('input'),
				$input	,
				name	;

			$campos.each(function() {
				$input	= $(this),
				name	= $input.attr('name');

				$input.attr('name', name.replace(regex, '[' + index + ']'));
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
		    dateFormat: 'dd/mm/yyyy',
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
		var prod = $( "#prod" );
	 
	    $( "#dialog-form" ).dialog({
	      autoOpen: false,
	      height: 300,
	      width: 350,
	      modal: true,
	      buttons: {
	        "Adicionar": function() {
	 
	            $( "#locacaodetalhe" ).append(
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
