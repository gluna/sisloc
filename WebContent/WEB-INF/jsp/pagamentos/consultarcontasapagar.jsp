<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>  -->
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
 <body>
<form action="<c:url value='/pagamentos/consultarcontasapagar'/>" method="post">
	<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Consultar Contas a Pagar</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<fieldset id="formulario" style="width: 1140px;"> 
				<legend>
					Dados da Consulta:
				</legend>
					<table><tr><td align="right" width="95"> 
						<label>Data Inicial:</label></td> 
						<td align="left"><input type="text" class="data" size=10 name="inicio" value="<fmt:formatDate value="${inicio}" dateStyle="medium" />" /><br></td>
						<td align="right" width="95"> 
						<label>Data Final:</label></td> 
						<td align="left"><input type="text" class="data" size=10 name="fim" value="<fmt:formatDate value="${fim}" dateStyle="medium" />" /><br></td>
						<td><input type="submit" value="Consultar" icon="ui-icon-search"/><br/></td>
						</tr></table><br>
				</fieldset>
				<br/>
				<fieldset id="telefone-container" style="width: 1140px;">
				<legend>
					Dados Localizados:	
				</legend>
				<div id="users-contain" class="ui-widget">
					<table id="users" class="ui-widget ui-widget-content">
					<thead>
						<tr class="ui-widget-header">
							<th>ID</th>
							<th>Descrição</th>
							<th>Data de Vencimento</th>
							<th colspan="2">Ação</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${pagamentoList}" var="pagamento">
						<tr>
						  <td>${pagamento.id}</td>
						  <td>${pagamento.descricao}</td>
						  <td><fmt:formatDate value="${pagamento.dtvencimento}" dateStyle="medium" /></td>
						  <!-- <td><fmt:formatDate value="${pagamento.dtpagamento}" dateStyle="medium" /></td> -->
						  <td><a href="<c:url value="/pagamentos/editarcontasapagar/${pagamento.id}" />" name="editar">Editar</a></td>
						  <td><a href="<c:url value="/pagamentos/excluir/${pagamento.id}"/>" name="excluir">Excluir</a></td>
						</tr>
					</c:forEach>
					</tbody></table></div>
				</fieldset><br/>
	
				<br>
			</div>
		</div>
	
</form>
</body>	
<%@ include file="../../../footer.jsp"%>
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
		$('a[name="excluir"]').each(function () {
			   $(this).button({icons: {primary: "ui-icon-close-thick"}});
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
		$(".data").datepicker({
		    dateFormat: 'dd/mm/yyyy',
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
<style>
	div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: center; }
</style>