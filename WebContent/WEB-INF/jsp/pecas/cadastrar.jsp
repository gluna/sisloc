<%@ include file="../../../header.jsp"%>
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script> 
<!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script> --> 
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script> 
<body>
	<form action="<c:url value='/pecas/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Pe�as de Reposi��o</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<fieldset id="formulario" style="width: 1140px;"> 
				<legend>
					Informa��es:
				</legend>
				<!--<label>ID:</label> --><input type="hidden" name="peca.id" value="${peca.id}" readonly />
					<table><tr><td align="right" width="95"> 
						<label>Nome:</label></td> 
						<td align="left"><input	class="maiuscula" type="text" name="peca.descricao" size=50 value="${peca.descricao}" /><br></td>
						</tr></table><br> 
						<!-- <table><tr><td align="right" width="95"> <label>Valor R$:</label></td>
						<td align="left"> <input class="maiuscula" type="text" name="peca.valor" size=28 value="${peca.valor}" /><br> </td> 
						<td align="right" width="95"><label>Quantidade:</label></td> 
						<td align="left"> <input class="maiuscula" type="text" name="peca.quantidade" size=28 value="${peca.quantidade}" /><br> </td>
						</tr></table><br> -->
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
