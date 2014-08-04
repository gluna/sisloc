<%@ include file="../../../header.jsp"%>
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> --> 
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script> 
<body>
	<form action="<c:url value='/clientes/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Cadastro de Cliente</a></li>
				<li><a href="#tabs-2">Telefone</a></li>
				<li><a href="#tabs-3">Cobrança</a></li>
				<li><a href="#tabs-4">Informações Adicionais</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<fieldset id="formulario" style="width: 1140px;"> 
				<legend>
					Dados Pessoais:
				</legend>
				<!--<label>ID:</label> --><input type="hidden" name="cliente.id" value="${cliente.id}" readonly />
					<table><tr><td align="right" width="95"> 
						<label>Nome/Empresa:</label></td> 
						<td align="left"><input	class="maiuscula" type="text" name="cliente.nome" size=50 value="${cliente.nome}" /><br></td>
						<td align="right" width="80"><label>CPF/CNPJ:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cliente.cpfcnpj" size=28 value="${cliente.cpfcnpj}" /></td>
						<td align="right" width="80"><label>RG:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cliente.rg" size=28 value="${cliente.rg}" /></td>
						</tr></table><br> 
						<table><tr><td align="right" width="95"> <label>Nome do Pai:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cliente.pai" size=50 value="${cliente.pai}" /> <br></td>
						<td align="right"> <label>Nome da Mãe:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cliente.mae" size=50 value="${cliente.mae}" /> <br></td>
						</tr></table><br>
						<table><tr>
						<td align="right" width="95"><label>Insc. Est.:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cliente.ie" size=28 value="${cliente.ie}" /><br> </td>
						<td align="right" width="85"><label>Insc. Mun.:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cliente.im" size=28 value="${cliente.im}" /><br> </td></tr></table><br>
				</fieldset>
				<br/>	
				<br>
				<table align="center">
					<tr><td>
					<input type="submit" value="Salvar" class="salvar" icon="ui-icon-disk"/><br/>	
					</td></tr>
				</table>
			</div>
			
			<div id="tabs-2">
				<br>
				<fieldset id="telefone-container" style="width: 1140px;">
				<legend>
					Telefones:	
				</legend>
				<table align="right"><tr><td>
					<input type="button" name="button" value="Adicionar" onclick="adicionar();" icon="ui-icon-contact"/></td></tr>
				</table>
				<c:forEach items="${cliente.telefones}" var="telefone" varStatus="status">
					<div class="telefonecliente">
						<label>Tipo:</label>&nbsp
						<select id="telefone" name="cliente.telefones[${status.index}].tipo">
						<option value="${telefone.tipo}">${telefone.tipo}</option>
						<option value="COMERCIAL" class="comercial">&nbsp&nbsp&nbsp&nbspCOMERCIAL</option>
						<option value="RESIDENCIAL" class="tel">&nbsp&nbsp&nbsp&nbspRESIDENCIAL</option>
						<option value="CELULAR" class="cel">&nbsp&nbsp&nbsp&nbspCELULAR</option>
						</select>&nbsp&nbsp
						<label>Numero:</label>&nbsp
						<input type="text" name="cliente.telefones[${status.index}].numero" value="${telefone.numero}" />&nbsp&nbsp
						<label>Contato:</label>&nbsp
						<input type="text" name="cliente.telefones[${status.index}].contato" value="${telefone.contato}" />&nbsp&nbsp
						<input type="hidden" name="cliente.telefones[${status.index}].id" value="${telefone.id}" />
						<input type="button" class="button-remover"/>
					</div>
				</c:forEach>
				</fieldset>
	
				<br>
				<table align="center">
					<tr><td>
					<input type="submit" value="Salvar" class="salvar" icon="ui-icon-disk"/><br/>	
					</td></tr>
				</table>
			</div>
			
			<div id="tabs-3">
				<br>
				<fieldset id="cobranca-container" style="width: 1140px;">
				<legend>
					Dados da Cobrança:	
				</legend>
				<table><tr><td align="right" width="95"> <label>E-mail:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cliente.email" size=50 value="${cliente.email}" /> <br></td>
						<td align="right" width="95"><label>Contato:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cliente.contato" size=50 value="${cliente.contato}" /><br> </td>
						</tr></table>
				</fieldset>
				
				<fieldset id="endereco-cliente" style="width: 1140px;">
				<legend>
					Endereço:
				</legend>
				<table align="right"><tr><td>
					<input type="button" name="button" value="Adicionar" onclick="adicionarend();" icon="ui-icon-contact"/></td></tr>
				</table>
				<c:forEach items="${cliente.enderecos}" var="endereco" varStatus="status">
		     		<div class="endintem">
		     		<table>
		     		<tr>
		     		<td align="right" width="95">
		     		<label>Endereço:</label>
		     		</td>
					<td align="left">
					<input class="maiuscula" type="text" name="cliente.enderecos[${status.index}].logradouro" size=96 value="${endereco.logradouro}" />
					</td>
					<td align="right">
					<label>Número:</label>
					</td>
					<td align="left">
					<input class="maiuscula" type="text" name="cliente.enderecos[${status.index}].numero" size=10 value="${endereco.numero}" />
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
					<input class="maiuscula" type="text" name="cliente.enderecos[${status.index}].complemento" size=50 value="${endereco.complemento}" />
					<br>
					</td>
					<td align="right" width="85">
					<label>Bairro:</label>
					</td>
					<td align="left">
					<input class="maiuscula" type="text" name="cliente.enderecos[${status.index}].bairro" size=29 value="${endereco.bairro}" />
					<br>
					</td>
					<td align="right" width="35">
					<label>Tipo:</label>
					</td>
					<td align="left"> 
					<select name="cliente.enderecos[${status.index}].tipoendereco">
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
					<input class="maiuscula" type="text" name="cliente.enderecos[${status.index}].cidade" size=50 value="${endereco.cidade}" />
					<br>
					</td>
					<td align="right" width="85">
					<label>UF:</label>
					</td>
					<td align="left"> 
					<select name="cliente.enderecos[${status.index}].uf">
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
					<input class="maiuscula" type="text" name="cliente.enderecos[${status.index}].cep" size=12 value="${endereco.cep}" />
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
					<input class="maiuscula" type="text" name="cliente.enderecos[${status.index}].contato" size=50 value="${endereco.contato}" />
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
	
				<br>
				<table align="center">
					<tr><td>
					<input type="submit" value="Salvar" class="salvar" icon="ui-icon-disk"/><br/>	
					</td></tr>
				</table>
			</div>
			
			<div id="tabs-4">
				<br>
				<fieldset id="observacao" style="width: 1140px;">
				<legend>
					Observação:	
				</legend>
						<table><tr><td width="95"></td> 
						<td align="right"><textarea style="resize:none; text-transform: uppercase;" rows="10" cols="123" name="cliente.obs" >${cliente.obs}</textarea><br> </td></tr></table>
				</fieldset>
				<br>
				<fieldset id="aviso" style="width: 1140px;">
				<legend>
					Aviso:	
				</legend>
						<table><tr><td width="95"></td> 
						<td align="right"><textarea style="resize:none; text-transform: uppercase;" rows="10" cols="123" name="cliente.aviso" >${cliente.aviso}</textarea><br> </td></tr></table>
				</fieldset>
				<br/>	
				<br>
				<table align="center">
					<tr><td>
					<input type="submit" value="Salvar" class="salvar" icon="ui-icon-disk"/><br/>	
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
	'<input class="maiuscula" type="text" name="cliente.enderecos[0].logradouro" size=96 value="${endereco.logradouro}" />' +
	'</td>' +
	'<td align="right">' +
	'<label>Número:</label>' +
	'</td>' + 
	'<td align="left">' +
	'<input class="maiuscula" type="text" name="cliente.enderecos[0].numero" size=10 value="${endereco.numero}" />' +
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
	'<input class="maiuscula" type="text" name="cliente.enderecos[0].complemento" size=50 value="${endereco.complemento}" />' +
	'<br>' +
	'</td>' +
	'<td align="right" width="85">' +
	'<label>Bairro:</label>' +
	'</td>' +
	'<td align="left">' +
	'<input class="maiuscula" type="text" name="cliente.enderecos[0].bairro" size=29 value="${endereco.bairro}" />' +
	'<br>' +
	'</td>' +
	'<td align="right" width="35">' +
	'<label>Tipo:</label>' +
	'</td>' + 
	'<td align="left">' + 
	'<select name="cliente.enderecos[0].tipoendereco">' +
			'<option value="${endereco.tipoendereco}">${endereco.tipoendereco}</option>' +
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
	'<input class="maiuscula" type="text" name="cliente.enderecos[0].cidade" size=50 value="${endereco.cidade}" />' +
	'<br>' +
	'</td>' +
	'<td align="right" width="85">' +
	'<label>UF:</label>' +
	'</td>' + 
	'<td align="left">' + 
	'<select name="cliente.enderecos[0].uf">' +
			'<option value="${endereco.uf}">${endereco.uf}</option>' +
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
	'<input class="maiuscula" type="text" name="cliente.enderecos[0].cep" size=12 value="${endereco.cep}" />' +
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
	'<input class="maiuscula" type="text" name="cliente.enderecos[0].contato" size=50 value="${endereco.contato}" />' +
	'<br>' +
	'</td>' +
	'</tr>' +
	'</table> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp' +
	'<input type="button" class="button-remover-end" />' +
	'</div>' +
	'<br>';

var model =
	'<div class="telefonecliente">' +
		'<label>Tipo:</label>&nbsp' +
		'<select id="telefone" name="cliente.telefones[0].tipo">' +
		'<option value="${telefone.tipo}">${telefone.tipo}</option>'+
		'<option value="COMERCIAL" class="comercial">&nbsp&nbsp&nbsp&nbspCOMERCIAL</option>' +
		'<option value="RESIDENCIAL" class="tel">&nbsp&nbsp&nbsp&nbspRESIDENCIAL</option>' +
		'<option value="CELULAR" class="cel">&nbsp&nbsp&nbsp&nbspCELULAR</option>' +
		'</select>&nbsp&nbsp' +
		'<label>Numero:</label>&nbsp' +
		'<input type="text" name="cliente.telefones[0].numero" value="${telefone.numero}" />&nbsp&nbsp' +
		'<label>Contato:</label>&nbsp' +
		'<input type="text" class="maiuscula" name="cliente.telefones[0].contato" value="${telefone.contato}" />&nbsp&nbsp' +
		'<input type="hidden" name="cliente.telefones[0].id" value="${telefone.id}" />' +
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

$('.salvar').live('click', function() {
	alert("Dados salvos com sucesso!!");
});

function adicionar() {
	
	$('#telefone-container').append(model);
	
	reorderIndexes();
	
};

function adicionarend() {
	
	$('#endereco-cliente').append(endmodel);

	reorderIndexesend();
	
};

function teste(){
	(".telefonecliente").each(alert(index));
}

function reorderIndexes() {
	var regex = /\[[0-9]\]/g;
	
	$('.telefonecliente').each(function(index) {
		
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
		$('input[name="button"]').each(function () {
			   $(this).hide().after('<button>').next().button({
			        icons: { primary: $(this).attr('icon') },
			        label: $(this).val()
			    }).click(function (event) {
			         event.preventDefault();
			         $(this).prev().click();
			    });
			});
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

.button-remover-end {
  background-image: url('${pageContext.request.contextPath}/images/btn_remover.png');
  cursor:pointer;
  border: none;
  width: 34px;
  height: 33px;
}

#telefone .tel{
  background-image: url('${pageContext.request.contextPath}/images/tel.png');
  background-repeat: no-repeat;
}

#telefone .cel{
  background-image: url('${pageContext.request.contextPath}/images/cel.png');
  background-repeat: no-repeat;
}

#telefone .comercial{
  background-image: url('${pageContext.request.contextPath}/images/comercial.png');
  background-repeat: no-repeat;
}
</style>
