<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> -->
<script type="text/javascript" charset="utf-8"	src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" charset="utf-8"	src="${pageContext.request.contextPath}/js/jquery.maskMoney.js"></script>

<body>
	<form action="<c:url value='/locacoes/locacoesperiodo'/>" method="post">
	<label>Dt. Inicio:</label>
	<input type="text" class="data" name="inicio" value="<fmt:formatDate value="${inicio}" dateStyle="medium" />" />
	<br>
	<label>Dt. Fim:</label>
	<input type="text" class="data" name="fim" value="<fmt:formatDate value="${fim}" dateStyle="medium" />" />
	<br>
	<input type="submit" value="Imprimir" class="imprimir" icon="ui-icon-disk"/><br/>
	</form>
</body>
<%@ include file="../../../footer.jsp"%>
	