<%@ include file="../../../header.jsp"%>
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> --> 
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script> 
<body>
	<form action="<c:url value='/cheque/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Cadastro de Cheque</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<fieldset id="formulario" style="width: 1140px;"> 
				<legend>
					Dados do Cheque:
				</legend>
				<!--<label>ID:</label> --><input type="hidden" name="cliente.id" value="${cliente.id}" readonly />
					<table><tr><td align="right" width="95"> 
						<label>Nome/Empresa:</label></td> 
						<td align="left"><input	class="maiuscula" type="text" name="cliente.nome" size=50 value="${cliente.nome}" /><br></td>
						<td align="right" width="80"><label>CPF/CNPJ:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cliente.cpfcnpj" size=28 value="${cliente.cpfcnpj}" /></td></tr></table><br>
						<table><tr><td align="right" width="95"><label>Endere�o:</label> </td>
						<td align="left"><input class="maiuscula" type="text" name="cliente.logradouro" size=96 value="${cliente.logradouro}" /> </td>
						<td align="right"><label>N�mero:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cliente.numero" size=10 value="${cliente.numero}" /><br> </td></tr></table><br> 
						<table><tr><td align="right"> <label>Complemento:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cliente.complemento" size=50 value="${cliente.complemento}" /> <br></td>
						<td align="right" width="85"><label>Bairro:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cliente.bairro" size=29 value="${cliente.bairro}" /><br> </td>
						</tr></table><br>
						<table><tr><td align="right" width="95"> <label>Cidade:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cliente.cidade" size=50 value="${cliente.cidade}" /> <br></td>
						<td align="right" width="85"><label>UF:</label></td> 
						<td align="left"> 
						<select name="cliente.uf">
								<option value="${cliente.uf}">${cliente.uf}</option>
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
						<td align="left"> <input class="maiuscula" type="text" name="cliente.cep" size=13 value="${cliente.cep}" /><br> </td>
						</tr></table><br>
						<table><tr><td align="right" width="95"> <label>E-mail:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cliente.email" size=50 value="${cliente.email}" /> <br></td>
						<td align="right" width="85"><label>Contato:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cliente.contato" size=28 value="${cliente.contato}" /><br> </td>
						<td align="right" width="50"><label>Rep:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cliente.rep" size=28 value="${cliente.rep}" /><br> </td>
						</tr></table>
				</fieldset>
				<br/>
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
		</div>	
	</form>

</body>
<%@ include file="../../../footer.jsp"%>

<script type="text/javascript">
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

$('.salvar').live('click', function() {
	alert("Dados salvos com sucesso!!");
});

function adicionar() {
	
	$('#telefone-container').append(model);
	
	reorderIndexes();
	
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