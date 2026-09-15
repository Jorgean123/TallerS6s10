<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="titulo" value="Acceso al sistema" /><c:set var="seccion" value="acceso" />
<%@ include file="WEB-INF/jspf/header.jspf" %>
<div class="row g-5 align-items-center login-layout"><section class="col-lg-6"><span class="eyebrow">EJERCICIO 03</span><h1>Tu espacio.<br><span class="text-accent">A un paso.</span></h1><p class="lead text-secondary mt-3">Ingresa al sistema y accede a tu panel personal.</p><div class="demo-credentials mt-4"><span class="eyebrow">CUENTA DE DEMOSTRACIÓN</span><p class="mb-0 mt-2">Usuario: <strong>admin</strong><br>Contraseña: <strong>utp2026</strong></p></div></section>
<section class="col-lg-6"><div class="card"><div class="card-body p-4 p-md-5"><h2 class="h3">Iniciar sesión</h2><p class="text-secondary mb-4">Completa tus credenciales para continuar.</p>
<c:if test="${not empty error}"><div class="alert alert-danger" role="alert"><c:out value="${error}" /></div></c:if>
<c:if test="${param.salida eq '1'}"><div class="alert alert-success" role="status">Sesión cerrada correctamente.</div></c:if>
<form action="${pageContext.request.contextPath}/SvLogin" method="post"><div class="mb-3"><label class="form-label" for="txtUsuario">Usuario</label><input class="form-control form-control-lg" type="text" id="txtUsuario" name="txtUsuario" required maxlength="80" autocomplete="username" placeholder="Ingresa tu usuario" value="<c:out value='${param.txtUsuario}' />"></div><div class="mb-4"><label class="form-label" for="txtPassword">Contraseña</label><input class="form-control form-control-lg" type="password" id="txtPassword" name="txtPassword" required maxlength="128" autocomplete="current-password" placeholder="Ingresa tu contraseña"></div><button class="btn btn-primary w-100" type="submit">Ingresar al sistema →</button></form>
</div></div></section></div>
<%@ include file="WEB-INF/jspf/footer.jspf" %>
