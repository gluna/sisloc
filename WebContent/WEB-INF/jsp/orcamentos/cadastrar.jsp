<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> -->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.maskMoney.js"></script>
<body onload="getcliente(${orcamento.id});">
	<form name="form1" action="<c:url value='/orcamentos/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Cadastro de Orçamento</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<fieldset id="nome_cliente" style="width: 1140px;">
				<legend>
					Dados do Orçamento:
				</legend>
				<table><tr>
					<td align="right" width="95"><label>Número do Orçamento:</label></td>
					<td align="left"><input	type="text" name="orcamento.id" value="${orcamento.id}" readonly /><br></td>
					<td align="right" width="95"><label>Nome do Cliente/Empresa:</label></td>
					<td align="left"><input	type="text" class="maiuscula" name="orcamentocliente" size=50 value="${orcamento.cliente}" /><br></td>
					<td><input type="button" name="button" id="add-user" value="Procurar" icon="ui-icon-search"/></td>
					<td align="right" width="50"><label>Frete:</label></td>
					<td align="left"><input	type="text" class="dinheiro" name="orcamento.frete" size=15 value="${orcamento.frete}" /><br></td>
				</tr></table>
				<table><tr>
						<td align="right" width="95"><label>Observação:</label></td></tr></table>
						<table><tr><td width="95"></td> 
						<td align="right"><textarea style="resize:none; text-transform: uppercase;" rows="10" cols="123" name="orcamento.obs" />${orcamento.obs}</textarea><br> </td></tr></table><br>
				</fieldset>
				<br/>
				<fieldset id="formulario" style="width: 1140px;"> 
				<legend>
					Datas do Orçamento:
				</legend>
				<!--<label>ID:</label> <input type="hidden" name="orcamento.id" value="${orcamento.id}" readonly /> -->
					<table><tr><td align="right" width="95"> 
						<label>Data do Orçamento:</label></td> 
						<td align="left"><input	type="text" class="data" name="orcamento.data" value="<fmt:formatDate value="${orcamento.data}" dateStyle="medium" />" /><br></td>
						<td align="right" width="80"><label>Data Inicio:</label></td> 
						<td align="left"><input	type="text" class="data" name="orcamento.inicio" value="<fmt:formatDate value="${orcamento.inicio}" dateStyle="medium" />" /></td><br>
						<td align="right" width="80"><label>Data Fim:</label> </td>
						<td align="left"><input type="text" class="data" name="orcamento.fim" value="<fmt:formatDate value="${orcamento.fim}" dateStyle="medium" />" /> </td>
						</tr></table>
				</fieldset>
				<br/>
				
				<fieldset id="detalhe-container" style="width: 1140px;">
				<legend>
					Detalhes do Orçamento:
				</legend>
				<table align="right"><tr><td>
					<input type="button" name="button" value="Adicionar" onclick="adicionar();" icon="ui-icon-contact"/></td></tr>
				</table>
				<c:forEach items="${orcamento.orcamentodetalhe}" var="orcamentodetalhe" varStatus="status">
					    <div class="produtointem">
						    <label>Produto:</label>&nbsp
							<select id="produto" onchange="getpreco(value, name);" name="orcamento.orcamentodetalhe[${status.index}].produto.id" value="orcamentodetalhe.produto.id">
								<option value="${orcamentodetalhe.produto.id}">${orcamentodetalhe.produto.nome}</option>
							</select>&nbsp&nbsp
							<label>R$:</label>&nbsp
							<select id="preco" name="orcamento.orcamentodetalhe[${status.index}].preco" value="orcamentodetalhe.preco">
								<option value="${orcamentodetalhe.preco}">${orcamentodetalhe.preco}</option>
							</select>&nbsp&nbsp
							<label>Quantidade:</label>&nbsp
							<input type="text" name="orcamento.orcamentodetalhe[${status.index}].quantidade" value="${orcamentodetalhe.quantidade}" />&nbsp&nbsp
							<input type="hidden" name="orcamento.orcamentodetalhe[${status.index}].id" value="${orcamentodetalhe.id}" />
							<input type="button" class="button-remover" />
						</div>
				</c:forEach>
				</fieldset>
				<br/>
	
				<br>
				<table align="center">
					<tr><td> 
					<input type="submit" value="Salvar" class="salvar" icon="ui-icon-disk"/><br />
					</td>
					<td>
					<!-- <input type="button" value="Imprimir" class="imprimir" icon="ui-icon-print" action="<c:url value='/orcamentos/salvar'/>"></a><br/> -->
					<a href="<c:url value="/orcamentos/report/${orcamento.id}"/>" onclick="verificaid(${orcamento.id})" name="imprimir"><span>Imprimir</span></a>
					</td></tr>
				</table>
			</div>
		</div>	
	</form>
	
	<div id="dialog-form" class="caixa" title="Adicionar Cliente/Empresa">
		<form name="form">
			<fieldset>
				<label for="name">Cliente/Empresa:</label>
				<select id="cliente"  name="clienteid" value="orcamento.cliente.id">
				</select>
			</fieldset>
		</form>
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
	'<input type="hidden" name="orcamento.orcamentodetalhe[0].id" value="${orcamentodetalhe.id}" />'+
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
    							$input.append('<option value="'+precos[i].preco+'">'+precos[i].preco+'&nbsp/&nbsp'+precos[i].dias+'&nbspdia(s)'+'</option>');
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
	
	function getcliente(id){
		if(id == null){
	    $.ajax({  
	        url: '/sisloc/orcamentos/getclientes',  
	        type : 'get',  
	        dataType: 'json',  
	        success : function(clientes) {
	            
	            	$('.caixa').each(function(index) {

	    				var $campos = $(this).find('select'),
    					$input	,
    					name	;

    			    $campos.each(function() {
    					$input	= $(this),
    					name	= $input.attr('id');
    					if(name == 'cliente'){
    						$input.find('option').remove();
    						$input.append('<option value="">Selecione um Item</option>');
    						for (var i = 0; i < clientes.length; i++){
    							$input.append('<option value="'+clientes[i].nome+'">'+clientes[i].nome+'</option>');
    						};
    					};
	    			});
	            		
	            	});    
	        }  
	    });
		};
	}
	
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
  function verificaid(id){
	  if(id == null){
		  alert("Salve o Orçamento Primeiro");
	  }
  }
  
  $(document).ready(function(){
	    $("input.dinheiro").maskMoney({showSymbol:false, symbol:"R$", decimal:".", thousands:"."});
	});
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
		$('input[name="button"]').each(function () {
			   $(this).hide().after('<button>').next().button({
			        icons: { primary: $(this).attr('icon') },
			        label: $(this).val()
			    }).click(function (event) {
			         event.preventDefault();
			         $(this).prev().click();
			    });
			});
		$('a[name="imprimir"]').each(function () {
			   $(this).button({icons: {primary: "ui-icon-print"}});
			   //$(this).click();
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
		
		 $( "#add-user" )
			 //.button()
			 .click(function() {
			 	$( "#dialog-form" ).dialog( "open" );
		 });
		  
		 $( "#dialog-form" ).dialog({
			 autoOpen: false,
			 show: {
				 effect: "blind",
				 duration: 1000
				 },
				 hide: {
				 effect: "explode",
				 duration: 1000
				 },
			 height: 180,
			 width: 350,
			 modal: true,
			 buttons: {
			 "Adicionar": function() {
				 var campo1 = document.form.clienteid;
				 var valor1 = campo1.value;
				 document.form1.orcamentocliente.value = valor1;
				 $( this ).dialog( "close" );
			 },
			 	Cancel: function() {
			 		$( this ).dialog( "close" );
			 	}
			 },
			 	close: function() {
			 	}
			 });
	 
		//$( "#name" ).change(function() {
		//	alert(prod.val());
	});
	
</script>
<style type="text/css">
input.maiuscula {
  text-transform: uppercase;
}

.button-remover {
  background-image: url('${pageContext.request.contextPath}/images/btn_remover.png');
  cursor:pointer;
  border: none;
  width: 34px;
  height: 33px;
}
</style>
