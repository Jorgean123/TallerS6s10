<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="titulo" value="Inicio" /><c:set var="seccion" value="inicio" />
<%@ include file="WEB-INF/jspf/header.jspf" %>
<section class="hero row g-4 align-items-center mb-5">
  <div class="col-lg-8"><span class="eyebrow">SEMANA 06 · SESIÓN 10</span><h1>Tres ejercicios.<br><span class="text-accent">Una experiencia web.</span></h1><p class="lead text-secondary mt-3 mb-4">Cálculo de notas, visualización de productos y acceso de usuarios. Explora las aplicaciones del laboratorio.</p><a class="btn btn-primary" href="${pageContext.request.contextPath}/SvPromedio">Comenzar práctica <span aria-hidden="true">→</span></a></div>
  <div class="col-lg-4"><div class="course-card"><span class="eyebrow">PRÁCTICA DE APLICACIÓN</span><div class="course-number">06<span>/10</span></div><h2 class="h5">Servlets, JSP, JSTL y EL</h2><p class="text-secondary mb-0">Facultad de Ingeniería<br>Ingeniería de Sistemas e Informática</p></div></div>
</section>
<div class="d-flex justify-content-between align-items-center mb-3"><h2 class="h4 mb-0">Ejercicios del laboratorio</h2><span class="small text-secondary">03 módulos</span></div>
<section class="row g-4">
  <div class="col-md-4"><article class="card exercise-card h-100"><div class="card-body"><span class="module-number">01</span><h3 class="h4 mt-4">Promedio ponderado</h3><p class="text-secondary">Ingresa tres notas y consulta tu promedio final y condición académica.</p><div class="tags"><span>20%</span><span>30%</span><span>50%</span></div><a class="module-link" href="${pageContext.request.contextPath}/SvPromedio">Calcular promedio →</a></div></article></div>
  <div class="col-md-4"><article class="card exercise-card h-100"><div class="card-body"><span class="module-number">02</span><h3 class="h4 mt-4">Carrito de compras</h3><p class="text-secondary">Revisa los productos, las cantidades y el detalle del importe total.</p><div class="tags"><span>4 productos</span><span>Soles · PEN</span></div><a class="module-link" href="${pageContext.request.contextPath}/SvCarrito">Ver carrito →</a></div></article></div>
  <div class="col-md-4"><article class="card exercise-card h-100"><div class="card-body"><span class="module-number">03</span><h3 class="h4 mt-4">Acceso al sistema</h3><p class="text-secondary">Inicia sesión para entrar al panel y recibir una bienvenida personalizada.</p><div class="tags"><span>Inicio de sesión</span></div><a class="module-link" href="${pageContext.request.contextPath}/login.jsp">Ingresar al sistema →</a></div></article></div>
</section>
<%@ include file="WEB-INF/jspf/footer.jspf" %>
