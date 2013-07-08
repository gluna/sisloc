<%@ include file="../../../header.jsp"%>
<script src="${pageContext.request.contextPath}/js/jquery.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.dataTables.editable.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.jeditable.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery-ui-1.10.3.custom.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jquery.validate.js" type="text/javascript"></script>

<body>
	<form action="<c:url value='/locacoes/salvar'/>" method="post">
		<div id="tabs" class="container">
			<ul>
				<li><a href="#tabs-1">Cadastro de Locações</a></li>
			</ul>
			<div id="tabs-1">
				<br>
				<br>
				<fieldset id="formulario" style="width: 1140px;">
					<legend> Datas da Locação: </legend>
					<!--<label>ID:</label> -->
					<input type="hidden" name="locacao.id" value="${locacao.id}"
						readonly />
					<table>
						<tr>
							<td align="right" width="95"><label>Data da Locação:</label></td>
							<td align="left"><input type="text" class="data"
								name="locacao.dtlocacao" value="${locacao.dtlocacao}" /><br></td>
							<td align="right" width="80"><label>Data Inicio:</label></td>
							<td align="left"><input type="text" class="data"
								name="locacao.dtinicio" value="${locacao.dtinicio}" /></td>
							<br>
							<td align="right" width="80"><label>Data Fim:</label></td>
							<td align="left"><input type="text" class="data"
								name="locacao.dtfim" value="${locacao.dtfim}" /></td>
						</tr>
					</table>
				</fieldset>
				<table id="myDataTable">
					<thead>
						<tr>
							<th>Company name</th>
							<th>Address</th>
							<th>Town</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				<!-- <button id="btnAddNewRow">Add</button>
				<button id="btnDeleteRow">Delete</button> -->
				<div class="add_delete_toolbar" />
				<table align="center">
					<tr>
						<td><input type="submit" value="Salvar" class="salvar"
							icon="ui-icon-disk" /><br />
					</tr>
					</td>
					</tr>
				</table>

			</div>
		</div>
	</form>
	
	<form id="dialog-form" action="#" class="display" cellpadding="0" cellspacing="0" border="0">
		<label for="name">Name</label>
		<input type="text" name="name" id="name" class="required" rel="0" /> <br /> 
		<label for="name">Address</label>
		<input type="text" name="address" id="address" rel="1" /> <br /> 
		<label for="name" rel="2">Country</label>
		<select name="country" id="country">
			<option value="1">Serbia</option>
			<option value="2">France</option>
			<option value="3">Italy</option>
		</select> <br />
	</form>
</body>
<%@ include file="../../../footer.jsp"%>
        <script language="JavaScript" type="text/javascript">
            $(document).ready(function () {
                $('#dialog-form').dataTable().makeEditable();
            });
        </script>


