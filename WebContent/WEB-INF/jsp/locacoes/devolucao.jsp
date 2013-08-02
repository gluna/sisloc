<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> -->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.maskMoney.js"></script>

<body>
	<form name="form" action="<c:url value='/locacoes/salvardevolucao'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Devolução de Equipamentos</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<fieldset id="nome_cliente" style="width: 1140px;">
				<legend>
					Dados da Locação:
				</legend>
				<table><tr>
					<td align="right" width="95"><label>Número da Locação:</label></td>
					<td align="left"><input	type="text" class="maiuscula" name="locacao.id" value="${locacao.id}" readonly /><br></td>
					<td align="right" width="95"><label>Cliente:</label></td>
					
					<td align="left">
						<input id="cliente" type="text" class="maiuscula" name="locacao.cliente.nome" size=50 value="${locacao.cliente.nome}" readonly/>				
					<br></td>
					
					<td align="right" width="80"><label>Frete:</label></td>
					<td align="left"><input	type="text" class="maiuscula" name="locacao.frete" value="${locacao.frete}" readonly/><br></td>
				</tr></table> 
				</fieldset>
				<br/>
				<fieldset id="formulario" style="width: 1140px;">
					<legend> Datas da Locação: </legend>
					<table>
						<tr>
							<td align="right" width="95"><label>Data da Locação:</label></td>
							<td align="left"><input type="text" class="data" name="locacao.dtlocacao" value="<fmt:formatDate value="${locacao.dtlocacao}" dateStyle="medium" />" readonly/><br></td>
							<td align="right" width="80"><label>Data Inicio:</label></td>
							<td align="left"><input type="text" class="data"
								name="locacao.dtinicio" value="<fmt:formatDate value="${locacao.dtinicio}" dateStyle="medium" />" readonly/></td>
							<br>
							<td align="right" width="80"><label>Data Fim:</label></td>
							<td align="left"><input type="text" class="data"
								name="locacao.dtfim" value="<fmt:formatDate value="${locacao.dtfim}" dateStyle="medium" />" readonly/></td>
						</tr>
					</table>
				</fieldset><br/>
				<fieldset id="itenslocacao" class="loc" style="width: 1140px;"><legend>Itens da Locação</legend>
					<c:forEach items="${locacao.locacaodetalhe}" var="locacaodetalhe" varStatus="status">
			   	        <div class="produtointem">
			    	    <label>Produto:</label>&nbsp
						<input type="text" id="produto" name="locacao.locacaodetalhe[${status.index}].produto.nome" value="${locacaodetalhe.produto.nome}" readonly/>&nbsp&nbsp			    		
						<label>R$:</label>&nbsp
						<input type="text" class="maiuscula" name="locacao.locacaodetalhe[${status.index}].preco" value="${locacaodetalhe.preco}" readonly/>&nbsp&nbsp			    		
						<label>Quantidade:</label>&nbsp
			    		<input type="text" id="qtde" name="locacao.locacaodetalhe[${status.index}].quantidade" value="${locacaodetalhe.quantidade}" readonly/>&nbsp&nbsp
			    		<input type="hidden" name="locacao.locacaodetalhe[${status.index}].id" value="${locacaodetalhe.id}" />
			    		</div>
					</c:forEach>				
				</fieldset><br/>
				<fieldset id="itensdevolucao" style="width: 1140px;">
				<legend>
					Itens Devolução:	
				</legend>
				<table align="right"><tr><td>
					<input type="button" name="button" value="Adicionar" onclick="adicionar();" icon="ui-icon-contact"/></td></tr>
				</table>
				<c:forEach items="${locacao.devolucaolocacao}" var="devolucao" varStatus="status">
		   	        <div class="devolucaoitem">
		    	    <label>Produto:</label>&nbsp
		    	    <input type="text" class="itemdevolucao" name="locacao.devolucaolocacao[${status.index}].produto.nome" value="${devolucao.produto.nome}" readonly/>
		    		<label>Quantidade:</label>&nbsp
		    		<input type="text" class="qtdedevolucao" name="locacao.devolucaolocacao[${status.index}].quantidade" value="${devolucao.quantidade}" readonly/>&nbsp&nbsp
		    		<label>Data:</label>&nbsp
		    	    <input type="text" class="data" name="locacao.devolucaolocacao[${status.index}].dtdevolucao" value="<fmt:formatDate value="${devolucao.dtdevolucao}" dateStyle="medium" />" readonly/>		    		
		    		<input type="hidden" name="locacao.devolucaolocacao[${status.index}].id" value="${devolucao.id}" />
		    		</div>
				</c:forEach>
				</fieldset>
				<br>
				<fieldset id="observacao" style="width: 1140px;">
				<legend>
					Observação:	
				</legend>
						<table><tr><td width="95"></td> 
						<td align="right"><textarea style="resize:none; text-transform: uppercase; background-color: #FFFFE0;" rows="10" cols="123" name="locacao.obs" readonly>${locacao.obs}</textarea><br> </td></tr></table>
				</fieldset>
				<br>
				<table align="center">
					<tr><td>
					<input type="button" name="button" onclick="conta();" value="Salvar" class="salvar" icon="ui-icon-disk"/><br/>	
					</td>
					<td>
					<!-- <input type="submit" value="Imprimir" class="imprimir" icon="ui-icon-print"/><br/>  -->
					<!-- <a href="<c:url value="/locacoes/report/${locacao.id}"/>" onclick="verificaid(${locacao.id})" name="imprimir"><span>Imprimir</span></a>	 -->
					</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</body>
<%@ include file="../../../footer.jsp"%>
 <script type="text/javascript">
     
 
 		var model =
 					'<br>' +
 					'<div class="devolucaoitem">'+
 					'<label>Produto:</label>&nbsp'+
 					'<select id="produto" class="itemdevolucao" name="locacao.devolucaolocacao[${status.index}].produto.id" value="devolucao.produto.id">'+
 					'	<option value=""></option>'+
 		    		'	<c:forEach items="${locacao.locacaodetalhe}" var="detalhe" varStatus="status">'+
 		    		'		<option value="${detalhe.produto.id}">${detalhe.produto.nome}</option>'+
 		    		'	</c:forEach>'+
 					'</select>&nbsp&nbsp'+
 					'<label>Quantidade:</label>&nbsp'+
 					'<input type="text" class="qtdedevolucao" name="locacao.devolucaolocacao[${status.index}].quantidade" value="${devolucao.quantidade}" />&nbsp&nbsp'+
 					'<input type="hidden" name="locacao.devolucaolocacao[${status.index}].id" value="${devolucao.id}" />'+
 					'</div>';
    		
    		$('.button-remover').live('click', function() {
    			$(this).parent().remove();
    			reorderIndexes();
    		});
    		
    		
    		function adicionar() {
    			
    			$('#itensdevolucao').append(model);

    			reorderIndexes();
    			
    		};
    		  		    		
    		function reorderIndexes() {
    			var regex = /\[[0-9]\]/g;
    			
    			$('.devolucaoitem').each(function(index) {
    				
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
    		
    		function conta() {
    			$('.loc').each(function() {
    				var auxnomeloc = document.getElementById("produto");
    				var nomeloc = auxnomeloc.value;
    				//alert(nomeloc);
    				//$('.itemdevolucao').each(function() {
    					//var itemdev = $(this).val();
	    				if (nomeloc  == "CADEIRA")
	    					alert("foi");
    				//});
    			});
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
		    display: none,
			buttonImage: "${pageContext.request.contextPath}/images/calendar.gif",
			buttonImageOnly: true
		});
 });
 </script>
<style type="text/css">
input.maiuscula {
  text-transform: uppercase;
  background-color: #FFFFE0;
}
input.itemlocado {
  text-transform: uppercase;
  background-color: #FFFFE0;
}
input.qtdelocada {
  text-transform: uppercase;
  background-color: #FFFFE0;
}
input.itemdevolucao {
  text-transform: uppercase;
  background-color: #FFFFE0;
}
input.qtdedevolucao {
  text-transform: uppercase;
  background-color: #FFFFE0;
}
.data {
  background-color: #FFFFE0;
}
.button-remover {
  background-image: url('${pageContext.request.contextPath}/images/btn_remover.png');
  cursor:pointer;
  border: none;
  width: 34px;
  height: 33px;
}
.button-remover-end {
  background-image: url('${pageContext.request.contextPath}/images/btn_remover.png');
  cursor:pointer;
  border: none;
  width: 34px;
  height: 33px;
}
</style>

