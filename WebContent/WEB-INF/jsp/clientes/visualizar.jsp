<%@ include file="../../../header.jsp"%>
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> --> 
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script> 
<body>
	<form action="<c:url value='/clientes/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Visualiza��o de Cliente</a></li>
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
						<td align="left"><input	class="maiuscula" type="text" name="cliente.nome" size=50 value="${cliente.nome}" readonly /><br></td>
						<td align="right" width="80"><label>CPF/CNPJ:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cliente.cpfcnpj" size=28 value="${cliente.cpfcnpj}" readonly /></td></tr></table><br>					
						<table><tr><td align="right" width="95"><label>Endere�o:</label> </td>
						<td align="left"><input class="maiuscula" type="text" name="cliente.logradouro" size=96 value="${cliente.logradouro}" readonly /> </td>
						<td align="right"><label>N�mero:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cliente.numero" size=10 value="${cliente.numero}" readonly /><br> </td></tr></table><br> 
						<table><tr><td align="right"> <label>Complemento:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cliente.complemento" size=50 value="${cliente.complemento}" readonly /> <br></td>
						<td align="right" width="85"><label>Bairro:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cliente.bairro" size=29 value="${cliente.bairro}" readonly /><br> </td>
						</tr></table><br>
						<table><tr><td align="right" width="95"> <label>Cidade:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cliente.cidade" size=50 value="${cliente.cidade}" readonly /> <br></td>
						<td align="right" width="85"><label>UF:</label></td>
						<td align="left"><input class="maiuscula" type="text" name="cliente.uf" size=25 value="${cliente.uf}" readonly /> <br></td>
						<td align="right" width="67"><label>CEP:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cliente.cep" size=13 value="${cliente.cep}" readonly /><br> </td>
						</tr></table><br>
						<table><tr><td align="right" width="95"> <label>E-mail:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cliente.email" size=50 value="${cliente.email}" readonly /> <br></td>
						<td align="right" width="85"><label>Insc. Est.:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cliente.ie" size=28 value="${cliente.ie}" readonly/><br> </td>
						<td align="right" width="85"><label>Insc. Mun.:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cliente.im" size=28 value="${cliente.im}" readonly/><br> </td></tr></table><br>
						<table><tr>
						<td align="right" width="95"><label>Contato:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cliente.contato" size=50 value="${cliente.contato}" readonly /><br> </td>
						<td align="right" width="85"><label>Rep:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cliente.rep" size=28 value="${cliente.rep}" readonly /><br> </td>
						</tr></table>
				</fieldset>
				<br/>
				<fieldset id="telefone-container" style="width: 1140px;">
				<legend>
					Telefones:	
				</legend>
				<table align="right"><tr><td>
					<!-- <input type="button" value="Adicionar" onclick="adicionar();" icon="ui-icon-contact"/> --></td></tr>
				</table>
				<c:forEach items="${cliente.telefones}" var="telefone" varStatus="status">
					<div class="telefonecliente">
						<label>Tipo:</label>&nbsp
						<input type="text" class="maiuscula" name="cliente.telefones[${status.index}].tipo" value="${telefone.tipo}" readonly />&nbsp&nbsp
						<label>Numero:</label>&nbsp
						<input type="text" class="maiuscula" name="cliente.telefones[${status.index}].numero" value="${telefone.numero}" readonly />&nbsp&nbsp
						<label>Contato:</label>&nbsp
						<input type="text" class="maiuscula" name="cliente.telefones[${status.index}].contato" value="${telefone.contato}" readonly />&nbsp&nbsp
						<input type="hidden" name="cliente.telefones[${status.index}].id" value="${telefone.id}" />
						<!-- <input type="button" class="button-remover1"/>  -->
					</div>
				</c:forEach>
				</fieldset>
	
				<br>
				<table align="center">
					<tr><td>
					<a href="<c:url value="/clientes/editar/${cliente.id}" />" name="editar">Editar</a>
					<!-- <input type="submit" value="Salvar" class="salvar" icon="ui-icon-disk"/> --><br/>	
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
		'<input type="text" name="cliente.telefones[0].contato" value="${telefone.contato}" />&nbsp&nbsp' +
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
		$('a[name="editar"]').each(function () {
			   $(this).button({icons: {primary: "ui-icon-pencil"}});
			   $(this).click();
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
	});
	
</script>
<style type="text/css">
input.maiuscula {
  text-transform: uppercase;
  background-color: #FFFFE0;
}

.button-remover {
  background-image: url('${pageContext.request.contextPath}/images/btn_remover.png');
  cursor:pointer;
  border: none;
  width: 34px;
  height: 33px;
}

.button-remover1 {
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
