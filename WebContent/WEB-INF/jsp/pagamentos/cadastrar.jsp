<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> -->
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${pageContext.request.contextPath}/js/jquery.maskMoney.js"></script>

<body>
	<form action="<c:url value='/pagamentos/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Registro de Pagamentos</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<fieldset id="nome_cliente" style="width: 1140px;">
					<legend> Dados da Locação: </legend>
					<table>
						<tr>
							<td align="right" width="95"><label>Número da Locação:</label></td>
							<td align="left"><input type="text" name="locacao.id" value="${locacao.id}" readonly /><br></td>
							<td align="right" width="95"><label>Nome do Cliente:</label></td>
							<td align="left"><input	type="text" class="maiuscula" name="locacao.cliente.nome" size=50 value="${locacao.cliente.nome}" readonly/> 
							<br></td>
							<c:forEach items="${locacao.pagamentos}" var="pagamento" varStatus="status">
								<input type="hidden" name="locacao.pagamentos[${status.index}].id" value="${pagamento.id}" readonly />
								<label>Valor:</label><input type="text" name="locacao.pagamentos[${status.index}].valor" value="${pagamento.valor}" readonly /><br>
								<label>Dt Vencimento:</label><input type="text" name="locacao.pagamentos[${status.index}].dtvencimento" value="<fmt:formatDate value="${pagamento.dtvencimento}" dateStyle="medium" />" readonly /><br>
								<label>Dt Vencimento:</label><input type="text" name="locacao.pagamentos[${status.index}].dtpagamento" value="<fmt:formatDate value="${pagamento.dtpagamento}" dateStyle="medium" />" /><br>
								<select id="formapagamento" name="locacao.pagamentos[${status.index}].forma">
									<option value="${pagamento.forma}">${pagamento.forma}</option>
									<option value="DINHEIRO" class="dinheiro">DINHEIRO</option>
									<option value="CHEQUE" class="cheque">CHEQUE</option>
									<option value="CARTAO" class="cartao">CARTÃO</option>
								</select>
							</c:forEach>
						</tr>
						<input type="submit" value="Salvar" class="salvar" icon="ui-icon-disk"/><br/>	
					</table>
				</fieldset>
			</div>
		</div>
	</form>
</body>