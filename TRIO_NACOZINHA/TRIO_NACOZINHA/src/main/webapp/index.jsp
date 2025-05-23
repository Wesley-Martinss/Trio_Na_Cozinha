<%@page import="br.edu.ifsp.arq.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:import url="header.jsp" />

<!-- Estilo externo -->
<link rel="stylesheet" href="${ctx}/css/style.css">

<nav class="navbar navbar-expand-lg bg-marrom text-bege px-4 py-3">
	<div class="container-fluid justify-content-between">
		<a class="navbar-brand" href="#"> 
			<img src="imagens/logo/logo_pageindex.png" alt="Trio Na Cozinha" height="40">
		</a>
		<div class="d-flex align-items-center gap-3">
			<a href="views/extras/SobreNos.jsp" class="btn btn-outline-bege">Sobre nós</a>

			<c:choose>
				<c:when test="${not empty sessionScope.usuarioLogado}">
					<form class="d-flex" role="search" action="${ctx}/ReceitaServletDetalhada" method="POST">
						<input class="form-control me-2" type="search" name="busca" placeholder="Pesquisar">
						<button class="btn btn-bege" type="submit">Pesquisar</button>
					</form>
					<a href="views/receita/AddReceita.jsp" class="btn btn-bege">Adicionar Receita</a>
					<span class="text-bege">${sessionScope.usuarioLogado.nome}</span>
					<a href="views/usuario/Conta.jsp" class="btn btn-outline-bege">Conta</a>
				</c:when>
				<c:otherwise>
					<form class="d-flex" role="search" action="${ctx}/ReceitaServletDetalhada" method="POST">
						<input class="form-control me-2" type="search" name="busca" placeholder="Pesquisar">
						<button class="btn btn-bege" type="submit">Pesquisar</button>
					</form>
					<a href="views/usuario/LogarUsuario.jsp" class="btn btn-bege">Adicionar Receita</a>
					<a href="views/usuario/AddUsuario.jsp" class="btn btn-outline-bege">Cadastrar-se</a>
					<a href="views/usuario/LogarUsuario.jsp" class="btn btn-outline-bege">Logar</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</nav>

<div class="container my-5">
	<c:if test="${not empty sessionScope.usuarioLogado}">
		<h2 class="mb-4">Suas receitas</h2>
		<div class="row row-cols-1 row-cols-md-2 g-4">
			<c:forEach var="receita" items="${sessionScope.usuarioLogado.minhasReceitas}">
				<div class="col">
					<div class="card card-bege h-100 p-3" onclick="irParaReceitaMaisDetalhada5(${receita.id})">
						<img src="${ctx}/imagens/${receita.img}" class="card-img-top" alt="Imagem da Receita">
						<div class="card-body">
							<h5 class="card-title">${receita.nome}</h5>
							<p class="card-text">Autor: ${receita.autor}</p>
							<p>Tempo: ${receita.tempoDePreparoMinutos} min</p>
							<p>Porções: ${receita.qtddPorcoes}</p>
							<p>Ingredientes:</p>
							<ul>
								<c:forEach var="ingrediente" items="${receita.ingredientes}">
									<li>${ingrediente}</li>
								</c:forEach>
							</ul>
							<p>Modo de Preparo: ${receita.modoPreparo}</p>
							<p>Categorias:</p>
							<ul>
								<c:forEach var="categoria" items="${receita.categorias}">
									<li>${categoria}</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
</div>

<!-- CARROSSEL -->
<div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-inner">
		<div class="carousel-item active">
			<img src="imagens/logo/carrosellogo.png" class="d-block w-100" alt="Trio na Cozinha">
		</div>
		<div class="carousel-item">
			<img src="https://www.receiteria.com.br/wp-content/uploads/bolo-de-aniversario.jpeg"
				class="d-block w-100" alt="Bolo de Aniversário">
		</div>
		<div class="carousel-item">
			<img src="https://www.receiteria.com.br/wp-content/uploads/bolo-de-aniversario.jpeg"
				class="d-block w-100" alt="Comida Deliciosa">
		</div>
	</div>
	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Anterior</span>
	</button>
	<button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Próximo</span>
	</button>
</div>

<!-- TODAS AS RECEITAS -->
<div class="container my-5">
	<h2 class="mb-4">Todas as receitas</h2>
	<div class="row row-cols-1 row-cols-md-2 g-4">
		<c:forEach var="receita" items="${requestScope.receitas}">
			<div class="col">
				<div class="card card-bege h-100 p-3" onclick="irParaReceitaMaisDetalhada5(${receita.id})">
					<img src="${ctx}/imagens/${receita.img}" class="card-img-top" alt="Imagem da Receita">
					<div class="card-body">
						<h5 class="card-title">${receita.nome}</h5>
						<p class="card-text">Autor: ${receita.autor}</p>
						<p>Tempo: ${receita.tempoDePreparoMinutos} min</p>
						<p>Porções: ${receita.qtddPorcoes}</p>
						<p>Ingredientes:</p>
						<ul>
							<c:forEach var="ingrediente" items="${receita.ingredientes}">
								<li>${ingrediente}</li>
							</c:forEach>
						</ul>
						<p>Modo de Preparo: ${receita.modoPreparo}</p>
						<p>Categorias:</p>
						<ul>
							<c:forEach var="categoria" items="${receita.categorias}">
								<li>${categoria}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<script type="text/javascript">
		  const contextPath = "${pageContext.request.contextPath}";
		  function irParaReceitaMaisDetalhada5(id) {
		    window.location.href = contextPath + "/ReceitaServletDetalhada?id=" + id;
		  }
		</script>



<!-- CSS interno -->
<style>
	body {
		margin: 0;
		padding: 0;
	}
	.carousel-item img {
		width: 100vw;
		height: 500px;
		object-fit: cover;
	}
	.carousel-control-prev-icon, .carousel-control-next-icon {
		background-color: #ff6600;
		border-radius: 50%;
		padding: 10px;
	}
	.btn-saiba-mais {
		margin-top: 20px;
		display: block;
		background-color: #FFFFFF;
		color: white;
		padding: 10px 20px;
		border: none;
		border-radius: 8px;
		text-align: center;
		font-size: 18px;
		cursor: pointer;
		transition: background-color 0.3s;
	}
	.btn-saiba-mais:hover {
		background-color: #e65c00;
	}
</style>

<%@ include file="footer.jsp" %>
