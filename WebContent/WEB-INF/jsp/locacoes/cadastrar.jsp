<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> -->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.maskMoney.js"></script>

<body onload="getcliente(${locacao.id});">
	<form action="<c:url value='/locacoes/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Cadastro de Locações</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<fieldset id="nome_cliente" style="width: 1140px;">
				<legend>
					Dados da Locação:
				</legend>
				<table><tr>
					<td align="right" width="95"><label>Número da Locação:</label></td>
					<td align="left"><input	type="text" name="locacao.id" value="${locacao.id}" readonly /><br></td>
					<td align="right" width="95"><label>Cliente:</label></td>
					
					<td align="left">
						<select id="cliente"  name="locacao.cliente.id" value="locacao.cliente.id">
							<option value="${locacao.cliente.id}">${locacao.cliente.nome}</option>
						</select>
					
					<!-- <input	type="text" class="maiuscula" name="locacao.cliente.nome" size=50 value="${locacao.cliente}" /> -->
					 
					
					<br></td>
					
					<td align="right" width="80"><label>Frete:</label></td>
					<td align="left"><input	type="text" class="dinheiro" name="locacao.frete" value="${locacao.frete}" /><br></td>
				</tr></table> 
				</fieldset>
				<br/>
				<fieldset id="endereco_cliente" style="width: 1140px;">
				<legend>
					Endereço:
				</legend>
				<table align="right"><tr><td>
					<input type="button" name="button" value="Adicionar" onclick="adicionarend();" icon="ui-icon-contact"/></td></tr>
				</table>
				<c:forEach items="${locacao.enderecos}" var="endereco" varStatus="status">
		     		<div class="endintem">
		     		<table>
		     		<tr>
		     		<td align="right" width="95">
		     		<label>Endereço:</label>
		     		</td>
					<td align="left">
					<input class="maiuscula" type="text" name="locacao.enderecos[${status.index}].logradouro" size=96 value="${endereco.logradouro}" />
					</td>
					<td align="right">
					<label>Número:</label>
					</td>
					<td align="left">
					<input class="maiuscula" type="text" name="locacao.enderecos[${status.index}].numero" size=10 value="${endereco.numero}" />
					<br>
					</td>
					</tr>
					</table>
					<br>
					<table>
					<tr>
					<td align="right">
					<label>Complemento:</label>
					</td>
					<td align="left">
					<input class="maiuscula" type="text" name="locacao.enderecos[${status.index}].complemento" size=50 value="${endereco.complemento}" />
					<br>
					</td>
					<td align="right" width="85">
					<label>Bairro:</label>
					</td>
					<td align="left">
					<input class="maiuscula" type="text" name="locacao.enderecos[${status.index}].bairro" size=29 value="${endereco.bairro}" />
					<br>
					</td>
					<td align="right" width="35">
					<label>Tipo:</label>
					</td>
					<td align="left"> 
					<select name="locacao.enderecos[${status.index}].tipoendereco">
							<option value="${endereco.tipoendereco}">${endereco.tipoendereco}</option>
							<option value="ENTREGA">ENTREGA</option>
							<option value="COBRANÇA">COBRANÇA</option>
							<option value="ENTREGA/COBRANÇA">ENTREGA/COBRANÇA</option>
					</select>
					</td>
					</tr>
					</table>
					<br>
					<table>
					<tr>
					<td align="right" width="95">
					<label>Cidade:</label>
					</td>
					<td align="left">
					<input class="maiuscula" type="text" name="locacao.enderecos[${status.index}].cidade" size=50 value="${endereco.cidade}" />
					<br>
					</td>
					<td align="right" width="85">
					<label>UF:</label>
					</td>
					<td align="left"> 
					<select name="locacao.enderecos[${status.index}].uf">
							<option value="${endereco.uf}">${endereco.uf}</option>
							<option value="AC">ACRE</option>
							<option value="AL">ALAGOAS</option>
							<option value="AP">AMAPÁ</option>
							<option value="AM">AMAZONAS</option>
							<option value="BA">BAHIA</option>
							<option value="CE">CEARÁ</option>
							<option value="DF">DISTRITO FEDERAL</option>
							<option value="ES">ESPIRITO SANTO</option>
							<option value="GO">GOIÁS</option>
							<option value="MA">MARANHÃO</option>
							<option value="MS">MATO GROSSO DO SUL</option>
							<option value="MT">MATO GROSSO</option>
							<option value="MG">MINAS GERAIS</option>
							<option value="PA">PARÁ</option>
							<option value="PB">PARAÍBA</option>
							<option value="PR">PARANÁ</option>
							<option value="PE">PERNAMBUCO</option>
							<option value="PI">PIAUÍ</option>
							<option value="RJ">RIO DE JANEIRO</option>
							<option value="RN">RIO GRANDE DO NORTE</option>
							<option value="RS">RIO GRANDE DO SUL</option>
							<option value="RO">RONDÔNIA</option>
							<option value="RR">RORAIMA</option>
							<option value="SC">SANTA CATARINA</option>
							<option value="SP">SÃO PAULO</option>
							<option value="SE">SERGIPE</option>
							<option value="TO">TOCANTINS</option>
					</select>
					<br>
					</td>
					<td align="right" width="67">
					<label>CEP:</label>
					</td>
					<td align="left">
					<input class="maiuscula" type="text" name="locacao.enderecos[${status.index}].cep" size=12 value="${endereco.cep}" />
					<br>
					</td>
					</tr>
					</table>
					<br>
					<table>
					<tr>
					<td align="right" width="95">
					<label>Contato:</label>
					</td>
					<td align="left">
					<input class="maiuscula" type="text" name="locacao.enderecos[${status.index}].contato" size=50 value="${endereco.contato}" />
					<br>
					</td>
					</tr>
					</table>
					</div>
					<br>
				</c:forEach>
				</fieldset>
				<br/>
				<fieldset id="formulario" style="width: 1140px;">
					<legend> Datas da Locação: </legend>
					
					<table>
						<tr>
							<td align="right" width="95"><label>Data da Locação:</label></td>
							<td align="left"><input type="text" class="data" name="locacao.dtlocacao" value="<fmt:formatDate value="${locacao.dtlocacao}" dateStyle="medium" />" /><br></td>
							<td align="right" width="80"><label>Data Inicio:</label></td>
							<td align="left"><input type="text" class="data"
								name="locacao.dtinicio" value="<fmt:formatDate value="${locacao.dtinicio}" dateStyle="medium" />" /></td>
							<br>
							<td align="right" width="80"><label>Data Fim:</label></td>
							<td align="left"><input type="text" class="data"
								name="locacao.dtfim" value="<fmt:formatDate value="${locacao.dtfim}" dateStyle="medium" />" /></td>
						</tr>
					</table>
				</fieldset>
				<fieldset id="locacaodetalhe" style="width: 1140px;">
				<legend>
					Itens Locação:	
				</legend>
				<table align="right"><tr><td>
					<input type="button" name="button" value="Adicionar" onclick="adicionar();" icon="ui-icon-contact"/></td></tr>
				</table>
				<c:forEach items="${locacao.locacaodetalhe}" var="locacaodetalhe" varStatus="status">
		   	        <div class="produtointem">
		    	    <label>Produto:</label>&nbsp
		    		<select id="produto" onchange="getpreco(value, name);" name="locacao.locacaodetalhe[${status.index}].produto.id" value="locacaodetalhe.produto.id">
		    			<option value="${locacaodetalhe.produto.id}">${locacaodetalhe.produto.nome}</option>
		    		</select>&nbsp&nbsp
		    		<label>R$:</label>&nbsp
		    		<select id="preco" name="locacao.locacaodetalhe[${status.index}].preco" value="locacaodetalhe.preco">
		    			<option value="${locacaodetalhe.preco}">${locacaodetalhe.preco}</option>
		    		</select>&nbsp&nbsp
		    		<label>Quantidade:</label>&nbsp
		    		<input type="text" name="locacao.locacaodetalhe[${status.index}].quantidade" value="${locacaodetalhe.quantidade}" />&nbsp&nbsp
		    		<input type="hidden" name="locacao.locacaodetalhe[${status.index}].id" value="${locacaodetalhe.id}" />
					<input type="button" class="button-remover" />
		    		</div>
				</c:forEach>
				</fieldset>
				<br>
				<fieldset id="observacao" style="width: 1140px;">
				<legend>
					Observação:	
				</legend>
						<table><tr><td width="95"></td> 
						<td align="right"><textarea style="resize:none; text-transform: uppercase;" rows="10" cols="123" name="locacao.obs" >${locacao.obs}</textarea><br> </td></tr></table>
				</fieldset>
				<br>
				<fieldset id="nome_cliente" style="width: 1140px;">
				<legend>
					Valores da Locação:
				</legend>
				<table><tr>
					<td align="right" width="95"><label>Valor (R$):</label></td>
					<td align="left"><input	type="text" class="dinheiro" name="locacao.valortotal" value="${locacao.valortotal}"/><br></td>
					<td align="right" width="95"><label>Desconto (%):</label></td>
					<td align="left"><input	type="text" name="locacao.descontopercent" value="${locacao.descontopercent}" /><br></td>
					<td align="right" width="95"><label>Desconto (R$):</label></td>
					<td align="left"><input	type="text" class="dinheiro" name="locacao.descontovalor" value="${locacao.descontovalor}" /><br></td>
					<!-- <td align="right" width="95"><label>Total (R$):</label></td>
					<td align="left"><input	type="text" class="dinheiro" name="locacao.valortotal" value="${locacao.valortotal}" /><br></td> -->
				</tr></table>
				</fieldset><br>
				<fieldset id="pagamentos" style="width: 1140px;">
				<legend>Pagamentos:</legend>
				<table align="right"><tr><td>
					<input type="button" name="button" value="Adicionar" onclick="adicionarpagamento();" icon="ui-icon-contact"/></td></tr>
				</table>
					<c:forEach items="${locacao.pagamentos}" var="pagamento" varStatus="status">
			    		<div class="pagamentos">
			    		<label>Valor R$:</label>
			    		<input type="text" name="locacao.pagamentos[${status.index}].valor" value="${pagamento.valor}" />
			    		<label>Dt. Venciento:</label>
			    		<input type="text" name="locacao.pagamentos[${status.index}].dtvencimento" value="<fmt:formatDate value="${pagamento.dtvencimento}" dateStyle="medium" />" />
			    		<input type="hidden" name="locacao.pagamentos[${status.index}].id" value="${pagamento.id}" />
			    		<input type="button" class="button-remover" />
			    		</div>
			    	</c:forEach>
				</fieldset>
				<table align="center">
					<tr><td>
					<input type="submit" value="Salvar" class="salvar" icon="ui-icon-disk"/><br/>	
					</td>
					<td>
					<!-- <input type="submit" value="Imprimir" class="imprimir" icon="ui-icon-print"/><br/>  -->
					<a href="<c:url value="/locacoes/report/${locacao.id}"/>" onclick="verificaid(${locacao.id})" name="imprimir"><span>Imprimir</span></a>	
					</td></tr>
				</table>
			</div>
		</div>
	</form>
</body>
<%@ include file="../../../footer.jsp"%>
 <script type="text/javascript">
     
     	var endmodel = 
     		'<div class="endintem">'+
     		'<table>' +
     		'<tr>' +
     		'<td align="right" width="95">' +
     		'<label>Endereço:</label>' + 
     		'</td>' +
			'<td align="left">' +
			'<input class="maiuscula" type="text" name="locacao.enderecos[0].logradouro" size=96 value="${locacao.enderecos[0].logradouro}" />' +
			'</td>' +
			'<td align="right">' +
			'<label>Número:</label>' +
			'</td>' + 
			'<td align="left">' +
			'<input class="maiuscula" type="text" name="locacao.enderecos[0].numero" size=10 value="${locacao.enderecos[0].numero}" />' +
			'<br>' +
			'</td>' +
			'</tr>' +
			'</table>' +
			'<br>' + 
			'<table>' +
			'<tr>' +
			'<td align="right">' +
			'<label>Complemento:</label>' +
			'</td>' + 
			'<td align="left">' +
			'<input class="maiuscula" type="text" name="locacao.enderecos[0].complemento" size=50 value="${locacao.enderecos[0].complemento}" />' +
			'<br>' +
			'</td>' +
			'<td align="right" width="85">' +
			'<label>Bairro:</label>' +
			'</td>' +
			'<td align="left">' +
			'<input class="maiuscula" type="text" name="locacao.enderecos[0].bairro" size=29 value="${locacao.enderecos[0].bairro}" />' +
			'<br>' +
			'</td>' +
			'<td align="right" width="35">' +
			'<label>Tipo:</label>' +
			'</td>' + 
			'<td align="left">' + 
			'<select name="locacao.enderecos[0].tipoendereco">' +
					'<option value="${locacao.enderecos[0].tipoendereco}">${locacao.enderecos[0].tipoendereco}</option>' +
					'<option value="ENTREGA">ENTREGA</option>' +
					'<option value="COBRANÇA">COBRANÇA</option>' +
					'<option value="ENTREGA/COBRANÇA">ENTREGA/COBRANÇA</option>' +
			'</select>' +
			'</td>' +
			'</tr>' +
			'</table>' +
			'<br>' +
			'<table>' +
			'<tr>' +
			'<td align="right" width="95">' +
			'<label>Cidade:</label>' +
			'</td>' + 
			'<td align="left">' +
			'<input class="maiuscula" type="text" name="locacao.enderecos[0].cidade" size=50 value="${locacao.enderecos[0].cidade}" />' +
			'<br>' +
			'</td>' +
			'<td align="right" width="85">' +
			'<label>UF:</label>' +
			'</td>' + 
			'<td align="left">' + 
			'<select name="locacao.enderecos[0].uf">' +
					'<option value="${locacao.enderecos[0].uf}">${locacao.enderecos[0].uf}</option>' +
					'<option value="AC">ACRE</option>' +
					'<option value="AL">ALAGOAS</option>' +
					'<option value="AP">AMAPÁ</option>' +
					'<option value="AM">AMAZONAS</option>' +
					'<option value="BA">BAHIA</option>' +
					'<option value="CE">CEARÁ</option>' +
					'<option value="DF">DISTRITO FEDERAL</option>' +
					'<option value="ES">ESPIRITO SANTO</option>' +
					'<option value="GO">GOIÁS</option>' +
					'<option value="MA">MARANHÃO</option>' +
					'<option value="MS">MATO GROSSO DO SUL</option>' +
					'<option value="MT">MATO GROSSO</option>' +
					'<option value="MG">MINAS GERAIS</option>' +
					'<option value="PA">PARÁ</option>' +
					'<option value="PB">PARAÍBA</option>' +
					'<option value="PR">PARANÁ</option>' +
					'<option value="PE">PERNAMBUCO</option>' +
					'<option value="PI">PIAUÍ</option>' +
					'<option value="RJ">RIO DE JANEIRO</option>' +
					'<option value="RN">RIO GRANDE DO NORTE</option>' +
					'<option value="RS">RIO GRANDE DO SUL</option>' +
					'<option value="RO">RONDÔNIA</option>' +
					'<option value="RR">RORAIMA</option>' +
					'<option value="SC">SANTA CATARINA</option>' +
					'<option value="SP">SÃO PAULO</option>' +
					'<option value="SE">SERGIPE</option>' +
					'<option value="TO">TOCANTINS</option>' +
			'</select>' +
			'<br>' +
			'</td>' +
			'<td align="right" width="67">' +
			'<label>CEP:</label>' +
			'</td>' + 
			'<td align="left">' +
			'<input class="maiuscula" type="text" name="locacao.enderecos[0].cep" size=12 value="${locacao.enderecos[0].cep}" />' +
			'<br>' +
			'</td>' +
			'</tr>' +
			'</table>' +
			'<br>' +
			'<table>' +
			'<tr>' +
			'<td align="right" width="95">' +
			'<label>Contato:</label>' +
			'</td>' + 
			'<td align="left">' +
			'<input class="maiuscula" type="text" name="locacao.enderecos[0].contato" size=50 value="${locacao.enderecos[0].contato}" />' +
			'<br>' +
			'</td>' +
			'</tr>' +
			'</table>' +
			'</div>' +
			'<br>';
 
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
    		
    	var pagamentomodel= 
    		'<div class="pagamentos">'+
    		'<label>Valor R$:</label>'+
    		'<input type="text" class="dinheiro" name="locacao.pagamentos[0].valor" value="${locacao.pagamentos[0].valor}" />&nbsp'+
    		'<label>Data de Venciento:</label>'+
    		'<input type="text" class="data" name="locacao.pagamentos[0].dtvencimento" value="<fmt:formatDate value="${locacao.pagamentos[0].dtvencimento}" dateStyle="medium" />" /> &nbsp&nbsp' +
    		'<input type="hidden" name="locacao.pagamentos[0].id" value="${locacao.pagamentos[0].id}" />'+
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
    		
			function adicionarend() {
    			
    			$('#endereco_cliente').append(endmodel);

    			reorderIndexesend();
    			
    		};
    		
    		function adicionarpagamento(){
    			
    			$('#pagamentos').append(pagamentomodel);
    			
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
    			
    			$(document).ready(function(){
                    $("input.dinheiro").maskMoney({showSymbol:false, symbol:"R$", decimal:".", thousands:"."});
              	});

    			reorderIndexespagamentos();    			
    		}
    		
    		
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
    		
    		function getcliente(id){
    			if(id == null){
    		    $.ajax({  
    		        url: '/sisloc/locacoes/getclientes',  
    		        type : 'get',  
    		        dataType: 'json',  
    		        success : function(clientes) {
    		            
    		            	$('.container').each(function(index) {

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
    	    							$input.append('<option value="'+clientes[i].id+'">'+clientes[i].nome+'</option>');
    	    						}
    	    					}
	    	    			});
    		            		
    		            	});    
    		        }  
    		    });
    			}
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
    		
    		function reorderIndexesend() {
    			var regex = /\[[0-9]\]/g;
    			
    			$('.endintem').each(function(index) {
    				
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

    		function reorderIndexespagamento() {
    			var regex = /\[[0-9]\]/g;
    			
    			$('.pagamentos').each(function(index) {
    				
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
.button-remover-end {
  background-image: url('${pageContext.request.contextPath}/images/btn_remover.png');
  cursor:pointer;
  border: none;
  width: 34px;
  height: 33px;
}
</style>

