<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="titulo" value="Promedio ponderado" /><c:set var="seccion" value="promedio" />
<%@ include file="WEB-INF/jspf/header.jspf" %>
<div class="page-heading"><span class="eyebrow">EJERCICIO 01</span><h1>Promedio ponderado</h1><p class="text-secondary">Cada nota cuenta. Descubre tu resultado con los pesos de evaluación.</p></div>
<div class="row g-4"><div class="col-lg-8"><section class="card"><div class="card-body p-4 p-md-5"><h2 class="h4 mb-2">Ingresa tus notas</h2><p class="text-secondary mb-4">Escala de 0 a 20 · Hasta dos decimales</p>
<c:if test="${not empty error}"><div class="alert alert-danger" role="alert"><c:out value="${error}" /></div></c:if>
<form method="post" action="${pageContext.request.contextPath}/SvPromedio">
  <div class="row g-3 mb-4">
    <div class="col-sm-4"><label class="form-label" for="nota1">Nota 1 <span class="weight">20%</span></label><input class="form-control form-control-lg" id="nota1" name="nota1" type="number" min="0" max="20" step="0.01" required placeholder="0.00" value="<c:out value='${param.nota1}' />"></div>
    <div class="col-sm-4"><label class="form-label" for="nota2">Nota 2 <span class="weight">30%</span></label><input class="form-control form-control-lg" id="nota2" name="nota2" type="number" min="0" max="20" step="0.01" required placeholder="0.00" value="<c:out value='${param.nota2}' />"></div>
    <div class="col-sm-4"><label class="form-label" for="nota3">Nota 3 <span class="weight">50%</span></label><input class="form-control form-control-lg" id="nota3" name="nota3" type="number" min="0" max="20" step="0.01" required placeholder="0.00" value="<c:out value='${param.nota3}' />"></div>
  </div><button class="btn btn-primary" type="submit">Calcular promedio →</button>
</form></div></section></div><aside class="col-lg-4"><div class="info-card"><h2 class="h5">¿Cómo se calcula?</h2><p class="formula">N1 × 0.20 + N2 × 0.30<br>+ N3 × 0.50</p><hr><p class="mb-2"><strong>12.0</strong> es la nota mínima aprobatoria.</p><p class="small text-secondary mb-0">La condición se determina con el promedio exacto, sin redondearlo previamente.</p></div></aside></div>
<%@ include file="WEB-INF/jspf/footer.jspf" %>
