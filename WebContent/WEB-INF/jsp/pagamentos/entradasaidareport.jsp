<%@ include file="../../../header.jsp"%>
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> -->
<script type="text/javascript" charset="utf-8"	src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
<script type="text/javascript" charset="utf-8"	src="${pageContext.request.contextPath}/js/jquery.maskMoney.js"></script>

<body>
	<form action="<c:url value='/pagamentos/report'/>" method="post">
	<label>Dt. Inicio:</label>
	<input type="text" class="data" name="inicio" value="<fmt:formatDate value="${inicio}" dateStyle="medium" />" />
	<br>
	<label>Dt. Fim:</label>
	<input type="text" class="data" name="fim" value="<fmt:formatDate value="${fim}" dateStyle="medium" />" />
	<br>
	<a href="<c:url value="/locacoes/report/${inicio}/${fim} }"/>" name="imprimir"><span>Imprimir</span></a>
	<input type="submit" value="Imprimir" class="imprimir" icon="ui-icon-disk"/><br/>
	</form>
</body>
<%@ include file="../../../footer.jsp"%>
	