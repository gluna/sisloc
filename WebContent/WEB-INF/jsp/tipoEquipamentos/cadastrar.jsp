<%@ include file="../../../header.jsp"%>
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> --> 
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
 
 <body>
	<form action="<c:url value='/tipo/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Tipo de Equipamento</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<fieldset id="tipo-equipamento" style="width: 1140px;"> 
				<legend>
					Informações:
				</legend>
				<!--<label>ID:</label> --><input type="hidden" name="tipo.id" value="${tipo.id}" readonly />
					<table><tr><td align="right" width="95"> 
						<label>Nome:</label></td> 
						<td align="left"><input	class="maiuscula" type="text" name="tipo.descricao" size=50 value="${tipo.descricao}" /><br></td>
						<td align="right" width="80"><label>Valor Dia R$:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="tipo.valordia" size=28 value="${tipo.valordia}" /></td>
						<td align="right" width="80"><label>Valor Semanal R$:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="tipo.valorsemana" size=28 value="${tipo.valorsemana}" /></td>
						</tr></table><br> 
						<table><tr><td align="right"> <label>Nome do Pai:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cliente.pai" size=50 value="${cliente.pai}" /> <br></td>
						<td align="right"> <label>Nome da Mãe:</label></td> 
						<td align="left"><input class="maiuscula" type="text" name="cliente.mae" size=50 value="${cliente.mae}" /> <br></td>
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