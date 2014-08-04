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
<title>Sistema de Locação de Equipamentos</title>	
</head>
<body>
<!-- <h3>Usuário: ${userSession.user.nome} <a href="${pageContext.request.contextPath}/logout"> Logout</h3> -->
<div id="wrapper">
	<div id="logo" class="container">
		<table>
		<tr><td width="280"></td><td><img src="${pageContext.request.contextPath}/images/logo_pagina.png" height="100" width="200"></img></td>
		<td><h1><a href="<c:url value="/index/index"/>">SISLOC</a></h1></td>
		</tr>
		</table>
		<p>Sistema de Locação de Equipamentos</p>
		
	</div>
	<%@ include file="../../../menu.jsp"%>
