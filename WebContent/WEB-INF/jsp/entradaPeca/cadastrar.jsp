<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> --> 
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script> 
<body>
	<form action="<c:url value='/manutencao/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Entrada de Peças</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<fieldset id="formulario" style="width: 1140px;"> 
				<legend>
					Informações:
				</legend>
				<!--<label>ID:</label> --><input type="hidden" name="entradapeca.id" value="${entradapeca.id}" readonly />
					<table><tr><td align="right" width="95"> 
						<label>Nota:</label></td> 
						<td align="left"><input	class="maiuscula" type="text" name="entradapeca.nota" size=28 value="${entradapeca.nota}" /><br></td>
						<td align="right" width="90"><label>Data:</label></td> 
						<td align="left"><input type="text" class="data" name="entradapeca.dtEntrada" value="<fmt:formatDate value="${entradapeca.dtEntrada}" dateStyle="medium" />" /><br></td>
						<td align="right" width="95"><label>Fornecedor:</label></td> 
						<td align="left">
						<select id="tipofornecedor" name="entradapeca.fornecedor.id" value="entradapeca.fornecedor.id">
							<c:forEach items="${fornecedorList}" var="tipofornecedor" varStatus="status">
								<option value="${tipofornecedor.id}">${tipofornecedor.nome}</option>
							</c:forEach>
						</select></td>
						</tr></table><br>
				</fieldset><br>
				
				<br>
				<fieldset id="peca-container" style="width: 1140px;">
				<legend>
					Peças:	
				</legend>
				<table align="right"><tr><td>
					<input type="button" name="button" value="Adicionar" onclick="adicionar();" icon="ui-icon-contact"/></td></tr>
				</table>
				<c:forEach items="${manutencao.pecas}" var="pecas" varStatus="status">
					<div class="manutencaoequipamento">
						<label>Tipo:</label>&nbsp
						<select id="peca" name="manutencao.pecas[${status.index}].peca.id" value="pecas.peca.id">
							<option value="${pecas.peca.id}">${pecas.peca.descricao}</option>
						</select>&nbsp&nbsp
						<label>Quantidade:</label>&nbsp
						<input type="text" name="manutencao.pecas[${status.index}].peca.quantidade" value="${pecas.peca.quantidade}" />&nbsp&nbsp
						<input type="hidden" name="manutencao.pecas[${status.index}].id" value="${pecas.id}" />
						<input type="button" class="button-remover"/>
					</div>
				</c:forEach>
				</fieldset>
				<br><br>
				<fieldset id="valores" style="width: 1140px;"> 
				<legend>
					Valores:
				</legend>
					<table><tr>
						<td align="right" width="95"><label>Custo R$:</label></td> 
						<td align="left"><input	class="leitura" type="text" name="manutencao.custo" size=15 value="${manutencao.custo}" readonly/><br></td>
						</tr></table><br> 
				</fieldset><br>
				
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

var model =
	'<div class="manutencaoequipamento">'+
		'<label>Tipo:</label>&nbsp'+
		'<select id="peca" name="manutencao.pecas[0].peca.id" value="pecas.peca.id">'+
		'  <c:forEach items="${pecaList}" var="peca" varStatus="status">'+
			'<option value="${peca.id}">${peca.descricao}</option>'+
		'	</c:forEach>'+
		'</select>&nbsp&nbsp'+
		'<label>Quantidade:</label>&nbsp'+
		'<input type="text" name="manutencao.pecas[0].peca.quantidade" value="${pecas.peca.quantidade}" />&nbsp&nbsp'+
		'<input type="hidden" name="manutencao.pecas[0].id" value="${pecas.id}" />'+
		'<input type="button" class="button-remover"/>'+
	'</div>';

	$('.button-remover').live('click', function() {
		$(this).parent().remove();
		reorderIndexes();
	});

$('.salvar').live('click', function() {
	alert("Dados salvos com sucesso!!");
});

function adicionar() {
	
	$('#peca-container').append(model);
	
	reorderIndexes();
	
};

function reorderIndexes() {
	var regex = /\[[0-9]\]/g;
	
	$('.manutencaoequipamento').each(function(index) {
		
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

function getpatrimonio(){
	
	var patrimonio = document.getElementById('equipamento').value;
	
    $.ajax({  
        url: '/sisloc/manutencao/getequipamento/',
        data: {p:patrimonio},
        type : 'get',
        dataType: 'json',  
        success : function(equipamentos) {
            
        	document.getElementById('descricao').value = equipamentos;
        }  
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
		$('input[name="buscar"]').each(function () {
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

input.leitura {
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
</style>
