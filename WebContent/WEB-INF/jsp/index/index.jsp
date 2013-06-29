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
				<br>
				<table><tr><td>
				<div class="column">
 
				  <div class="portlet">
				    <div class="portlet-header">Contas a Pagar</div>
				    <div class="portlet-content">R$ 2.000,00</div>
				  </div>
				 
				  <div class="portlet">
				    <div class="portlet-header">Contas a Receber</div>
				    <div class="portlet-content">R$ 1.500,00</div>
				  </div>
				 
				</div>
			</div>
			<div class="column">
 
			  <div class="portlet">
			    <div class="portlet-header">Pendencias</div>
			    <div class="portlet-content">Entregar o sistema</div>
			  </div>
			 
			</div>
			</td></tr></table>
</div>	
</body>
<%@ include file="../../../footer.jsp" %> 
<script>
	$(function() {
		$( "#tabs" ).tabs();
		$( ".column" ).sortable({
		      connectWith: ".column"
		    });
		 
		    $( ".portlet" ).addClass( "ui-widget ui-widget-content ui-helper-clearfix ui-corner-all" )
		      .find( ".portlet-header" )
		        .addClass( "ui-widget-header ui-corner-all" )
		        .prepend( "<span class='ui-icon ui-icon-minusthick'></span>")
		        .end()
		      .find( ".portlet-content" );
		 
		    $( ".portlet-header .ui-icon" ).click(function() {
		      $( this ).toggleClass( "ui-icon-minusthick" ).toggleClass( "ui-icon-plusthick" );
		      $( this ).parents( ".portlet:first" ).find( ".portlet-content" ).toggle();
		    });
		 
		    $( ".column" ).disableSelection();
	});
	
</script>