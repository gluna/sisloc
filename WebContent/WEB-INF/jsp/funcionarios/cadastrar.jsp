<%@ include file="../../../header.jsp"%>
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> --> 
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script> 
<body>
	<form action="<c:url value='/funcionarios/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Cadastro da Funcionários</a></li>
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
				<!--<label>ID:</label> --><input type="hidden" name="funcionario.id" value="${funcionario.id}" readonly />
					<table><tr><td align="right" width="95"> 
						<label>Nome:</label></td> 
						<td align="left"><input	class="maiuscula" type="text" name="funcionario.nome" size=50 value="${funcionario.nome}" /><br></td>
						<td align="right" width="80"><label>CPF:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="funcionario.cpf" size=28 value="${funcionario.cpf}" /></td>
						<td align="right" width="80"><label>RG:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="funcionario.rg" size=28 value="${funcionario.rg}" /></td>
						</tr></table><br> 
						<table><tr><td align="right" width="95"> <label>Pai:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="funcionario.pai" size=50 value="${funcionario.pai}" /> <br></td>
						<td align="right" width="40"><label>Mãe:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="funcionario.mae" size=50 value="${funcionario.mae}" /><br> </td>
						<td align="right" width="30"><label>CNH:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="funcionario.cnh" size=19 value="${funcionario.cnh}" /><br> </td>
						</tr></table><br>
						<table><tr>
						<td align="right" width="95"><label>CTPS:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="funcionario.ctps" size=28 value="${funcionario.ctps}" /><br> </td>
						<td align="right" width="85"><label>Admissão:</label></td> 
						<td align="left"><input type="text" class="data" name="funcionario.dtadmissao" value="<fmt:formatDate value="${funcionario.dtadmissao}" dateStyle="medium" />" /><br></td>
						<td align="right" width="85"><label>Demissão:</label></td> 
						<td align="left"><input type="text" class="data" name="funcionario.dtdemissao" value="<fmt:formatDate value="${funcionario.dtdemissao}" dateStyle="medium" />" /><br></td>
						</tr></table>
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
					<input class="maiuscula" type="text" name="funcionario.logradouro" size=96 value="${funcionario.logradouro}" />
					</td>
					<td align="right">
					<label>Número:</label>
					</td>
					<td align="left">
					<input class="maiuscula" type="text" name="funcionario.numero" size=10 value="${funcionario.numero}" />
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
					<input class="maiuscula" type="text" name="funcionario.complemento" size=50 value="${funcionario.complemento}" />
					<br>
					</td>
					<td align="right" width="85">
					<label>Bairro:</label>
					</td>
					<td align="left">
					<input class="maiuscula" type="text" name="funcionario.bairro" size=29 value="${funcionario.bairro}" />
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
					<input class="maiuscula" type="text" name="funcionario.cidade" size=50 value="${funcionario.cidade}" />
					<br>
					</td>
					<td align="right" width="85">
					<label>UF:</label>
					</td>
					<td align="left"> 
					<select name="funcionario.uf">
							<option value="${funcionario.uf}">${funcionario.uf}</option>
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
					<input class="maiuscula" type="text" name="funcionario.cep" size=12 value="${funcionario.cep}" />
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
				<c:forEach items="${funcionario.telefones}" var="telefone" varStatus="status">
					<div class="telefonefuncionario">
						<label>Tipo:</label>&nbsp
						<select id="telefone" name="funcionario.telefones[${status.index}].tipo">
						<option value="${telefone.tipo}">${telefone.tipo}</option>
						<option value="COMERCIAL" class="comercial">&nbsp&nbsp&nbsp&nbspCOMERCIAL</option>
						<option value="RESIDENCIAL" class="tel">&nbsp&nbsp&nbsp&nbspRESIDENCIAL</option>
						<option value="CELULAR" class="cel">&nbsp&nbsp&nbsp&nbspCELULAR</option>
						</select>&nbsp&nbsp
						<label>Numero:</label>&nbsp
						<input type="text" name="funcionario.telefones[${status.index}].numero" value="${telefone.numero}" />&nbsp&nbsp
						<label>Contato:</label>&nbsp
						<input type="text" name="funcionario.telefones[${status.index}].contato" value="${telefone.contato}" />&nbsp&nbsp
						<input type="hidden" name="funcionario.telefones[${status.index}].id" value="${telefone.id}" />
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
						<td align="left"><input class="maiuscula" type="text" name="funcionario.email" size=50 value="${funcionario.email}" /> <br></td>
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
	'<div class="telefonefuncionario">' +
		'<label>Tipo:</label>&nbsp' +
		'<select id="telefone" name="funcionario.telefones[0].tipo">' +
		'<option value="${telefone.tipo}">${telefone.tipo}</option>'+
		'<option value="COMERCIAL" class="comercial">&nbsp&nbsp&nbsp&nbspCOMERCIAL</option>' +
		'<option value="RESIDENCIAL" class="tel">&nbsp&nbsp&nbsp&nbspRESIDENCIAL</option>' +
		'<option value="CELULAR" class="cel">&nbsp&nbsp&nbsp&nbspCELULAR</option>' +
		'</select>&nbsp&nbsp' +
		'<label>Numero:</label>&nbsp' +
		'<input type="text" name="funcionario.telefones[0].numero" value="${telefone.numero}" />&nbsp&nbsp' +
		'<label>Contato:</label>&nbsp' +
		'<input type="text" class="maiuscula" name="funcionario.telefones[0].contato" value="${telefone.contato}" />&nbsp&nbsp' +
		'<input type="hidden" name="funcionario.telefones[0].id" value="${telefone.id}" />' +
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
	(".telefonefuncionario").each(alert(index));
}

function reorderIndexes() {
	var regex = /\[[0-9]\]/g;
	
	$('.telefonefuncionario').each(function(index) {
		
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
