<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> --> 
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script> 
<body>
	<form action="<c:url value='/equipamentos/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Equipamentos</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<fieldset id="formulario" style="width: 1140px;"> 
				<legend>
					Informações:
				</legend>
				<!--<label>ID:</label> --><input type="hidden" name="equipamento.id" value="${equipamento.id}" readonly />
					<table><tr><td align="right" width="95"> 
						<label>Núm. Série:</label></td> 
						<td align="left"><input	class="maiuscula" type="text" name="equipamento.numserie" size=28 value="${equipamento.numserie}" /><br></td>
						<td align="right" width="95"><label>Patrimônio:</label></td> 
						<td align="left"><input	class="maiuscula" type="text" name="equipamento.patrimonio" size=28 value="${equipamento.patrimonio}" /><br></td>
						<td align="right" width="95"><label>Categoria:</label></td>
						<td align="left">
						<select id="tipoequipamento" name="equipamento.tipoequipamento.id" value="equipamento.tipoequipamento.id">
							<c:forEach items="${tipoEquipamentoList}" var="tipoequipamento" varStatus="status">
								<option value="${tipoequipamento.id}">${tipoequipamento.descricao}</option>
							</c:forEach>
						</select></td>
						<!-- <td align="right" width="95"><label>Tipo:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="equipamento.tipo" size=28 value="${equipamento.tipo}" /><br> </td> -->
						</tr></table><br> 
						<table><tr><td align="right" width="95"> <label>Nota Fiscal:</label></td>
						<td align="left"> <input class="maiuscula" type="text" name="equipamento.notafiscal" size=28 value="${equipamento.notafiscal}" /><br> </td> 
						<td align="right" width="95"><label>Fornecedor:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="equipamento.fornrcedor" size=50 value="${equipamento.fornrcedor}" /><br> </td>
						</tr></table><br>
						<table><tr><td align="right" width="95"> <label>Marca:</label></td>
						<td align="left"> <input class="maiuscula" type="text" name="equipamento.marca" size=28 value="${equipamento.marca}" /><br> </td> 
						<td align="right" width="95"><label>Valor R$:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="equipamento.valorcompra" size=15 value="${equipamento.valorcompra}" /><br> </td>
						</tr></table><br>
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
</style>
