<%@ include file="../../../header.jsp" %>
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> --> 
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script> 
<body>
<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Inicio</a></li>
			</ul>
			<div id="tabs-1">
				<br><br>
			</div>
</div>	
</body>
<%@ include file="../../../footer.jsp" %> 
<script>
	$(function() {
		$( "#tabs" ).tabs();
	});
	
</script>