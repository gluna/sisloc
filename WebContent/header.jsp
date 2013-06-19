<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setLocale value="${locale}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="http://fonts.googleapis.com/css?family=Oxygen:400,700,300" rel="stylesheet" type="text/css" />
<link href="../css/style.css" rel="stylesheet" type="text/css" media="screen" />
<title>Sistema de Tarefas</title>	
</head>
<body>
<!-- <h3>Usuário: ${userSession.user.nome} <a href="${pageContext.request.contextPath}/logout"> Logout</h3> -->
<div id="wrapper">
	<div id="logo" class="container">
		<h1><a href="<c:url value="/index/index"/>">SISLOC</a></h1>
		<p>Sistema de Locação de Equipamentos</p>
	</div>
		<div id="menu-wrapper">
		<div id="menu" class="container">
			<ul>
				<li><a href="<c:url value="/clientes/cadastrar"/>">Cadastrar</a></li>
				<li><a href="<c:url value="/produtos/cadastrar"/>">Produtos</a></li>
				<li><a href="#">alguma coisa</a></li>
				<li><a href="#">Photos</a></li>
				<li><a href="#">About Us</a></li>
				<li><a href="#">Links</a></li>
				<li><a href="#">Contact Us</a></li>
			</ul>
		</div>
	</div>
