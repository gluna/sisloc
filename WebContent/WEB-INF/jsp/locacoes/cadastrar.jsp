<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> -->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>

<body>
	<form action="<c:url value='/locacoes/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Cadastro de Loca��es</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<fieldset id="nome_cliente" style="width: 1140px;">
				<legend>
					Dados da Loca��o:
				</legend>
				<table><tr>
					<td align="right" width="95"><label>N�mero da Loca��o:</label></td>
					<td align="left"><input	type="text" name="locacao.id" value="${locacao.id}" readonly /><br></td>
					<td align="right" width="95"><label>Nome do Cliente:</label></td>
					<td align="left"><input	type="text" class="maiuscula" name="locacao.nome" size=50 value="${locacao.nome}" /><br></td>
				</tr></table> 
				</fieldset>
				<br/>
				<fieldset id="endereco_cliente" style="width: 1140px;">
				<legend>
					Endere�o de Entrega:
				</legend><input type="hidden" name="locacao.tipoendereco" value="${locacao.tipoendereco}" />
				<table><tr><td align="right" width="95"><label>Endere�o:</label> </td>
						<td align="left"><input class="maiuscula" type="text" name="locacao.logradouro" size=96 value="${locacao.logradouro}" /> </td>
						<td align="right"><label>N�mero:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="locacao.numero" size=10 value="${locacao.numero}" /><br> </td></tr></table><br> 
						<table><tr><td align="right"> <label>Complemento:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="locacao.complemento" size=50 value="${locacao.complemento}" /> <br></td>
						<td align="right" width="85"><label>Bairro:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="locacao.bairro" size=29 value="${locacao.bairro}" /><br> </td>
						</tr></table><br>
						<table><tr><td align="right" width="95"> <label>Cidade:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="locacao.cidade" size=50 value="${locacao.cidade}" /> <br></td>
						<td align="right" width="85"><label>UF:</label></td> 
						<td align="left"> 
						<select name="locacao.uf">
								<option value="${locacao.uf}">${locacao.uf}</option>
								<option value="AC">ACRE</option>
								<option value="AL">ALAGOAS</option>
								<option value="AP">AMAP�</option>
								<option value="AM">AMAZONAS</option>
								<option value="BA">BAHIA</option>
								<option value="CE">CEAR�</option>
								<option value="DF">DISTRITO FEDERAL</option>
								<option value="ES">ESPIRITO SANTO</option>
								<option value="GO">GOI�S</option>
								<option value="MA">MARANH�O</option>
								<option value="MS">MATO GROSSO DO SUL</option>
								<option value="MT">MATO GROSSO</option>
								<option value="MG">MINAS GERAIS</option>
								<option value="PA">PAR�</option>
								<option value="PB">PARA�BA</option>
								<option value="PR">PARAN�</option>
								<option value="PE">PERNAMBUCO</option>
								<option value="PI">PIAU�</option>
								<option value="RJ">RIO DE JANEIRO</option>
								<option value="RN">RIO GRANDE DO NORTE</option>
								<option value="RS">RIO GRANDE DO SUL</option>
								<option value="RO">ROND�NIA</option>
								<option value="RR">RORAIMA</option>
								<option value="SC">SANTA CATARINA</option>
								<option value="SP">S�O PAULO</option>
								<option value="SE">SERGIPE</option>
								<option value="TO">TOCANTINS</option>
						</select>
						<br> </td>
						<td align="right" width="67"><label>CEP:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="locacao.cep" size=12 value="${locacao.cep}" /><br> </td>
						</tr></table><br>
				</fieldset>
				<br/>
				<fieldset id="formulario" style="width: 1140px;">
					<legend> Datas da Loca��o: </legend>
					<!--<label>ID:</label> -->
					<input type="hidden" name="locacao.id" value="${locacao.id}"
						readonly />
					<table>
						<tr>
							<td align="right" width="95"><label>Data da Loca��o:</label></td>
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
					Itens Loca��o:	
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
				<br>
				<fieldset id="nome_cliente" style="width: 1140px;">
				<legend>
					Valores da Loca��o:
				</legend>
				<table><tr>
					<td align="right" width="95"><label>Nota R$:</label></td>
					<td align="left"><input	type="text" name="locacao.valortotal" value="${locacao.valortotal}"/><br></td>
					<td align="right" width="95"><label>Desconto (%):</label></td>
					<td align="left"><input	type="text" name="locacao.descontopercent" value="${locacao.descontopercent}" /><br></td>
					<td align="right" width="95"><label>Desconto (R$):</label></td>
					<td align="left"><input	type="text" name="locacao.descontovalor" value="${locacao.descontovalor}" /><br></td>
				</tr></table>
				</fieldset><br>
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
    		'<select id="produto" onchange="getpreco(value, name);" name="locacao.locacaodetalhe[0].produto.id" value="locacao.locacaodetalhe[0].produto.id">'+
    		'	<option value="">Selecione um Item</option>'+
    		'	<c:forEach items="${produtoList}" var="produto" varStatus="status">'+
    		'		<option value="${produto.id}">${produto.nome}</option>'+
    		'	</c:forEach>'+
    		'</select>&nbsp&nbsp'+
    		'<label>R$:</label>&nbsp' +
    		'<select id="preco" name="locacao.locacaodetalhe[0].preco" value="locacao.locacaodetalhe[0].preco">'+
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
    		
    		function getpreco(id, nome){
    			
    			var indice = nome.substring(nome.indexOf('[')+1, nome.indexOf(']'));
    			
    		    $.ajax({  
    		        url: '/sisloc/locacoes/getprecos/',  
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
		    dayNames: ['Domingo','Segunda','Ter�a','Quarta','Quinta','Sexta','S�bado'],
		    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
		    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','S�b','Dom'],
		    monthNames: ['Janeiro','Fevereiro','Mar�o','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
		    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
		    nextText: 'Pr�ximo',
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

