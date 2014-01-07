<%@ include file="../../../header.jsp"%>
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> --> 
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.maskMoney.js"></script>
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
				<!--<label>ID:</label> --><input type="hidden" name="cheque.id" value="${cheque.id}" readonly />
					<table><tr><td align="right" width="95"> 
						<label>Nome:</label></td> 
						<td align="left"><input	class="maiuscula" type="text" name="cheque.nome" size=50 value="${cheque.nome}" /><br></td>
						<td align="right" width="80"><label>CPF/CNPJ:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cheque.cpfcnpj" size=28 value="${cheque.cpfcnpj}" /></td>
						<td align="right" width="50"><label>Data:</label></td> 
						<td align="left"><input	type="text" class="data" name="cheque.data" value="<fmt:formatDate value="${cheque.data}" dateStyle="medium" />" /><br></td>
						</tr></table><br>
						<table><tr>
						<td align="right" width="95"><label>Banco:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cheque.banco" size=23 value="${cheque.banco}" /><br> </td>
						<td align="right" width="60"><label>Agência:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cheque.agencia" size=5 value="${cheque.agencia}" /><br> </td>
						<td align="right" width="50"><label>Conta:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cheque.conta" size=10 value="${cheque.conta}" /><br> </td>
						<td align="right" width="75"><label>Nº Cheque:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="cheque.numero" size=19 value="${cheque.numero}" /><br> </td>
						<td align="right" width="50"><label>Valor:</label></td> 
						<td align="left"> <input class="dinheiro" type="text" name="cheque.valor" size=19 value="${cheque.valor}" /><br> </td>
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
		$(".data").datepicker({
		    dateFormat: 'dd/mm/yyy',
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

</style>
