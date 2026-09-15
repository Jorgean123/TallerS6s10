<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="titulo" value="Panel de usuario" /><c:set var="seccion" value="acceso" />
<%@ include file="WEB-INF/jspf/header.jspf" %>
<div class="page-heading"><span class="eyebrow">EJERCICIO 03 · PANEL PERSONAL</span><h1>¡Bienvenido, <c:out value="${sessionScope.usuarioLogueado}" />!</h1>
    <p class="text-secondary">Tu sesión está activa. Ya puedes continuar con el laboratorio.</p></div>
<div class="alert alert-success" role="status">Acceso correcto. Tus credenciales fueron validadas.</div>
<section class="card"><div class="card-body p-4 p-md-5"><div class="d-flex justify-content-between align-items-start flex-wrap gap-3"><div>
    <span class="eyebrow">CUENTA ACTIVA</span><h2 class="h3 mt-2"><c:out value="${sessionScope.usuarioLogueado}" />
    </h2><p class="text-secondary">Selecciona un ejercicio o cierra tu sesión al terminar.</p></div>
    <span class="badge rounded-pill text-bg-success p-2">Sesión iniciada</span></div><div class="d-flex flex-wrap gap-3 mt-3">
        <a class="btn btn-primary" href="${pageContext.request.contextPath}/SvPromedio">Calcular promedio</a>
        <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/SvCarrito">Consultar carrito</a>
        <form method="post" action="${pageContext.request.contextPath}/SvLogout">
            <button class="btn btn-outline-danger" type="submit">Cerrar sesión</button></form></div></div></section>
<%@ include file="WEB-INF/jspf/footer.jspf" %>
