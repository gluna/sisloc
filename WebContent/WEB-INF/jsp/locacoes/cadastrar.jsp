<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> -->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.maskMoney.js"></script>

<body onload="getcliente(${locacao.id});">
	<form name="form" action="<c:url value='/locacoes/salvar'/>" method="post">
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
					<td align="left"><input	type="text" class="readonly" name="locacao.id" value="${locacao.id}" readonly /><br></td>
					<td align="right" width="95"><label>Cliente:</label></td>
					
					<td align="left">
						<select id="cliente"  name="locacao.cliente.id" value="locacao.cliente.id">
							<option value="${locacao.cliente.id}">${locacao.cliente.nome}</option>
						</select>
						<!-- <input	type="hidden" class="readonly" name="locacaoclienteid" size=50 value="${locacao.cliente.id}" readonly />
						<input	type="text" class="readonly" name="locacaocliente" size=50 value="${locacao.cliente.nome}" readonly /><br></td>
						<td><input type="button" name="button" id="add-user" value="Procurar" icon="ui-icon-search"/></td>-->
					
					<!-- <input	type="text" class="maiuscula" name="locacao.cliente.nome" size=50 value="${locacao.cliente}" /> -->
					 
					
					<br></td>
					
					<td align="right" width="80"><label>Frete:</label></td>
					<td align="left"><input	type="text" class="dinheiro" name="locacaofrete" value="${locacao.frete}" /><br></td>
				</tr></table> 
				</fieldset>
				<br/>
				<fieldset id="endereco_cliente" style="width: 1140px;">
				<legend>
					Endere�o:
				</legend>
				<table align="right"><tr><td>
					<input type="button" name="button" value="Adicionar" onclick="adicionarend();" icon="ui-icon-contact"/></td></tr>
				</table>
				<c:forEach items="${locacao.enderecos}" var="endereco" varStatus="status">
		     		<div class="endintem">
		     		<table>
		     		<tr>
		     		<td align="right" width="95">
		     		<label>Endere�o:</label>
		     		</td>
					<td align="left">
					<input class="maiuscula" type="text" name="locacao.enderecos[${status.index}].logradouro" size=96 value="${endereco.logradouro}" />
					</td>
					<td align="right">
					<label>N�mero:</label>
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
							<option value="COBRAN�A">COBRAN�A</option>
							<option value="ENTREGA/COBRAN�A">ENTREGA/COBRAN�A</option>
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
					&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					<input type="button" class="button-remover-end" />
					</div>
					<br>
				</c:forEach>
				</fieldset>
				<br/>
				<fieldset id="formulario" style="width: 1140px;">
					<legend> Datas da Loca��o: </legend>
					
					<table>
						<tr>
							<td align="right" width="95"><label>Data da Loca��o:</label></td>
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
					Itens Loca��o:	
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
					Observa��o:	
				</legend>
						<table><tr><td width="95"></td> 
						<td align="right"><textarea style="resize:none; text-transform: uppercase;" rows="10" cols="123" name="locacao.obs" >${locacao.obs}</textarea><br> </td></tr></table>
				</fieldset>
				<br>
				<fieldset id="nome_cliente" style="width: 1140px;">
				<legend>
					Valores da Loca��o:
				</legend>
				<table><tr>
					<td align="right" width="95"><label>Valor (R$):</label></td>
					<td align="left"><input	type="text" class="dinheiro1" name="locacao.valortotal" value="${locacao.valortotal}" readonly/><br></td>
					<td align="right" width="95"><label>Desconto (%):</label></td>
					<td align="left"><input	type="text" name="locacao.descontopercent"  value="${locacao.descontopercent}" /><br></td>
					<td align="right" width="95"><label>Desconto (R$):</label></td>
					<td align="left"><input	type="text" class="dinheiro" name="locacao.descontovalor" value="${locacao.descontovalor}" /><br></td>
					<td align="right" width="80"><label>Total (R$):</label></td>
					<td align="left"><input	type="text" class="dinheiro1" name="valorfinal" value="${locacao.valorfinal}" readonly/><br></td>
				</tr></table>
				</fieldset><br>
				<fieldset id="pagamentos2" style="width: 1140px;">
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
				</fieldset><br>
				<table align="center">
					<tr><td>
					<input type="submit" value="Salvar" class="salvar" icon="ui-icon-disk"/><br/>	
					</td>
					<td>
					<!-- <input type="submit" value="Imprimir" class="imprimir" icon="ui-icon-print"/><br/>  -->
					<a href="<c:url value="/locacoes/report/${locacao.id}"/>" onclick="verificaid(${locacao.id})" name="imprimir"><span>Imprimir</span></a>	
					</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
	
	<div id="dialog-form" class="caixa" title="Adicionar Cliente/Empresa">
		<form name="form1">
			<fieldset>
				<label for="name">Cliente/Empresa:</label>
				<select id="cliente"  name="clienteid" value="locacao.cliente.id">
				</select>
			</fieldset>
		</form>
	</div>
	
</body>
<%@ include file="../../../footer.jsp"%>
 <script type="text/javascript">
     
     	var endmodel = 
     		'<div class="endintem">'+
     		'<table>' +
     		'<tr>' +
     		'<td align="right" width="95">' +
     		'<label>Endere�o:</label>' + 
     		'</td>' +
			'<td align="left">' +
			'<input class="maiuscula" type="text" name="locacao.enderecos[0].logradouro" size=96 value="${endereco.logradouro}" />' +
			'</td>' +
			'<td align="right">' +
			'<label>N�mero:</label>' +
			'</td>' + 
			'<td align="left">' +
			'<input class="maiuscula" type="text" name="locacao.enderecos[0].numero" size=10 value="${endereco.numero}" />' +
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
			'<input class="maiuscula" type="text" name="locacao.enderecos[0].complemento" size=50 value="${endereco.complemento}" />' +
			'<br>' +
			'</td>' +
			'<td align="right" width="85">' +
			'<label>Bairro:</label>' +
			'</td>' +
			'<td align="left">' +
			'<input class="maiuscula" type="text" name="locacao.enderecos[0].bairro" size=29 value="${endereco.bairro}" />' +
			'<br>' +
			'</td>' +
			'<td align="right" width="35">' +
			'<label>Tipo:</label>' +
			'</td>' + 
			'<td align="left">' + 
			'<select name="locacao.enderecos[0].tipoendereco">' +
					'<option value="${endereco.tipoendereco}">${endereco.tipoendereco}</option>' +
					'<option value="ENTREGA">ENTREGA</option>' +
					'<option value="COBRAN�A">COBRAN�A</option>' +
					'<option value="ENTREGA/COBRAN�A">ENTREGA/COBRAN�A</option>' +
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
			'<input class="maiuscula" type="text" name="locacao.enderecos[0].cidade" size=50 value="${endereco.cidade}" />' +
			'<br>' +
			'</td>' +
			'<td align="right" width="85">' +
			'<label>UF:</label>' +
			'</td>' + 
			'<td align="left">' + 
			'<select name="locacao.enderecos[0].uf">' +
					'<option value="${endereco.uf}">${endereco.uf}</option>' +
					'<option value="AC">ACRE</option>' +
					'<option value="AL">ALAGOAS</option>' +
					'<option value="AP">AMAP�</option>' +
					'<option value="AM">AMAZONAS</option>' +
					'<option value="BA">BAHIA</option>' +
					'<option value="CE">CEAR�</option>' +
					'<option value="DF">DISTRITO FEDERAL</option>' +
					'<option value="ES">ESPIRITO SANTO</option>' +
					'<option value="GO">GOI�S</option>' +
					'<option value="MA">MARANH�O</option>' +
					'<option value="MS">MATO GROSSO DO SUL</option>' +
					'<option value="MT">MATO GROSSO</option>' +
					'<option value="MG">MINAS GERAIS</option>' +
					'<option value="PA">PAR�</option>' +
					'<option value="PB">PARA�BA</option>' +
					'<option value="PR">PARAN�</option>' +
					'<option value="PE">PERNAMBUCO</option>' +
					'<option value="PI">PIAU�</option>' +
					'<option value="RJ">RIO DE JANEIRO</option>' +
					'<option value="RN">RIO GRANDE DO NORTE</option>' +
					'<option value="RS">RIO GRANDE DO SUL</option>' +
					'<option value="RO">ROND�NIA</option>' +
					'<option value="RR">RORAIMA</option>' +
					'<option value="SC">SANTA CATARINA</option>' +
					'<option value="SP">S�O PAULO</option>' +
					'<option value="SE">SERGIPE</option>' +
					'<option value="TO">TOCANTINS</option>' +
			'</select>' +
			'<br>' +
			'</td>' +
			'<td align="right" width="67">' +
			'<label>CEP:</label>' +
			'</td>' + 
			'<td align="left">' +
			'<input class="maiuscula" type="text" name="locacao.enderecos[0].cep" size=12 value="${endereco.cep}" />' +
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
			'<input class="maiuscula" type="text" name="locacao.enderecos[0].contato" size=50 value="${endereco.contato}" />' +
			'<br>' +
			'</td>' +
			'</tr>' +
			'</table> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp' +
			'<input type="button" class="button-remover-end" />' +
			'</div>' +
			'<br>';
 
 		var model =
    	    '<div class="produtointem">'+
    	    '<label>Produto:</label>&nbsp' +
    		'<select id="produto" onchange="getpreco(value, name);" name="locacao.locacaodetalhe[0].produto.id" value="${locacaodetalhe.produto.id}">'+
    		'	<option value="">Selecione um Item</option>'+
    		'	<c:forEach items="${produtoList}" var="produto" varStatus="status">'+
    		'		<option value="${produto.id}">${produto.nome}</option>'+
    		'	</c:forEach>'+
    		'</select>&nbsp&nbsp'+
    		'<label>R$:</label>&nbsp' +
    		'<select id="preco" class="precoitem" onchange="soma();" name="locacao.locacaodetalhe[0].preco" value="${locacaodetalhe.preco}">'+
    		'</select>&nbsp&nbsp'+
    		'<label>Quantidade:</label>&nbsp' +
    		'<input type="text" class="qtde" name="locacao.locacaodetalhe[0].quantidade" onchange="calculaqtd();" value="${locacaodetalhe.quantidade}" />&nbsp&nbsp'+
    		//'<input type="hidden" name="locacao.locacaodetalhe[${status.index}].id" value="${locacaodetalhe.id}" />'+
			'<input type="button" class="button-remover" />' +
    		'</div>';
    		
    	var pagamentomodel= 
    		'<div class="pagamentos">'+
    		'<label>Valor R$:</label>'+
    		'<input type="text" class="dinheiro" name="locacao.pagamentos[0].valor" value="${pagamento.valor}" />&nbsp'+
    		'<label>Data de Venciento:</label>'+
    		'<input type="text" class="data" name="locacao.pagamentos[0].dtvencimento" value="<fmt:formatDate value="${pagamento.dtvencimento}" dateStyle="medium" />" /> &nbsp&nbsp' +
    		'<input type="hidden" name="locacao.pagamentos[0].id" value="${pagamento.id}" />'+
    		'<input type="button" class="button-remover" />' +
    		'</div>';
    		

    		$('.button-remover').live('click', function() {
    			$(this).parent().remove();
    			reorderIndexes();
    		});
    		
    		$('.button-remover-end').live('click', function() {
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
    			
    			$('#pagamentos2').append(pagamentomodel);
    			
    			$(".data").datepicker({
    			    dateFormat: 'dd/mm/yyyy',
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
    			
    			$(document).ready(function(){
                    $("input.dinheiro").maskMoney({showSymbol:false, symbol:"R$", decimal:".", thousands:"."});
              	});

    			reorderIndexespagamento();    			
    		}
    		
    		
    		function getpreco(id, nome){
    			
    			var indice = nome.substring(nome.indexOf('[')+1, nome.indexOf(']'));
    			var r = Math.floor((Math.random()*1000)+1);
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
    	    						$input.append('<option value="">Selecione</option>');
    	    						for (var i = 0; i < precos.length; i++){
    	    							$input.append('<option value="'+precos[i].preco+'">'+precos[i].preco+'&nbsp/&nbsp'+precos[i].dias+'&nbspdia(s)'+'</option>');
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
    		
    		function calculaqtd() {
    			
    			var contaselect = $('.precoitem').length;
    			
    			if (contaselect == 1){
    				$('.precoitem').each(function() {
    					var campovalortotal1 = parseFloat($(this).val(), 10);
    					$('.qtde').each(function(){
	    					var campoqtde = parseFloat($(this).val(), 10);
	    					var calculo = campovalortotal1*campoqtde;
		    				document.form.valortotal.value = calculo;
		    				document.form.valorfinal.value = calculo;
    					});
    				});
    			};
    		}
    		
    		function soma()
    		{
    			var contaselect = $('.precoitem').length;
    			
    			if (contaselect == 1){
    				$('.precoitem').each(function(index, item) {
    					var campovalortotal1 = parseFloat($(this).val(), 10);
	    				document.form.valortotal.value = campovalortotal1;
	    				document.form.valorfinal.value = campovalortotal1;
	    				//alert("O item: " + item + " est� na posi��o: " + index +"");
    				});
    			}
    			
    			if (contaselect > 1){
    				var acumulador = 0;
    				$('.precoitem').each(function(index, item) {
	    				var valorselect = parseFloat($(this).val(), 10);
	    				acumulador = acumulador+valorselect;
	    				document.form.valortotal.value = acumulador;
	    				document.form.valorfinal.value = acumulador;
	    				//alert("O item: " + item + " est� na posi��o: " + index +"");
	    				//var teste = $(this).val(function (index, val) {return index;});
	    				//alert(teste);
    				});
    				
	    		};
    			
    		}
    		
    		function descontavalor() {
    			var valor = parseFloat(document.form.valortotal.value);
    			var desconto = parseFloat(document.form.desc.value);
    			var valorfinal = valor-desconto;
    			document.form.valorfinal.value = valorfinal;
    			
    		}
    		
    		function descontapercentual() {
    			var valor = parseFloat(document.form.valortotal.value);
    			var desconto = parseFloat(document.form.descontopercent.value);
    			var desc = (valor*desconto)/100;
    			var valorfinal = valor-desc;
    			document.form.valorfinal.value = valorfinal;
    		}
    		
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
    				  alert("Salve o Or�amento Primeiro");
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
		    dateFormat: 'dd/mm/yyyy',
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
			 var campo1 = document.form1.clienteid;
			 var valor1 = campo1.value;
			 document.form.locacaocliente.value = valor1;
			 $( this ).dialog( "close" );
		 },
		 	Cancel: function() {
		 		$( this ).dialog( "close" );
		 	}
		 },
		 	close: function() {
		 	}
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
input.dinheiro1 {
  text-transform: uppercase;
  background-color: #FFFFE0;
}
input.maiuscula {
  text-transform: uppercase;
}
input.readonly {
  text-transform: uppercase;
  background-color: #FFFFE0;
}
</style>

