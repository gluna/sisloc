<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<fmt:setLocale value="${locale}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link href="http://fonts.googleapis.com/css?family=Oxygen:400,700,300" rel="stylesheet" type="text/css" />
<link href="../css/style.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/menu.css" rel="stylesheet" type="text/css" media="screen" />
<link href="../css/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
<title>Sistema de Tarefas</title>	
</head>
<body>
<!-- <h3>Usu�rio: ${userSession.user.nome} <a href="${pageContext.request.contextPath}/logout"> Logout</h3> -->
<div id="wrapper">
	<div id="logo" class="container">
		<h1><a href="<c:url value="/index/index"/>">SISLOC</a></h1>
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
      			</ul>
   			</li>
   			<li><a href='#'><span>Sobre</span></a></li>
   			<li class='last'><a href='#'><span>Contato</span></a></li>
		</ul>
	</div>
