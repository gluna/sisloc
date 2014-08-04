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
				<table><tr>
					<td width="440"></td><td><img src="${pageContext.request.contextPath}/images/inicio.png" height="180" width="250">	
				</td></tr></table>
			</div>
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