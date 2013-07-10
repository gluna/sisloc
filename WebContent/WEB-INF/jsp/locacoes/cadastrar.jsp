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
				<br>
				<br>
				<fieldset id="formulario" style="width: 1140px;">
					<legend> Datas da Locação: </legend>
					<!--<label>ID:</label> -->
					<input type="hidden" name="locacao.id" value="${locacao.id}"
						readonly />
					<table>
						<tr>
							<td align="right" width="95"><label>Data da Locação:</label></td>
							<td align="left"><input type="text" class="data"
								name="locacao.dtlocacao" value="${locacao.dtlocacao}" /><br></td>
							<td align="right" width="80"><label>Data Inicio:</label></td>
							<td align="left"><input type="text" class="data"
								name="locacao.dtinicio" value="${locacao.dtinicio}" /></td>
							<br>
							<td align="right" width="80"><label>Data Fim:</label></td>
							<td align="left"><input type="text" class="data"
								name="locacao.dtfim" value="${locacao.dtfim}" /></td>
						</tr>
					</table>
				</fieldset>
				<fieldset id="locacaodetalhe" style="width: 1140px;">
				<legend>
					Itens Locação:	
				</legend>
				<table align="right"><tr><td>
					<input type="button" value="Adicionar" onclick="adicionar();" icon="ui-icon-contact"/></td></tr>
				</table>
				<c:forEach items="${locacao.locacaodetalhe}" var="detalhe" varStatus="status">
				<div class="produtointem">
					<select id="produto"  name="locacao.locacaodetalhe[0].produto" value="locacao.locacaodetalhe[0].produto">
						<c:forEach items="${produtoList}" var="produto" varStatus="status">
							<option value="${produto.id}">${produto.nome}</option>
						</c:forEach>
					</select>
					<input type="text" name="locacao.locacaodetalhe[${status.index}].quantidade" value="${detalhe.quantidade}" />
				</div>
				</c:forEach>
				</fieldset>
				<table align="center">
					<tr><td>
					<input type="submit" value="Salvar" class="salvar" icon="ui-icon-disk"/><br/>	
					</td>
					<td>
					<input type="submit" value="Imprimir" class="imprimir" icon="ui-icon-print"/><br/>	
					</td></tr>
				</table>
			</div>
		</div>
	</form>
	
</body>
<%@ include file="../../../footer.jsp"%>
 <script type="text/javascript">
     
     var model =
    	    '<div class="produtointem">'+
    	    '<label>Produto:</label>&nbsp' +
    		'<select id="produto" onchange="teste(value);" name="locacao.locacaodetalhe[0].produto.id" value="locacao.locacaodetalhe[0].produto.id">'+
    		'	<c:forEach items="${produtoList}" var="produto" varStatus="status">'+	
    		'		<option value="${produto.id}">${produto.nome}</option>'+
    		'	</c:forEach>'+
    		'</select>&nbsp&nbsp'+
    		'<label>R$:</label>&nbsp' +
    		'<select id="preco" name="locacao.locacaodetalhe[0].preco" value="locacao.locacaodetalhe[0].preco">'+
    		'	<c:forEach items="${produtoList}" var="produto" varStatus="status">'+	
    		'		<option value="${produto.id}">${produto.nome}</option>'+
    		'	</c:forEach>'+
    		'</select>&nbsp&nbsp'+
    		'<label>Quantidade:</label>&nbsp' +
    		'<input type="text" name="locacao.locacaodetalhe[0].quantidade" value="${locacao.locacaodetalhe[0].quantidade}" />&nbsp&nbsp'+
			'<input type="button" class="button-remover" />' +
    		'</div>';

    		$('.button-remover').live('click', function() {
    			$(this).parent().remove();
    			reorderIndexes();
    		});
    		
    		function adicionar() {
    			
    			$('#locacaodetalhe').append(model);

    			reorderIndexes();
    			
    		};
    		
    		function teste(id){
    		    $.ajax({  
    		        url: '/locacoes/getprecos/',  
    		        data: {p:id},  
    		        type : 'get',  
    		        dataType: 'json',  
    		        success : function(precos) {
    		        	alert("funcionou");
    		            //$('#cidade').empty(); // Precisa limpar a combo antes.  
    		            // no java vc faz cidades.get(0).getName() e cidades.get(0).getId(),  
    		            // Com JSON vc vai fazer cidades[0].name e cidades[0].id  
    		            //for (var i = 0; i < cidades.length; i++){  
    		            //    $('#cidade').append('<option value="' + cidades[i].id + '">' + cidades[i].name + '</option>');  
    		            //}  
    		        }  
    		    });  
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
 });
 </script>
<style type="text/css">
.button-remover {
  background-image: url('${pageContext.request.contextPath}/images/btn_remover.png');
  cursor:pointer;
  border: none;
  width: 34px;
  height: 33px;
}
</style>

