<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> -->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.maskMoney.js"></script>
<body>
	<form action="<c:url value='/produtos/salvar'/>" method="post">
		 <div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Cadastro de Produtos</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<fieldset id="formulario" style="width: 1140px;"> 
				<legend>
					Produto:
				</legend>  
				<!--<label>ID:</label> --><input type="hidden" name="produto.id" value="${produto.id}" readonly />
					<table><tr><td align="right" width="95"> 
						<label>C�digo:</label></td> 
						<td align="left"><input	class="maiuscula" type="text" name="produto.codigo" size=29 value="${produto.codigo}" readonly/><br></td>
						<td align="right" width="80"><label>Nome:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="produto.nome" size=50 value="${produto.nome}" readonly/></td>
						<td align="right" width="95"><label>Quantidade:</label> </td>
						<td align="left"><input class="maiuscula" type="text" name="produto.quantidade" size=10 value="${produto.quantidade}" readonly/> </td></tr></table><br>
						<table><tr><td align="right" width="95"> 
						<td align="right" width="80"><label>Dev. R$:</label></td> 
						<td align="left"><input class="dinheiro" type="text" name="produto.valor" size=15 value="${produto.valor}" readonly/></td>
						<td align="right" width="80"><label>Status:</label></td>
						<td align="left"><input class="maiuscula" type="text" name="produto.status" id="status" size=2 value="${produto.status}" readonly/></td>
						</tr></table><br>
						<table><tr>
						<td align="right" width="95"><label>Descri��o:</label></td></tr></table>
						<table><tr><td width="95"></td> 
						<td align="right"><textarea style="resize:none; text-transform: uppercase; background-color: #FFFFE0;" rows="10" cols="123" name="produto.descricao" readonly/>${produto.descricao}</textarea><br> </td></tr></table><br>
						<table><tr><td align="right" width="95"><label>Obs:</label></td></tr></table>
						<table><tr><td width="95"></td> 
						<td align="right"><textarea style="resize:none; text-transform: uppercase; background-color: #FFFFE0;" rows="10" cols="123" name="produto.obs" readonly/>${produto.obs}</textarea><br> </td></tr></table><br> 
						 
				</fieldset>
				<br/>
				<fieldset id="preco-container" style="width: 1140px;">
				<legend>
					Pre�os:	
				</legend>
				<!--<table align="right"><tr><td>
					 <input type="button" value="Adicionar" onclick="adicionar();" icon="ui-icon-tag"/></td></tr> 
				</table>-->
				<c:forEach items="${produto.precos}" var="preco" varStatus="status">
					<div class="precos">
						<label>Dias:</label>&nbsp
						<input type="text" class="dias" name="produto.precos[${status.index}].dias" value="${preco.dias}" readonly/>&nbsp&nbsp
						<label>Valor R$:</label>&nbsp
						<input type="text" class="dinheiro" name="produto.precos[${status.index}].preco" value="${preco.preco}" readonly/>&nbsp&nbsp
						<input type="hidden" name="produto.precos[${status.index}].id" value="${preco.id}" />
						<!-- <input type="button" class="button-remover" />  -->
					</div>
				</c:forEach>
				</fieldset><br/>
	
				<br>
				<table align="center">
					<tr><td>
					<a href="<c:url value="/produtos/editar/${produto.id}" />" name="editar">Editar</a>
					<!-- <input type="submit" value="Salvar" class="salvar" icon="ui-icon-disk"/><br />	 --></td></tr>
				</table>
			</div>
		</div>	
	</form>

</body>
<%@ include file="../../../footer.jsp"%>

<script type="text/javascript">
var model =
	'<div class="precos">' +
		'<label>Dias:</label>&nbsp' +
		'<input type="text" name="produto.precos[0].dias" value="${preco.dias}" />&nbsp&nbsp' +
		'<label>Valor R$:</label>&nbsp' +
		'<input type="text" class="dinheiro" name="produto.precos[0].preco" value="${preco.preco}" />&nbsp&nbsp' +
		'<input type="hidden" name="produto.precos[0].id" value="${preco.id}" />'+
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
	$('#preco-container').append(model);
	$("input.dinheiro").maskMoney({showSymbol:false, symbol:"R$", decimal:",", thousands:"."});
	reorderIndexes();
};

function reorderIndexes() {
	var regex = /\[[0-9]\]/g;
	
	$('.precos').each(function(index) {
		
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
input.dinheiro {
  background-color: #FFFFE0;
}
input.dias {
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
