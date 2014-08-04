<%@ include file="../../../header.jsp"%>
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> --> 
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script> 
<body>
	<form action="<c:url value='/fornecedores/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Cadastro de Fornecedores</a></li>
				<li><a href="#tabs-2">Endereço</a></li>
				<li><a href="#tabs-3">Telefone</a></li>
				<li><a href="#tabs-4">Outros</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<fieldset id="formulario" style="width: 1140px;"> 
				<legend>
					Dados Pessoais:
				</legend>
				<!--<label>ID:</label> --><input type="hidden" name="fornecedor.id" value="${fornecedor.id}" readonly />
					<table><tr><td align="right" width="95"> 
						<label>Nome Fantasia:</label></td> 
						<td align="left"><input	class="maiuscula" type="text" name="fornecedor.nome" size=50 value="${fornecedor.nome}" /><br></td>
						<td align="right" width="80"><label>CPF/CNPJ:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="fornecedor.cpfcnpj" size=28 value="${fornecedor.cpfcnpj}" /></td>
						</tr></table><br> 
						<table><tr><td align="right" width="95"> <label>Razão Social:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="fornecedor.razaosocial" size=50 value="${fornecedor.razaosocial}" /> <br></td>
						<td align="right" width="80"><label>Insc. Est.:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="fornecedor.ie" size=28 value="${fornecedor.ie}" /><br> </td>
						</tr></table><br>
						<!-- <table><tr>
						<td align="right" width="95"><label>Insc. Est.:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="fornecedor.ie" size=28 value="${fornecedor.ie}" /><br> </td>
						<td align="right" width="85"><label>Insc. Mun.:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="fornecedor.im" size=28 value="${fornecedor.im}" /><br> </td></tr></table><br>  -->
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
				<fieldset id="endereco-container" style="width: 1140px;">
				<legend>
					Endereço:	
				</legend>
				<table>
		     		<tr>
		     		<td align="right" width="95">
		     		<label>Endereço:</label>
		     		</td>
					<td align="left">
					<input class="maiuscula" type="text" name="fornecedor.logradouro" size=96 value="${endereco.logradouro}" />
					</td>
					<td align="right">
					<label>Número:</label>
					</td>
					<td align="left">
					<input class="maiuscula" type="text" name="fornecedor.numero" size=10 value="${endereco.numero}" />
					<br>
					</td>
					</tr>
					</table>
					<br>
					<table>
					<tr>
					<td align="right" width="95">
					<label>Complemento:</label>
					</td>
					<td align="left">
					<input class="maiuscula" type="text" name="fornecedor.complemento" size=50 value="${endereco.complemento}" />
					<br>
					</td>
					<td align="right" width="85">
					<label>Bairro:</label>
					</td>
					<td align="left">
					<input class="maiuscula" type="text" name="fornecedor.bairro" size=29 value="${endereco.bairro}" />
					<br>
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
					<input class="maiuscula" type="text" name="fornecedor.cidade" size=50 value="${endereco.cidade}" />
					<br>
					</td>
					<td align="right" width="85">
					<label>UF:</label>
					</td>
					<td align="left"> 
					<select name="fornecedor.uf">
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
					<input class="maiuscula" type="text" name="fornecedor.cep" size=12 value="${endereco.cep}" />
					<br>
					</td>
					</tr>
					</table>
					<br>
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
				<fieldset id="telefone-container" style="width: 1140px;">
				<legend>
					Telefones:	
				</legend>
				<table align="right"><tr><td>
					<input type="button" name="button" value="Adicionar" onclick="adicionar();" icon="ui-icon-contact"/></td></tr>
				</table>
				<c:forEach items="${fornecedor.telefones}" var="telefone" varStatus="status">
					<div class="telefonefornecedor">
						<label>Tipo:</label>&nbsp
						<select id="telefone" name="fornecedor.telefones[${status.index}].tipo">
						<option value="${telefone.tipo}">${telefone.tipo}</option>
						<option value="COMERCIAL" class="comercial">&nbsp&nbsp&nbsp&nbspCOMERCIAL</option>
						<option value="RESIDENCIAL" class="tel">&nbsp&nbsp&nbsp&nbspRESIDENCIAL</option>
						<option value="CELULAR" class="cel">&nbsp&nbsp&nbsp&nbspCELULAR</option>
						</select>&nbsp&nbsp
						<label>Numero:</label>&nbsp
						<input type="text" name="fornecedor.telefones[${status.index}].numero" value="${telefone.numero}" />&nbsp&nbsp
						<label>Contato:</label>&nbsp
						<input type="text" name="fornecedor.telefones[${status.index}].contato" value="${telefone.contato}" />&nbsp&nbsp
						<input type="hidden" name="fornecedor.telefones[${status.index}].id" value="${telefone.id}" />
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
			
			<div id="tabs-4">
				<br>
				<fieldset id="cobranca-container" style="width: 1140px;">
				<legend>
					Informações:	
				</legend>
				<table><tr><td align="right" width="95"> <label>E-mail:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="fornecedor.email" size=50 value="${fornecedor.email}" /> <br></td>
						<td align="right" width="95"><label>Contato:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="fornecedor.contato" size=50 value="${fornecedor.contato}" /><br> </td>
						</tr></table>
				</fieldset>
	
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

var model =
	'<div class="telefonefornecedor">' +
		'<label>Tipo:</label>&nbsp' +
		'<select id="telefone" name="fornecedor.telefones[0].tipo">' +
		'<option value="${telefone.tipo}">${telefone.tipo}</option>'+
		'<option value="COMERCIAL" class="comercial">&nbsp&nbsp&nbsp&nbspCOMERCIAL</option>' +
		'<option value="RESIDENCIAL" class="tel">&nbsp&nbsp&nbsp&nbspRESIDENCIAL</option>' +
		'<option value="CELULAR" class="cel">&nbsp&nbsp&nbsp&nbspCELULAR</option>' +
		'</select>&nbsp&nbsp' +
		'<label>Numero:</label>&nbsp' +
		'<input type="text" name="fornecedor.telefones[0].numero" value="${telefone.numero}" />&nbsp&nbsp' +
		'<label>Contato:</label>&nbsp' +
		'<input type="text" class="maiuscula" name="fornecedor.telefones[0].contato" value="${telefone.contato}" />&nbsp&nbsp' +
		'<input type="hidden" name="fornecedor.telefones[0].id" value="${telefone.id}" />' +
		'<input type="button" class="button-remover" />' +
	'</div>';

	$('.button-remover').live('click', function() {
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

function teste(){
	(".telefonefornecedor").each(alert(index));
}

function reorderIndexes() {
	var regex = /\[[0-9]\]/g;
	
	$('.telefonefornecedor').each(function(index) {
		
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
