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
				<fieldset id="nome_cliente" style="width: 1140px;">
				<legend>
					Dados da Locação:
				</legend>
				<table><tr>
					<td align="right" width="95"><label>Número da Locação:</label></td>
					<td align="left"><input	type="text" name="locacao.id" value="${locacao.id}" readonly /><br></td>
					<td align="right" width="95"><label>Nome do Cliente:</label></td>
					<td align="left"><input	type="text" class="maiuscula" name="locacao.nome" size=50 value="${locacao.nome}" /><br></td>
				</tr></table> 
				</fieldset>
				<br/>
				<fieldset id="endereco_cliente" style="width: 1140px;">
				<legend>
					Endereço da Locação:
				</legend>
				<table align="right"><tr><td>
					<input type="button" value="Endereço" id="criar" icon="ui-icon-contact"/></td></tr>
				</table>
				</fieldset>
				<br/>
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
				<br>
				<fieldset id="nome_cliente" style="width: 1140px;">
				<legend>
					Valores da Locação:
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
	<div id="dialog-form" title="Adicionar Endereço">
		<form>
		<fieldset>
		<table><tr><td align="right" width="95"><label>Endereço:</label> </td>
						<td align="left"><input class="maiuscula" type="text" name="locacao.logradouro" size=96 value="${locacao.logradouro}" /> </td>
						<td align="right"><label>Número:</label></td> 
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
						<br> </td>
						<td align="right" width="67"><label>CEP:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="locacao.cep" size=12 value="${locacao.cep}" /><br> </td>
						</tr></table><br>
						<table><tr><td align="right" width="95"><label>Tipo:</label> </td>
						<td align="left">
						<select name="locacao.tipoendereco">
								<option value="${locacao.tipoendereco}">${locacao.tipoendereco}</option>
								<option value="ENTREGA">ENTREGA</option>
								<option value="COBRANCA">COBRANCA</option>
						</select></td>
						<td align="right"><label>Número:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cliente.numero" size=10 value="${cliente.numero}" /><br> </td></tr></table><br> 
		</fieldset>
		</form>
	</div>
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
		 $( "#criar" )
		 .click(function() {
		 $( "#dialog-form" ).dialog( "open" );
		 });
		 
		 $( "#dialog-form" ).dialog({
			 autoOpen: false,
			 height: 340,
			 width: 950,
			 modal: true,
			 buttons: {
			 "Adicionar": function() {
			 var bValid = true;
			 allFields.removeClass( "ui-state-error" );
			 bValid = bValid && checkLength( name, "username", 3, 16 );
			 bValid = bValid && checkLength( email, "email", 6, 80 );
			 bValid = bValid && checkLength( password, "password", 5, 16 );
			 bValid = bValid && checkRegexp( name, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter." );
			 // From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
			 bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
			 bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
			 if ( bValid ) {
			 $( "#users tbody" ).append( "<tr>" +
			 "<td>" + name.val() + "</td>" +
			 "<td>" + email.val() + "</td>" +
			 "<td>" + password.val() + "</td>" +
			 "</tr>" );
			 $( this ).dialog( "close" );
			 }
			 },
			 Cancel: function() {
			 $( this ).dialog( "close" );
			 }
			 },
			 close: function() {
			 allFields.val( "" ).removeClass( "ui-state-error" );
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
</style>

