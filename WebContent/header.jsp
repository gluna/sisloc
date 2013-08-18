<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<fmt:setLocale value="${locale}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="http://fonts.googleapis.com/css?family=Oxygen:400,700,300" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="${pageContext.request.contextPath}/css/menu.css" rel="stylesheet" type="text/css" media="screen" />
<link href="${pageContext.request.contextPath}/css/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
<sql:setDataSource var="ds"
	driver="org.postgresql.Driver"
	url="jdbc:postgresql:sisloc"
	user="postgres"
	password="postgres"
	scope="session"/>
<title>Sistema de Loca��o de Equipamentos</title>	
</head>
<body>
<!-- <h3>Usu�rio: ${userSession.user.nome} <a href="${pageContext.request.contextPath}/logout"> Logout</h3> -->
<div id="wrapper">
	<div id="logo" class="container">
		<table>
		<tr><td width="280"></td><td><img src="${pageContext.request.contextPath}/images/logo_pagina.png" height="100" width="200"></td>
		<td><h1><a href="<c:url value="/index/index"/>">SISLOC</a></h1></td>
		</tr>
		</table>
		<p>Sistema de Loca��o de Equipamentos</p>
		
	</div>
	<div id='cssmenu' class="container">
		<ul>
   			<li><a href="<c:url value="/index/index"/>"><span>Home</span></a></li>
   			<li class='has-sub'><a href='#'><span>Cadastrar</span></a>
      			<ul>
         			<li><a href="<c:url value="/clientes/cadastrar"/>"><span>Clientes</span></a></li>
         			<li><a href="<c:url value="/fornecedores/cadastrar"/>"><span>Fornecedores</span></a></li>
         			<li><a href="<c:url value="/produtos/cadastrar"/>"><span>Produtos</span></a></li>
         			<li><a href="<c:url value="/orcamentos/cadastrar"/>"><span>Or�amentos</span></a></li>
         			<li><a href="<c:url value="/locacoes/cadastrar"/>"><span>Loca��es</span></a></li>
         			<li><a href="<c:url value="/pagamentos/consultalocacao"/>"><span>Pagamentos</span></a></li>
         			<li><a href="<c:url value="/pagamentos/cadastrarcontasapagar"/>"><span>Contas a Pagar</span></a></li>
      			</ul>
   			</li>
   			<li class='has-sub'><a href='#'><span>Consultar</span></a>
      			<ul>
         			<li><a href="<c:url value="/clientes/consultanome"/>"><span>Clientes</span></a></li>
         			<li><a href="<c:url value="/fornecedores/consultanome"/>"><span>Fornecedores</span></a></li>
         			<li><a href="<c:url value="/produtos/consultanome"/>"><span>Produtos</span></a></li>
         			<li><a href="<c:url value="/orcamentos/consultaorcamento"/>"><span>Or�amentos</span></a></li>
         			<li><a href="<c:url value="/locacoes/consultalocacao"/>"><span>Loca��es</span></a></li>
      			</ul>
   			</li>
   			<li class='has-sub'><a href='#'><span>Relat�rios</span></a>
      			<ul>
         			<li><a href="<c:url value=""/>"><span>Entrada e Sa�da</span></a></li>
      			</ul>
   			</li>
   			
   			<li><a href='#'><span>Sobre</span></a></li>
   			<li class='last'><a href='#'><span>Contato</span></a></li>
		</ul>
	</div>
