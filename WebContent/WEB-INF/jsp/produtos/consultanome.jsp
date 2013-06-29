<%@ include file="../../../header.jsp"%>
 <!-- <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>  -->
<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
 <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js"></script>
 <body>
<form action="<c:url value='/produtos/consultanome'/>" method="post">
	<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Consultar Produtos</a></li>
			</ul>
			<div id="tabs-1">
				<br><br>
				<fieldset id="formulario" style="width: 1140px;"> 
				<legend>
					Dados da Consulta:
				</legend>
					<table><tr><td align="right" width="95"> 
						<label>Nome:</label></td> 
						<td align="left"><input	class="maiuscula" type="text" name="produto.nome" size=50 value="${produto.nome}" /><br></td>
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
					<tbody>
					<c:forEach items="${produtoList}" var="produto">
						<tr>
						  <td>${produto.nome}</td>
						  <td><a href="<c:url value="/produtos/editar/${produto.id}" />" name="editar">Editar</a></td>
						  <!-- <td><a href="<c:url value="/produtos/excluir/${tarefa.id}"/>">Excluir</a></td> -->
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
<style>
	div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
    div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: center; }
</style>